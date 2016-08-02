<?php /* Smarty version Smarty-3.1.18, created on 2016-08-02 19:05:59
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14945799cec9275f37-00617950%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '17b29c03e0895393f7c2f4021ceb5392a9b7b074' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\index.tpl',
      1 => 1470157556,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14945799cec9275f37-00617950',
  'function' => 
  array (
    'categories_tree' => 
    array (
      'parameter' => 
      array (
      ),
      'compiled' => '',
    ),
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5799cec93c2008_36209308',
  'variables' => 
  array (
    'config' => 0,
    'meta_title' => 0,
    'meta_description' => 0,
    'meta_keywords' => 0,
    'canonical' => 0,
    'settings' => 0,
    'content' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5799cec93c2008_36209308')) {function content_5799cec93c2008_36209308($_smarty_tpl) {?><!DOCTYPE html>

<html lang="ru">
<head>
	<base href="<?php echo $_smarty_tpl->tpl_vars['config']->value->root_url;?>
/"/>
	<title><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['meta_title']->value, ENT_QUOTES, 'UTF-8', true);?>
</title>
	
	
	<meta charset="UTF-8">
	<meta name="description" content="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['meta_description']->value, ENT_QUOTES, 'UTF-8', true);?>
" />
	<meta name="keywords"    content="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['meta_keywords']->value, ENT_QUOTES, 'UTF-8', true);?>
" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<?php if (isset($_smarty_tpl->tpl_vars['canonical']->value)) {?><link rel="canonical" href="<?php echo $_smarty_tpl->tpl_vars['config']->value->root_url;?>
<?php echo $_smarty_tpl->tpl_vars['canonical']->value;?>
"/><?php }?>
	
	
	<!--<link href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/favicon.ico" rel="icon"          type="image/x-icon"/>
	<link href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>-->
	<link rel="stylesheet" href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/bower_components/bootstrap/dist/css/bootstrap.min.css" />
	<!-- endbower -->
	<link rel="stylesheet" href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/css/main.css">
	<link rel="stylesheet" href="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/plugins/owl-carousel/owl.carousel.css">
	
	<script src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/bower_components/jquery/dist/jquery.js"></script>
	
	
	<?php if ($_SESSION['admin']=='admin') {?>
	<script src ="js/admintooltip/admintooltip.js" type="text/javascript"></script>
	<link   href="js/admintooltip/css/admintooltip.css" rel="stylesheet" type="text/css" /> 
	<?php }?>
	
	<script src="design/<?php echo $_smarty_tpl->tpl_vars['settings']->value->theme;?>
/js/jquery-ui.min.js"></script>
	<!--<script src="design/<?php echo $_smarty_tpl->tpl_vars['settings']->value->theme;?>
/js/ajax_cart.js"></script>-->
	
	
	<script src="js/baloon/js/baloon.js" type="text/javascript"></script>
	<link   href="js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 
	
	
	
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
							<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/b-price-1.jpg" alt="Товар" class="img-responsive">
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
							<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/b-price-1.jpg" alt="Товар" class="img-responsive">
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
							<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/b-price-1.jpg" alt="Товар" class="img-responsive">
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
						<li><a href="http://vk.com/">Мы вконтакте <img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/top-social-vk.png" alt=""></a></li>
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
					<a href="#"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/header-logo.png" alt="Сушитория" class="img-responsive h-logo"></a>
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
							<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/time-icon.png" alt="Time" class="time-icon">
							<p><b>Время работы:</b></p>
							<p>вс - чт с 10-00 до 22-00<br>пт - сб с 10-00 до 23-00</p>
							<p>Без перерывов<br>и выходных</p>
						</div>
						<div class="owl-carousel">
							<div><a href="#"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/slide-1.jpg" alt="Суши"></a></div>
							<div><a href="#"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/slide-1.jpg" alt="Суши"></a></div>
							<div><a href="#"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/slide-1.jpg" alt="Суши"></a></div>
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

<?php echo $_smarty_tpl->tpl_vars['content']->value;?>


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
					<a href="http://vk.com/" class="f-social">Мы вконтакте <img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/top-social-vk.png" alt=""></a></li>
				</div>
				<div class="col-sm-4 col-xs-12 col-sm-offset-1">
					<div class="f-author">Создание сайта: <a href="#">студия «Соль»</a></div>
				</div>
			</div>
		</div>
	</footer>
	<script src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- endbower -->
	<script src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/js/main.js"></script>
	<script src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/plugins/owl-carousel/owl.carousel.min.js"></script>
</body>
</html><?php }} ?>
