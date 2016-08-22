<?php 

require_once('api/Simpla.php');

class StockAdmin extends Simpla
{

	public function fetch()
	{
		$stock = new stdClass;
		if($this->request->method('POST')) {
			$stock->id = $this->request->post('id', 'integer');
			$stock->name = $this->request->post('name');
			$stock->short_annotation = $this->request->post('short_annotation');
			$stock->annotation = $this->request->post('annotation');
			$stock->visible = $this->request->post('visible', 'boolean');
			$stock->wd_start = $this->request->post('wd_start', 'time');
			$stock->wd_end = $this->request->post('wd_end', 'time');
			$stock->we_start = $this->request->post('we_start', 'time');
			$stock->we_end = $this->request->post('we_end', 'time');
			$stock->data = date("Y-m-d",time());
			if(empty($stock->id)) {
  				$stock->id = $this->stocks->add_stock($stock);
				$stock = $this->stocks->get_stock($stock->id);
  				$this->design->assign('message_success', 'added');
    		} else {
    			$this->stocks->update_stock($stock->id, $stock);
				$stock = $this->stocks->get_stock($stock->id);
				$this->design->assign('message_success', 'updated');
    		}

    		if($stock->id) {
    			// Загрузка изображений		
				if($base64m = $this->request->post('imgData') and $base64o = $this->request->post('imgDataOrig')){
					// Удаление изображений
					if(!preg_match('/base64/i', $base64o)) $base64o = $this->image->getDataURI($base64o);
					if($stock->filename) {
						$this->stocks->delete_image($stock->id);
					}
					$name = md5(mktime());
					$nameImage = $this->image->saveBase64($base64m,$name,'mini');
					if($nameImage){
						$this->stocks->add_image($stock->id, $nameImage);
					}else{
						$this->design->assign('error', 'error uploading image');
					}
					$nameImageOrig = $this->image->saveBase64($base64o,$name,'orig');
					if(!$nameImageOrig){
						$this->design->assign('error', 'error uploading image');
					}					
				}
				$stock = $this->stocks->get_stock($stock->id);
    		}
		} else {
			$id = $this->request->get('id', 'integer');
			if(!empty($id)) {
				$stock = $this->stocks->get_stock(intval($id));			
			}
		}

		$this->design->assign('stock', $stock);
		return $this->design->fetch('stock.tpl');
	}

}
?>