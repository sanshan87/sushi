<?php /* Smarty version Smarty-3.1.18, created on 2016-08-13 20:24:16
         compiled from "C:\openserver\OpenServer\domains\sushitore\sushi\design\default\html\main.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2121457a8c07605f281-49720559%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '01f7f25dc058b169178bcd491a2bcc9380cf539e' => 
    array (
      0 => 'C:\\openserver\\OpenServer\\domains\\sushitore\\sushi\\design\\default\\html\\main.tpl',
      1 => 1471109055,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2121457a8c07605f281-49720559',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_57a8c0762ef718_16221099',
  'variables' => 
  array (
    'settings' => 0,
    'featured_products' => 0,
    'product' => 0,
    'opt' => 0,
    'v' => 0,
    'currency' => 0,
    'new_products' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57a8c0762ef718_16221099')) {function content_57a8c0762ef718_16221099($_smarty_tpl) {?>



<?php $_smarty_tpl->tpl_vars['wrapper'] = new Smarty_variable('index.tpl', null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['wrapper'] = clone $_smarty_tpl->tpl_vars['wrapper'];?>


<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable('', null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>






	<div class="stock-slider">
		<div class="container">
			<div class="block-name"><span>Акции</span></div>
			<div class="owl-carousel">
				<div>
					<div class="stock-card">
						<div class="card-img-col">
							<div class="img-cont"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/stock-p1.jpg" alt="Акция" class="img-responsive"></div>
							<div class="col-header">Спринг грибы в подарок!</div>
						</div>
						<div class="card-info-col">
							При заказе на сумму от 800 руб. 
							Вы получите ролл Спринг грибы 
							в подарок! В стоимость заказа 
							не входят сеты и напитки.
							Акция проводится 10:00 до 22:00
							<a href="#" class="moreinfo-link">Подробнее</a>
						</div>
					</div>
				</div>
				<div>
					<div class="stock-card">
						<div class="card-img-col">
							<div class="img-cont"><img src="design/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['settings']->value->theme, ENT_QUOTES, 'UTF-8', true);?>
/images/stock-p1.jpg" alt="Акция" class="img-responsive"></div>
							<div class="col-header">Спринг грибы в подарок!</div>
						</div>
						<div class="card-info-col">
							При заказе на сумму от 800 руб. 
							Вы получите ролл Спринг грибы 
							в подарок! В стоимость заказа 
							не входят сеты и напитки.
							Акция проводится 10:00 до 22:00
							<a href="#" class="moreinfo-link">Подробнее</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_featured_products'][0][0]->get_featured_products_plugin(array('var'=>'featured_products'),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['featured_products']->value) {?>
<!-- Список товаров-->
	<div class="slider-price popular-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Самые популярные</div>
				<div class="slider-nav" id="popular-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">

	<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['featured_products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
?>
		<div>
			<div class="price-item">
				<div class="price-header clearfix">
				<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->skidka>0) {?>
					<div class="info-flag flag-discount">-<?php echo $_smarty_tpl->tpl_vars['product']->value->variant->skidka;?>
%</div>
				<?php }?>
				<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->sku) {?>
					<div class="menu-number"><?php echo $_smarty_tpl->tpl_vars['product']->value->variant->sku;?>
</div>
				<?php }?>
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


	<?php } ?>
			</div>
		</div>
	</div>			
<?php }?>
	

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_new_products'][0][0]->get_new_products_plugin(array('var'=>'new_products','limit'=>5),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['new_products']->value) {?>
	<div class="slider-price new-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Новинки</div>
				<div class="slider-nav" id="new-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">
			<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['new_products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
?>
			<div>
			<div class="price-item">
				<div class="price-header clearfix">
				<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->skidka>0) {?>
					<div class="info-flag flag-discount">-<?php echo $_smarty_tpl->tpl_vars['product']->value->variant->skidka;?>
%</div>
				<?php }?>
				<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->sku) {?>
					<div class="menu-number"><?php echo $_smarty_tpl->tpl_vars['product']->value->variant->sku;?>
</div>
				<?php }?>
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
			<?php } ?>
			</div>
		</div>
	</div>
<?php }?>
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
