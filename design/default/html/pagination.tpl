{* Постраничный вывод *}
{literal}
<style>
.pagination li a {font-size:16px; color: #000;}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    background-color: #dd3e48;
    border-color: #dd3e48;
</style>
{/literal}
{if $total_pages_num>1}
{* Скрипт для листания через ctrl → *}
{* Ссылки на соседние страницы должны иметь id PrevLink и NextLink *}
<script type="text/javascript" src="js/ctrlnavigate.js"></script>
<!-- Листалка страниц -->
<!--<div class="row">-->
<div class="col-xs-12">
<div class="pagination-block hidden-xs" style="text-align: center;">
	<ul class="pagination">  
		{* Количество выводимых ссылок на страницы *}
		{$visible_pages = 9}
		{* По умолчанию начинаем вывод со страницы 1 *}
		{$page_from = 1}		
		{* Если выбранная пользователем страница дальше середины "окна" - начинаем вывод уже не с первой *}
		{if $current_page_num > floor($visible_pages/2)}
			{$page_from = max(1, $current_page_num-floor($visible_pages/2)-1)}
		{/if}	
		
		{* Если выбранная пользователем страница близка к концу навигации - начинаем с "конца-окно" *}
		{if $current_page_num > $total_pages_num-ceil($visible_pages/2)}
			{$page_from = max(1, $total_pages_num-$visible_pages-1)}
		{/if}
		
		{* До какой страницы выводить - выводим всё окно, но не более ощего количества страниц *}
		{$page_to = min($page_from+$visible_pages, $total_pages_num-1)}

		{* Ссылка на 1 страницу отображается всегда *}
		<li {if $current_page_num==1}class="active"{/if}><a href="{url page=1}">1</a></li>
		
		{* Выводим страницы нашего "окна" *}	
		{section name=pages loop=$page_to start=$page_from}
			{* Номер текущей выводимой страницы *}	
			{$p = $smarty.section.pages.index+1}	
			{* Для крайних страниц "окна" выводим троеточие, если окно не возле границы навигации *}	
			{if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $total_pages_num-1)}	
			<li {if $p==$current_page_num}class="active"{/if}><a  href="{url page=$p}">...</a></li>
			{else}
			<li {if $p==$current_page_num}class="active"{/if}><a  href="{url page=$p}">{$p}</a></li>
			{/if}
		{/section}
		{* Ссылка на последнююю страницу отображается всегда *}
		<li {if $current_page_num==$total_pages_num}class="active"{/if}>	
			<a  href="{url page=$total_pages_num}">{$total_pages_num}</a>
		</li>	
		<li><a style="border: 1px solid #ddd;" href="{url page=all}">все</a></li>
		{if $current_page_num>1}
		<li><a class="prev_page_link" style="border: 1px solid #ddd;" href="{url page=$current_page_num-1}">←назад</a></li>
		{/if}
		{if $current_page_num<$total_pages_num}
		<li><a class="next_page_link" style="border: 1px solid #ddd;" href="{url page=$current_page_num+1}">вперед→</a></li>
		{/if}
	</ul>
</div>
<div class="pagination-block visible-xs" style="text-align: center;">
	<ul class="pagination">
		<li><a style="border: 1px solid #ddd;" href="{url page=all}">все</a></li>
		{if $current_page_num>1}
		<li><a class="prev_page_link" style="border: 1px solid #ddd;" href="{url page=$current_page_num-1}">← назад</a></li>
		{/if}
		{if $current_page_num<$total_pages_num}
		<li><a class="next_page_link" style="border: 1px solid #ddd;" href="{url page=$current_page_num+1}">вперед →</a></li>
		{/if}
	</ul>
</div>
</div>
<!--</div>-->
<!-- Листалка страниц (The End) -->
{/if}
