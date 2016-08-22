<?php

require_once('View.php');

class StocksView extends View
{
	function fetch()
	{
		$stocks = $this->stocks->get_real_stocks(array('visible' => 1));
		$curWeekDay = date('w');
		foreach($this->stocks->get_real_stocks(array('visible' => 1)) as $s) {
			if($curWeekDay == 6 || $curWeekDay == 0) {
				$s->start = $s->we_start;
				$s->end = $s->we_end;
			} else {
				$s->start = $s->wd_start;
				$s->end = $s->wd_end;
			}
			
			$stocks[$s->id] = $s;
		}
		$this->design->assign('stocks', $stocks);
		return $this->design->fetch('stocks.tpl');
	}
}