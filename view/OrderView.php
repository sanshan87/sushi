<?PHP
error_reporting(0);
ini_set('display_errors','off');
/**
 * Simpla CMS
 *
 * @copyright 	2009 Denis Pikusov
 * @link 		http://simp.la
 * @author 		Denis Pikusov
 *
 * Корзина покупок
 * Этот класс использует шаблон cart.tpl
 *
 */
 
require_once('View.php');

class OrderView extends View
{
	public function __construct()
	{
		parent::__construct();
	}

	//////////////////////////////////////////
	// Основная функция
	//////////////////////////////////////////
	function fetch()
	{
		// Скачивание файла
		if($this->request->get('file'))
		{
			return $this->download();
		}
		else
		{
			return $this->fetch_order();
		}
	
	}
	
	function fetch_order()
	{
		$cart = $this->cart->get_cart();
		
		if($_SERVER['REQUEST_METHOD'] == 'POST' and $_POST['checkout'] and count($cart->purchases)){

			$order = new stdClass;
			$order->delivery_id = $this->request->post('delivery_id', 'integer');
			$order->payment_method_id = $this->request->post('payment_method_id', 'integer');
			$order->name        = $this->request->post('name');
			$order->address     = $this->request->post('address');
			$order->phone       = $this->request->post('phone');
			//$order->comment     = $this->request->post('comment');
			$order->ip      	= $_SERVER['REMOTE_ADDR'];
			$this->design->assign('delivery_id', $order->delivery_id);
			$this->design->assign('name', $order->name);
			$this->design->assign('phone', $order->phone);
			$this->design->assign('address', $order->address);
			$captcha_code =  $this->request->post('captcha_code', 'string');
			if(empty($order->name)){
    		$this->design->assign('error', 'empty_name');
			header('Location: '.$this->config->root_url.'/cart');
			exit();
			}
			elseif($_SESSION['captcha_code'] != $captcha_code || empty($captcha_code))
			{
			$this->design->assign('error', 'captcha');
			header('Location: '.$this->config->root_url.'/cart');
			exit();
			}
			else
			{
	    	// Добавляем заказ в базу
	    	$order_id = $this->orders->add_order($order);
			$_SESSION['order_id'] = $order_id;
	    	
	    	// Добавляем товары к заказу
	    	foreach($cart->purchases as $elementCart)
	    	{
	    		$this->orders->add_purchase(array('order_id'=>$order_id, 'variant_id'=>intval($elementCart->variant->id), 'amount'=>intval($elementCart->amount)));
	    	}
	    	$order = $this->orders->get_order($order_id);
	    	// Стоимость доставки
			$delivery = $this->delivery->get_delivery($order->delivery_id);
	    	if(!empty($delivery) && $delivery->free_from > $order->total_price)
	    	{
	    		$this->orders->update_order($order->id, array('delivery_price'=>$delivery->price, 'separate_delivery'=>$delivery->separate_payment));
	    	}
			
			// Отправляем письмо пользователю
			//$this->notify->email_order_user($order->id);
	    	
			// Отправляем письмо администратору
			//$this->notify->email_order_admin($order->id);
	    	
	    	// Очищаем корзину (сессию)
			$this->cart->empty_cart();		
			// Перенаправляем на страницу заказа
			$cart = $this->cart->get_cart();
		}
		}
		if($url = $this->request->get('url', 'string'))
			$order = $this->orders->get_order((string)$url);
		elseif(!empty($_SESSION['order_id']))
			$order = $this->orders->get_order(intval($_SESSION['order_id']));
		else
			return false;
			
		if(!$order)
			return false;
						
		$purchases = $this->orders->get_purchases(array('order_id'=>intval($order->id)));
		if(!$purchases)
			return false;		
		$products_ids = array();
		$variants_ids = array();
		foreach($purchases as $purchase)
		{
			$products_ids[] = $purchase->product_id;
			$variants_ids[] = $purchase->variant_id;
		}
		$products = array();
		foreach($this->products->get_products(array('id'=>$products_ids)) as $p)
			$products[$p->id] = $p;
		
		$images = $this->products->get_images(array('product_id'=>$products_ids));
		foreach($images as $image)
			$products[$image->product_id]->images[] = $image;
		
		$variants = array();
		foreach($this->variants->get_variants(array('id'=>$variants_ids)) as $v)
			$variants[$v->id] = $v;
			
		foreach($variants as $variant)
			$products[$variant->product_id]->variants[] = $variant;

		foreach($purchases as &$purchase)
		{
			if(!empty($products[$purchase->product_id]))
				$purchase->product = $products[$purchase->product_id];
			if(!empty($variants[$purchase->variant_id]))
			{
				$purchase->variant = $variants[$purchase->variant_id];
			}
		}
		
		// Способ доставки
		$delivery = $this->delivery->get_delivery($order->delivery_id);
		$this->design->assign('delivery', $delivery);
			
		$this->design->assign('order', $order);
		$this->design->assign('purchases', $purchases);

		// Способ оплаты
		if($order->payment_method_id)
		{
			$payment_method = $this->payment->get_payment_method($order->payment_method_id);
			$this->design->assign('payment_method', $payment_method);
		}
			
		// Варианты оплаты
		$payment_methods = $this->payment->get_payment_methods(array('delivery_id'=>$order->delivery_id, 'enabled'=>1));
		$this->design->assign('payment_methods', $payment_methods);

		// Все валюты
		$this->design->assign('all_currencies', $this->money->get_currencies());

		
		
		// Выводим заказ
	return $this->body = $this->design->fetch('order.tpl');
	}
	
	private function download()
	{
		$file = $this->request->get('file');
		
		if(!$url = $this->request->get('url', 'string'))
			return false;
			
		$order = $this->orders->get_order((string)$url);
		if(!$order)
			return false;
			
		if(!$order->paid)
			return false;
						
		// Проверяем, есть ли такой файл в покупках	
		$query = $this->db->placehold("SELECT p.id FROM __purchases p, __variants v WHERE p.variant_id=v.id AND p.order_id=? AND v.attachment=?", $order->id, $file);		$this->db->query($query);
		if($this->db->num_rows()==0)
			return false;
		
		header("Content-type: application/force-download");
		header("Content-Disposition: attachment; filename=\"$file\"");
		header("Content-Length: ".filesize($this->config->root_dir.$this->config->downloads_dir.$file));
		readfile($this->config->root_dir.$this->config->downloads_dir.$file);
		
		exit();
	}
	
}