<?php /* Smarty version Smarty-3.1.18, created on 2016-08-13 20:37:48
         compiled from "C:\openserver\OpenServer\domains\sushitore\sushi\design\default\html\products.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1812157a8c527cecfc6-11559326%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3ebcbd35a6993655197b3a504b5e5579d5d9a230' => 
    array (
      0 => 'C:\\openserver\\OpenServer\\domains\\sushitore\\sushi\\design\\default\\html\\products.tpl',
      1 => 1471109861,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1812157a8c527cecfc6-11559326',
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
  'unifunc' => 'content_57a8c52830db82_66310970',
  'variables' => 
  array (
    'category' => 0,
    'brand' => 0,
    'keyword' => 0,
    'cat' => 0,
    'page' => 0,
    'products' => 0,
    'product' => 0,
    'opt' => 0,
    'v' => 0,
    'currency' => 0,
    'settings' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57a8c52830db82_66310970')) {function content_57a8c52830db82_66310970($_smarty_tpl) {?>

<?php if ($_smarty_tpl->tpl_vars['category']->value&&$_smarty_tpl->tpl_vars['brand']->value) {?>
<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/catalog/".((string)$_smarty_tpl->tpl_vars['category']->value->url)."/".((string)$_smarty_tpl->tpl_vars['brand']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<?php } elseif ($_smarty_tpl->tpl_vars['category']->value) {?>
<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/catalog/".((string)$_smarty_tpl->tpl_vars['category']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<?php } elseif ($_smarty_tpl->tpl_vars['brand']->value) {?>
<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/brands/".((string)$_smarty_tpl->tpl_vars['brand']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<?php } elseif ($_smarty_tpl->tpl_vars['keyword']->value) {?>
<?php ob_start();?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['keyword']->value, ENT_QUOTES, 'UTF-8', true);?>
<?php $_tmp1=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/products?keyword=".$_tmp1, null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<?php } else { ?>
<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/products", null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<?php }?>
<?php $_smarty_tpl->tpl_vars['wrapper'] = new Smarty_variable('wrapper_for_products.tpl', null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['wrapper'] = clone $_smarty_tpl->tpl_vars['wrapper'];?>
<!-- Хлебные крошки /-->
	<div class="breadcrumb-block">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="/">Главная</a></li>
					<?php if ($_smarty_tpl->tpl_vars['category']->value) {?>
					<?php  $_smarty_tpl->tpl_vars['cat'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cat']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['category']->value->path; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['cat']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['cat']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['cat']->key => $_smarty_tpl->tpl_vars['cat']->value) {
$_smarty_tpl->tpl_vars['cat']->_loop = true;
 $_smarty_tpl->tpl_vars['cat']->iteration++;
 $_smarty_tpl->tpl_vars['cat']->last = $_smarty_tpl->tpl_vars['cat']->iteration === $_smarty_tpl->tpl_vars['cat']->total;
?>
					<li<?php if ($_smarty_tpl->tpl_vars['cat']->last) {?> class="active"<?php }?>><?php if (!$_smarty_tpl->tpl_vars['cat']->last) {?><a href="catalog/<?php echo $_smarty_tpl->tpl_vars['cat']->value->url;?>
"><?php }?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cat']->value->name, ENT_QUOTES, 'UTF-8', true);?>
<?php if (!$_smarty_tpl->tpl_vars['cat']->last) {?></a><?php }?></li>
					<?php } ?>  
					<?php if ($_smarty_tpl->tpl_vars['brand']->value) {?>
					<li><a href="catalog/<?php echo $_smarty_tpl->tpl_vars['cat']->value->url;?>
/<?php echo $_smarty_tpl->tpl_vars['brand']->value->url;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a></li>
					<?php }?>
					<?php } elseif ($_smarty_tpl->tpl_vars['brand']->value) {?>
					<li><a href="brands/<?php echo $_smarty_tpl->tpl_vars['brand']->value->url;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a></li>
					<?php } elseif ($_smarty_tpl->tpl_vars['keyword']->value) {?>
					<li>Поиск</li>
					<?php }?>				
			</ol>
		</div>
	</div>
<!-- Хлебные крошки #End /-->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-8 col-xs-12">
					<div class="page-header-block">
						
						<?php if ($_smarty_tpl->tpl_vars['keyword']->value) {?>
						<h1>Поиск <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['keyword']->value, ENT_QUOTES, 'UTF-8', true);?>
</h1>
						<?php } elseif ($_smarty_tpl->tpl_vars['page']->value) {?>
						<h1><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</h1>
						<?php } else { ?>
						<h1><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['category']->value->name, ENT_QUOTES, 'UTF-8', true);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</h1>
						<?php }?>
						<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
					</div>
<!--Каталог товаров-->
<?php if ($_smarty_tpl->tpl_vars['products']->value) {?>
<div class="catalog-items">
	<div class="row">
<!-- Список товаров-->
	<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
?>
	<!-- Товар-->
	<div class="col-md-4 col-sm-6">
		<div class="price-item catalog-item">
			<div class="price-header clearfix">
				<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->skidka>0) {?>
					<div class="info-flag flag-discount">-<?php echo $_smarty_tpl->tpl_vars['product']->value->variant->skidka;?>
%</div>
				<?php }?>
					<div class="menu-number <?php if (!$_smarty_tpl->tpl_vars['product']->value->variant->sku) {?>b-transp<?php }?>"><?php echo $_smarty_tpl->tpl_vars['product']->value->variant->sku;?>
</div>
				</div>
				<a href="products/<?php echo $_smarty_tpl->tpl_vars['product']->value->url;?>
" class="price-link">
				<?php if ($_smarty_tpl->tpl_vars['product']->value->image) {?>
					<div class="price-img"><img src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['product']->value->image->filename,225,120);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
" class="img-responsive"></div>
				<?php }?>	
					<div class="price-info">
						<p class="price-name"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</p>
						<p class="price-components"><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['product']->value->annotation);?>
</p>
												<?php if ($_smarty_tpl->tpl_vars['product']->value->features) {?>
						<?php  $_smarty_tpl->tpl_vars['opt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['opt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['product']->value->features; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['opt']->key => $_smarty_tpl->tpl_vars['opt']->value) {
$_smarty_tpl->tpl_vars['opt']->_loop = true;
?>
						<p class="price-weight"><?php echo $_smarty_tpl->tpl_vars['opt']->value->value;?>
</p>
						<?php } ?>
						<?php }?>
					</div>
				</a>
				<?php if (count($_smarty_tpl->tpl_vars['product']->value->variants)>0) {?>
				<form class="variants" action="/cart">
				<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['product']->value->variants; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['v']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value) {
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['v']->index++;
 $_smarty_tpl->tpl_vars['v']->first = $_smarty_tpl->tpl_vars['v']->index === 0;
?>
				<input id="featured_<?php echo $_smarty_tpl->tpl_vars['v']->value->id;?>
" name="variant" value="<?php echo $_smarty_tpl->tpl_vars['v']->value->id;?>
" type="radio" class="variant_radiobutton" <?php if ($_smarty_tpl->tpl_vars['v']->first) {?>checked<?php }?> <?php if (count($_smarty_tpl->tpl_vars['product']->value->variants)<2) {?>style="display:none;"<?php }?>/>
				<div class="price-footer clearfix">
					<div class="price-cost">
					<?php if ($_smarty_tpl->tpl_vars['v']->value->skidka>0) {?>
						<span class="old-cost"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->price);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>
</span>
						<span class="current-cost"><?php echo sprintf("%.2f",($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->price)-$_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->price)*$_smarty_tpl->tpl_vars['v']->value->skidka/100));?>
</span>
					<?php } else { ?>
						<span class="current-cost"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->price);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>
</span>
					<?php }?>
					</div>
					<div class="price-form">
						<button class="btn addToBasket" type="submit">В корзину</button>
					</div>
				</div>
				<?php } ?>
				</form>
				<?php }?>
		</div>
	</div>
	<!-- Товар (The End)-->
	<?php } ?>			
<?php echo $_smarty_tpl->getSubTemplate ('pagination.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
	
<!-- Список товаров (The End)-->
	</div>	
</div>
<?php } else { ?>
Товары не найдены
<?php }?>
<!--Каталог товаров (The End)-->
</div>
				<div class="col-md-3 col-sm-4 col-xs-12">
					<div class="row">
						<div class="col-xs-12">
							<div class="main-menu-block">
								<div class="block-frame">
									<div class="bf-corner bf-corner--topLeft"></div>
									<div class="bf-corner bf-corner--topRight"></div>
									<div class="bf-corner bf-corner--bottomLeft"></div>
									<div class="bf-corner bf-corner--bottomRight"></div>
								</div>
								<?php echo $_smarty_tpl->getSubTemplate ("main_menu.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
	
							</div>
						</div>
						<div class="col-xs-12">
							<div class="working-info">
								<div class="border"></div>
								<div class="wi-text">
									<?php echo $_smarty_tpl->getSubTemplate ('working_info.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

								</div>
							</div>
						</div>
						<div class="col-xs-12 sidebar-sale">
							<h3>Акции</h3>
							<div class="sale-item">
								<div class="img-block">
									<img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/side-sale.jpg" alt="" class="img-responsive">
									<div class="sale-header">Спринг грибы в подарок!</div>
								</div>
								<div class="info-block">
									<div class="item-text">
										При заказе на сумму от 800 руб. 
										Вы получите ролл Спринг грибы 
										в подарок! В стоимость заказа 
										не входят сеты и напитки.
									</div>
									<div class="item-time">Акция проводится 10:00 до 22:00</div>
									<a href="#" class="link-more">Подробнее</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	</div><?php }} ?>
