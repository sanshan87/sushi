{literal}
<style>
.pagination {
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 12px;
	overflow: hidden;
}
.pagination a {
	display: block;
	float: left;
	background-color: #c9262b;
	margin-right: 5px;
	margin-bottom: 5px;
	padding: 7px 4px;
	min-width: 22px;
	text-align: center;
	//border: 1px solid #ffffff;
	text-decoration: none;
	color: #000;
}
.pagination a.selected:hover,
.pagination a.selected {
	background-color: #c9262b;
	color: #ffffff;
	border-color: #008fe9;
}
.pagination a:hover {
	background-color: #ec797d;
}

.pagination a.next_page_link, .pagination a.prev_page_link{
	border: none;
	background: none;
}
</style>
{/literal}


	<div class="footer-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xs-12 hidden-xs">
				{get_rolls var=rolls id=6}
				{if $rolls}
					<ul class="footer-nav list-unstyled">
						<li class="menu-header">{$rolls->name}</li>
							{foreach $rolls->subcategories as $subcat}
							{if $subcat->visible}
								<li><a href="/catalog/{$subcat->url}">{$subcat->name}</a></li>
							{/if}
							{/foreach}
					</ul>
				{/if}	
					<ul class="footer-nav list-unstyled border-right">
						<li class="menu-header">Меню</li>
						{if $categories}
						{foreach $categories as $c}
							{* Показываем только видимые категории *}
							{if $c->visible}
								<li>
									<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape}</a>
								</li>
							{/if}
						{/foreach}
						{/if}
					</ul>
					<ul class="footer-nav list-unstyled">
					{foreach $pages as $p}
					{* Выводим только страницы из первого меню *}
						{if $p->menu_id == 1}
						<li {if $page && $page->id == $p->id}class="selected"{/if}>
							<a href="{$p->url}">{$p->name|escape}</a>
						</li>
						{/if}
					{/foreach}
					</ul>
				</div>
				<div class="col-md-6 col-xs-12">
					<div class="f-contacts">
						<div><a href="tel:+74862303010">30-30-10</a> (Северный / Железнодорожный / Советский р-н)</div>
						<div><a href="tel:+74862303020">30-30-20</a> (Заводской / Советский р-н)</div>
					</div>
					<div class="f-worktime">
						<p>Время работы:</p> 
						вс - чт с 10-00 до 22-00<br>
						пт - сб с 10-00 до 23-00<br>
						Без перерывов и выходных
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-7 col-xs-12">
					<span class="f-copyright">© Сушитория. 2016 г. Все права защищены.</span>
					<a href="https://vk.com/sushitoriya" class="f-social">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
				</div>
				<div class="col-sm-4 col-xs-12 col-sm-offset-1">
					<div class="f-author">Создание сайта: <a href="#">студия «Соль»</a></div>
				</div>
			</div>
		</div>
	</footer>