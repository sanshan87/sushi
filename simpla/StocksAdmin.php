<?php 

require_once('api/Simpla.php');

class StocksAdmin extends Simpla
{
	public function fetch()
	{
		// Обработка действий
	  	if($this->request->method('post')) 
	  	{
			// Действия с выбранными
			$ids = $this->request->post('check');
			if(is_array($ids)) 
			{
				switch($this->request->post('action'))
				{
				    case 'disable':
				    {
						$this->stocks->update_stock($ids, array('visible'=>0));	      
						break;
				    }
				    case 'enable':
				    {
						$this->stocks->update_stock($ids, array('visible'=>1));	      
				        break;
				    }
				    case 'delete':
				    {
					    foreach($ids as $id)
							$this->stocks->delete_stock($id);    
				        break;
				    }
				}		
			}
	 	}

		$stocks = $this->stocks->get_stocks();
		$this->design->assign('stocks', $stocks);
		return $this->design->fetch('stocks.tpl');
	}
}
?>