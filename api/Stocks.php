<?php

require_once('Simpla.php');

class Stocks extends Simpla
{

	/*
	*
	* Функция возвращает акцию по её id
	*
	*/
	public function get_stock($id)
	{
		$where = $this->db->placehold(' WHERE id=? ', intval($id));
		
		$query = "SELECT id, name, short_annotation, annotation, filename, visible, wd_start, wd_end, we_start, we_end
		          FROM __stocks $where LIMIT 1";

		$this->db->query($query);
		return $this->db->result();
	}

	/*
	*
	* Функция возвращает массив акций
	*
	*/
	public function get_stocks($filter = array())
	{	
		$limit = 10;
		$stocks = array();
		
		if(isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND visible=?', intval($filter['visible']));

		if(isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		$sql_limit = $this->db->placehold(' LIMIT ?', $limit);

		$query = "SELECT id, name, short_annotation, annotation, filename, visible, wd_start, wd_end, we_start, we_end
		          FROM __stocks 
		          WHERE 1 $visible_filter 
		          ORDER BY id
		          $sql_limit";

		$this->db->query($query);
		
		foreach($this->db->results() as $stock)
			$stocks[$stock->id] = $stock;
			
		return $stocks;
	}

	/*
	*
	* Добавить акцию
	*
	*/
	public function add_stock($stock)
	{	
		$query = $this->db->placehold('INSERT INTO __stocks SET ?%', $stock);
		if(!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();
		return $id;
	}

	/*
	*
	* Обновить акцию
	*
	*/
	public function update_stock($id, $stock)
	{	
		$query = $this->db->placehold('UPDATE __stocks SET ?% WHERE id in (?@)', $stock, (array)$id);
		if(!$this->db->query($query))
			return false;
		return $id;
	}

	/*
	*
	* Удалить акцию
	*
	*/	
	public function delete_stock($id)
	{
		if(!empty($id))
		{
			$query = $this->db->placehold("DELETE FROM __stocks WHERE id=? LIMIT 1", intval($id));
			if($this->db->query($query))
				return true;
		}
		return false;
	}

	public function add_image($stock_id, $filename, $name = '')
	{
		if($stock_id)
		{
			$query = $this->db->placehold("UPDATE __stocks SET filename=? WHERE id=?", $filename, $stock_id);
			$this->db->query($query);
		}
		return($id);
	}

	public function delete_image($stock_id)
	{
		$query = $this->db->placehold("SELECT filename FROM __stocks WHERE id=?", $stock_id);
		$this->db->query($query);
		$filename = $this->db->result('filename');
		$query = $this->db->placehold("UPDATE __stocks SET filename='' WHERE id=? LIMIT 1", $stock_id);
		$this->db->query($query);
		if($filename)
		{			
			$file = pathinfo($filename, PATHINFO_FILENAME);
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			
			// Удалить все ресайзы
			$rezised_images = glob($this->config->root_dir.$this->config->resized_images_dir.$file.".*x*.".$ext);
			if(is_array($rezised_images))
			foreach (glob($this->config->root_dir.$this->config->resized_images_dir.$file.".*x*.".$ext) as $f)
				@unlink($f);
				
			$rezised_images2 = glob($this->config->root_dir.$this->config->resized_images_dir.str_replace('_mini','_orig',$file).".*x*.".$ext);
			if(is_array($rezised_images2))
			foreach (glob($this->config->root_dir.$this->config->resized_images_dir.str_replace('_mini','_orig',$file).".*x*.".$ext) as $f)
				@unlink($f);

			@unlink($this->config->root_dir.$this->config->original_images_dir.$filename);	
			@unlink($this->config->root_dir.$this->config->original_images_dir.str_replace('_mini','_orig',$filename));
		}
	}
	
}