<!DOCTYPE html>
{*
	Общий вид страницы
	Этот шаблон отвечает за общий вид страниц без центрального блока.
*}
<html lang="ru">
<head>
	<base href="{$config->root_url}/"/>
	<title>{$meta_title|escape}</title>
	
	{* Метатеги *}
	<meta charset="UTF-8">
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords"    content="{$meta_keywords|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	{* Канонический адрес страницы *}
	{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}
	
	{* Стили *}
	<link rel="stylesheet" href="design/{$settings->theme|escape}/bower_components/bootstrap/dist/css/bootstrap.min.css" />
	<!-- endbower -->
	<link rel="stylesheet" href="design/{$settings->theme|escape}/css/main.css">
	<link rel="stylesheet" href="design/{$settings->theme|escape}/plugins/owl-carousel/owl.carousel.css">
	{* JQuery *}
	<script src="design/{$settings->theme|escape}/bower_components/jquery/dist/jquery.js"></script>
	
	{* Всплывающие подсказки для администратора *}
	{if $smarty.session.admin == 'admin'}
	<script src ="js/admintooltip/admintooltip.js" type="text/javascript"></script>
	<link   href="js/admintooltip/css/admintooltip.css" rel="stylesheet" type="text/css" /> 
	{/if}
	{* Аяксовая корзина *}
	<script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
	<script src="design/{$settings->theme}/js/ajax_cart.js"></script>
	
	{* js-проверка форм *}
	<script src="js/baloon/js/baloon.js" type="text/javascript"></script>
	<link   href="js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 
	
	{* Автозаполнитель поиска *}
	{literal}
	<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
	<style>
		.autocomplete-suggestions{
		background-color: #ffffff;
		overflow: hidden;
		border: 1px solid #e0e0e0;
		overflow-y: auto;
		}
		.autocomplete-suggestions .autocomplete-suggestion{cursor: default;}
		.autocomplete-suggestions .selected { background:#F0F0F0; }
		.autocomplete-suggestions div { padding:2px 5px; white-space:nowrap; }
		.autocomplete-suggestions strong { font-weight:normal; color:#3399FF; }
	</style>	
	<script>
	$(function() {
		//  Автозаполнитель поиска
		$(".input_search").autocomplete({
			serviceUrl:'ajax/search_products.php',
			minChars:1,
			noCache: false, 
			onSelect:
				function(suggestion){
					 $(".input_search").closest('form').submit();
				},
			formatResult:
				function(suggestion, currentValue){
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
	  				return (suggestion.data.image?"<img align=absmiddle src='"+suggestion.data.image+"'> ":'') + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
				}	
		});
	});
	</script>
	{/literal}
		
			
</head>
<body>
	<div class="basket-shadow hidden"></div>
	<div class="side-basket" id="cart_informer">
		{include file='cart_informer.tpl'}
	</div>

	<nav class="navbar navbar-default">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="main-navbar">
					<ul class="nav navbar-nav" id="menu">
					{foreach $pages as $p}
						{* Выводим только страницы из первого меню *}
						{if $p->menu_id == 1}
						<li {if $page && $page->id == $p->id}class="selected"{/if}>
							<a data-page="{$p->id}" href="{$p->url}">{$p->name|escape}</a>
						</li>
						{/if}
					{/foreach}
					</ul>
						
					<ul class="nav navbar-nav navbar-right nav-social hidden-sm">
						<li><a href="http://vk.com/">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
					</ul>

					<form class="navbar-form navbar-right" role="search" id="navbar-form" action="/products">
						<div class="form-group">
							<input type="text" class="form-control input_search" placeholder="Поиск" name="keyword" value="{$keyword|escape}">
						</div>
						<button type="submit" class="btn btn-search"><span class="glyphicon glyphicon-search"></span></button>
					</form>
				</div>
			</div>
		</div>
	</nav>

	<header class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<a href="#"><img src="design/{$settings->theme|escape}/images/header-logo.png" alt="Сушитория" class="img-responsive h-logo"></a>
				</div>
				<div class="col-md-6 col-sm-7 col-xs-12 text-center">
					<div class="h-contacts">
						<div><a href="tel:+74862303010">30-30-10</a> (Северный / Железнодорожный / Советский р-н)</div>
						<div><a href="tel:+74862303020">30-30-20</a> (Заводской / Советский р-н)</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-2 col-xs-12">
					<a href="/cart" class="h-basket">
						<div class="b-icon">
							<div class="b-icon-count" id="cnt_in_cart">{$cart->total_products}</div>
						</div>
						<div class="b-text hidden-sm">
							<b>Корзина</b><span id="txt_cnt">В корзине {$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}</span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</header>

	<div class="second-header slider-header">
		<div class="container">
			<div class="row flex-row align-stretch">
				<div class="col-sm-9">
					<div class="slider-info">
						<div class="working-info">
							<p><b>Доставка суши и роллов</b></p>
							<p>Бесплатная<br>доставка от 400р.</p>
							<img src="design/{$settings->theme|escape}/images/time-icon.png" alt="Time" class="time-icon">
							<p><b>Время работы:</b></p>
							<p>вс - чт с 10-00 до 22-00<br>пт - сб с 10-00 до 23-00</p>
							<p>Без перерывов<br>и выходных</p>
						</div>
						<div class="owl-carousel">
							<div><a href="#"><img src="design/{$settings->theme|escape}/images/slide-1.jpg" alt="Суши"></a></div>
							<div><a href="#"><img src="design/{$settings->theme|escape}/images/slide-1.jpg" alt="Суши"></a></div>
							<div><a href="#"><img src="design/{$settings->theme|escape}/images/slide-1.jpg" alt="Суши"></a></div>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<ul class="main-menu">
						<li class="menu-header">Меню</li>										
						{* функция вывода дерева категорий *}
						{function name=categories_tree}
						{if $categories}
						{foreach $categories as $c}
							{* Показываем только видимые категории *}
							{if $c->visible}
								<li>
								{if $c->subcategories|@count>0}
									<div class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$c->name|escape} <span>(4)</span></a>
											<ul class="dropdown-menu"> 
												{foreach $c->subcategories as $subCat}
												<li><a {if $category->id == $subCat->id}class="selected"{/if} href="catalog/{$subCat->url}">{$subCat->name|escape}</a></li>
												{/foreach}
											</ul>
									</div>
								{else}
									<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape} <span>(4)</span></a>
								{/if}
								</li>
							{/if}
						{/foreach}
						{/if}
						{/function}
						{categories_tree categories=$categories}
					</ul>
				</div>
			</div>
		</div>
	</div>

{$content}

	<div class="footer-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xs-12 hidden-xs">
					<ul class="footer-nav list-unstyled">
						<li class="menu-header">Роллы</li>
						<li><a href="#">Ассорти</a></li>
						<li><a href="#">Жареные</a></li>
						<li><a href="#">Запеченые</a></li>
						<li><a href="#">Классика</a></li>
						<li><a href="#">Сеты</a></li>
						<li><a href="#">Сложные</a></li>
					</ul>
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
					<a href="http://vk.com/" class="f-social">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
				</div>
				<div class="col-sm-4 col-xs-12 col-sm-offset-1">
					<div class="f-author">Создание сайта: <a href="#">студия «Соль»</a></div>
				</div>
			</div>
		</div>
	</footer>
	<script src="design/{$settings->theme|escape}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- endbower -->
	<script src="design/{$settings->theme|escape}/js/main.js"></script>
	<script src="design/{$settings->theme|escape}/plugins/owl-carousel/owl.carousel.min.js"></script>
</body>
</html>