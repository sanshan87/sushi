<?php
	session_start();
	require_once('../api/Simpla.php');
	$simpla = new Simpla();
	$result = array();
	$simpla->cart->add_item($simpla->request->get('variant', 'integer'), $simpla->request->get('amount', 'integer'));
	$cart = $simpla->cart->get_cart();
	$simpla->design->assign('cart', $cart);
	
	$currencies = $simpla->money->get_currencies(array('enabled'=>1));
	if(isset($_SESSION['currency_id']))
		$currency = $simpla->money->get_currency($_SESSION['currency_id']);
	else
		$currency = reset($currencies);
	$simpla->design->assign('currency',	$currency);
	$result['cart'] = $simpla->design->fetch('cart_informer.tpl');
	$result['count'] = $simpla->cart->getCountInCart();
	$result['text'] = "В корзине {$result['count']} ".$simpla->design->plural_modifier($result['count'],'товар','товаров','товара');
	header("Content-type: application/json; charset=UTF-8");
	header("Cache-Control: must-revalidate");
	header("Pragma: no-cache");
	header("Expires: -1");		
	print json_encode($result);
