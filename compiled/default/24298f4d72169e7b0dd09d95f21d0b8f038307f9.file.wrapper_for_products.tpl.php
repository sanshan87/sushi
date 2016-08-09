<?php /* Smarty version Smarty-3.1.18, created on 2016-08-09 14:34:24
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\wrapper_for_products.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2073457a9cb0e99ef03-91847701%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '24298f4d72169e7b0dd09d95f21d0b8f038307f9' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\wrapper_for_products.tpl',
      1 => 1470746059,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2073457a9cb0e99ef03-91847701',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_57a9cb0ea79b46_93207515',
  'variables' => 
  array (
    'config' => 0,
    'meta_title' => 0,
    'meta_description' => 0,
    'meta_keywords' => 0,
    'canonical' => 0,
    'settings' => 0,
    'pages' => 0,
    'p' => 0,
    'page' => 0,
    'keyword' => 0,
    'cart' => 0,
    'content' => 0,
    'categories' => 0,
    'c' => 0,
    'category' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57a9cb0ea79b46_93207515')) {function content_57a9cb0ea79b46_93207515($_smarty_tpl) {?><!DOCTYPE html>
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
	<script src="design/<?php echo $_smarty_tpl->tpl_vars['settings']->value->theme;?>
/js/ajax_cart.js"></script>
	
	
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
	<div class="side-basket" id="cart_informer">
		<?php echo $_smarty_tpl->getSubTemplate ('cart_informer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

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
					<?php  $_smarty_tpl->tpl_vars['p'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['p']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['pages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['p']->key => $_smarty_tpl->tpl_vars['p']->value) {
$_smarty_tpl->tpl_vars['p']->_loop = true;
?>
						
						<?php if ($_smarty_tpl->tpl_vars['p']->value->menu_id==1) {?>
						<li <?php if ($_smarty_tpl->tpl_vars['page']->value&&$_smarty_tpl->tpl_vars['page']->value->id==$_smarty_tpl->tpl_vars['p']->value->id) {?>class="selected"<?php }?>>
							<a data-page="<?php echo $_smarty_tpl->tpl_vars['p']->value->id;?>
" href="<?php echo $_smarty_tpl->tpl_vars['p']->value->url;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['p']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a>
						</li>
						<?php }?>
					<?php } ?>
					</ul>
						
					<ul class="nav navbar-nav navbar-right nav-social hidden-sm">
						<li><a href="http://vk.com/">Мы вконтакте <img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/top-social-vk.png" alt=""></a></li>
					</ul>

					<form class="navbar-form navbar-right" role="search" id="navbar-form" action="/products">
						<div class="form-group">
							<input type="text" class="form-control input_search" placeholder="Поиск" name="keyword" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['keyword']->value, ENT_QUOTES, 'UTF-8', true);?>
">
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
					<a href="/cart" class="h-basket">
						<div class="b-icon">
							<div class="b-icon-count" id="cnt_in_cart"><?php echo $_smarty_tpl->tpl_vars['cart']->value->total_products;?>
</div>
						</div>
						<div class="b-text hidden-sm">
							<b>Корзина</b><span id="txt_cnt">В корзине <?php echo $_smarty_tpl->tpl_vars['cart']->value->total_products;?>
 <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['plural'][0][0]->plural_modifier($_smarty_tpl->tpl_vars['cart']->value->total_products,'товар','товаров','товара');?>
</span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</header>
<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

	<div class="text-content">
		<div class="container">
			<h1 class="text-center">Суши и роллы в Орле</h1>
			<div class="row">
				<div class="col-md-6 col-xs-12">
					<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
					Самым популярным японским блюдом является суши, его можно 
					считать визитной карточкой японской кухни. Япония располагается 
					на островах, окруженных морем, которое богато разнообразными рыбами, моллюсками и ракообразными. Поскольку в Японии гористая местность, существует проблема с недостатком культивируемой пахотной земли, поэтому население Японии, преимущественно выращивает рис. Для иностранцев суши (комбинация сырого филе и сваренного особым образом риса) всегда казалось экзотическим блюдом, но для японцев эта пища считается натуральной, так как они привыкли питаться дарами моря и рисовыми полями.
				</div>
				<div class="col-md-6 col-xs-12">
					Суши или суси, как их иногда называют, приобрели широкую популярность во всем мире с начала 1980-х годов. В нашей стране сегодня это блюдо любят и едят очень многие. Суши невозможно сравнить ни с одним рыбным блюдом русской или европейской кухни. Они имеют неповторимый вкус и очень нежную текстуру.<br> Первые суши появились в Южной Азии. Там варёный рис начали использовать для приготовления и консервации рыбы.Рыба очищалась и нарезалась на маленькие кусочки. Затем ее солили и смешивали с рисом. После этого на рыбу клали камни 
					в качестве пресса. Это помогало избежать попадания воздуха. 
				</div>
			</div>
		</div>
	</div>

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
						<?php if ($_smarty_tpl->tpl_vars['categories']->value) {?>
						<?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
							
							<?php if ($_smarty_tpl->tpl_vars['c']->value->visible) {?>
								<li>
									<a <?php if ($_smarty_tpl->tpl_vars['category']->value->id==$_smarty_tpl->tpl_vars['c']->value->id) {?>class="selected"<?php }?> href="catalog/<?php echo $_smarty_tpl->tpl_vars['c']->value->url;?>
" data-category="<?php echo $_smarty_tpl->tpl_vars['c']->value->id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a>
								</li>
							<?php }?>
						<?php } ?>
						<?php }?>
					</ul>
					<ul class="footer-nav list-unstyled">
					<?php  $_smarty_tpl->tpl_vars['p'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['p']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['pages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['p']->key => $_smarty_tpl->tpl_vars['p']->value) {
$_smarty_tpl->tpl_vars['p']->_loop = true;
?>
					
						<?php if ($_smarty_tpl->tpl_vars['p']->value->menu_id==1) {?>
						<li <?php if ($_smarty_tpl->tpl_vars['page']->value&&$_smarty_tpl->tpl_vars['page']->value->id==$_smarty_tpl->tpl_vars['p']->value->id) {?>class="selected"<?php }?>>
							<a href="<?php echo $_smarty_tpl->tpl_vars['p']->value->url;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['p']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a>
						</li>
						<?php }?>
					<?php } ?>
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
