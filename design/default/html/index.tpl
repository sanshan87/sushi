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
	<!--<link href="design/{$settings->theme|escape}/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="design/{$settings->theme|escape}/design/{$settings->theme|escape}/images/favicon.ico" rel="icon"          type="image/x-icon"/>
	<link href="design/{$settings->theme|escape}/design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>-->
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
	<!--<script src="design/{$settings->theme}/js/ajax_cart.js"></script>-->
	
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
	<div class="side-basket">
		<a href="#" class="sb-btn">
			<div class="h-btn">
				<span class="basket-count">2</span>
			</div>
		</a>

		<div class="basket">
			<div class="basket-header">
				<span class="bh-name">Корзина</span>
				<a href="#" class="basket-close">Свернуть</a>
			</div>
	
			<div class="items-wrap">
				<ul class="basket-items list-unstyled">
					<li class="b-item">
						<div class="b-price-img hidden-xs">
							<img src="design/{$settings->theme|escape}/images/b-price-1.jpg" alt="Товар" class="img-responsive">
						</div>
						<div class="b-price-info">
							<a href="#" class="price-name">Гроза дракона</a>
							<div class="form-inline">
								<label class="price-count" for="b-item-1">Кол-во:</label>
								<input type="text" class="form-control" id="b-item-1">
							</div>
						</div>
						<div class="b-price-cost">230 руб.</div>
						<div class="b-price-close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					</li>
					<li class="b-item">
						<div class="b-price-img hidden-xs">
							<img src="design/{$settings->theme|escape}/images/b-price-1.jpg" alt="Товар" class="img-responsive">
						</div>
						<div class="b-price-info">
							<a href="#" class="price-name">Гроза дракона</a>
							<div class="form-inline">
								<label class="price-count" for="b-item-1">Кол-во:</label>
								<input type="text" class="form-control" id="b-item-1">
							</div>
						</div>
						<div class="b-price-cost">230 руб.</div>
						<div class="b-price-close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					</li>
					<li class="b-item">
						<div class="b-price-img hidden-xs">
							<img src="design/{$settings->theme|escape}/images/b-price-1.jpg" alt="Товар" class="img-responsive">
						</div>
						<div class="b-price-info">
							<a href="#" class="price-name">Гроза дракона</a>
							<div class="form-inline">
								<label class="price-count" for="b-item-1">Кол-во:</label>
								<input type="text" class="form-control" id="b-item-1">
							</div>
						</div>
						<div class="b-price-cost">230 руб.</div>
						<div class="b-price-close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					</li>
				</ul>
			</div>
			

			<div class="basket-buttons">
				<div class="basket-total">Итого к оплате: <b>1800 руб.</b></div>
				<div><a href="#" class="link">Продолжить покупки</a></div>
				<div><a href="#" class="btn">Оформить заказ</a></div>
			</div>
		</div>
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
					<ul class="nav navbar-nav">
						<li><a href="#">Главная</a></li>
						<li><a href="#">Акции</a></li>
						<li><a href="#">Скидки</a></li>
						<li><a href="#">Доставка и оплата</a></li>
						<li><a href="#">Контакты</a></li>
					</ul>
						
					<ul class="nav navbar-nav navbar-right nav-social hidden-sm">
						<li><a href="http://vk.com/">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
					</ul>

					<form class="navbar-form navbar-right" role="search" id="navbar-form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Поиск">
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
					<a href="#" class="h-basket">
						<div class="b-icon">
							<div class="b-icon-count">2</div>
						</div>
						<div class="b-text hidden-sm">
							<b>Корзина</b>В корзине 2 товара
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
						<li><a href="#">Суши <span>(4)</span></a></li>
						<li>
							<div class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Роллы <span>(4)</span></a>
								<ul class="dropdown-menu"> 
									<li><a href="#">Ассорти</a></li> 
									<li><a href="#">Жареные</a></li> 
									<li><a href="#">Запеченые</a></li> 
								</ul>
							</div>
						</li>
						<li><a href="#">Лапша <span>(4)</span></a></li>
						<li><a href="#">Соусы <span>(4)</span></a></li>
						<li><a href="#">Салаты <span>(4)</span></a></li>
						<li><a href="#">Напитки <span>(4)</span></a></li>
						<li><a href="#">Другие блюда <span>(4)</span></a></li>
						<li><a href="#">Закуски <span>(4)</span></a></li>
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
						<li><a href="#">Лапша</a></li>
						<li><a href="#">Соусы</a></li>
						<li><a href="#">Салаты</a></li>
						<li><a href="#">Напитки</a></li>
						<li><a href="#">Другие блюда</a></li>
						<li><a href="#">Закуски</a></li>
					</ul>
					<ul class="footer-nav list-unstyled">
						<li><a href="#">Главная</a></li>
						<li><a href="#">Акции</a></li>
						<li><a href="#">Скидки</a></li>
						<li><a href="#">Доставка и оплата</a></li>
						<li><a href="#">Контакты</a></li>
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