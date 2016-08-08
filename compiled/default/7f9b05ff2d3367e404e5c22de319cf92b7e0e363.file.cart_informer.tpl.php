<?php /* Smarty version Smarty-3.1.18, created on 2016-08-07 23:39:44
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\cart_informer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:246635799cec93d1a02-59475960%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7f9b05ff2d3367e404e5c22de319cf92b7e0e363' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\cart_informer.tpl',
      1 => 1470605979,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '246635799cec93d1a02-59475960',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5799cec93ecf84_50939584',
  'variables' => 
  array (
    'cart' => 0,
    'product' => 0,
    'image' => 0,
    'currency' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5799cec93ecf84_50939584')) {function content_5799cec93ecf84_50939584($_smarty_tpl) {?>




		<a href="#" class="sb-btn">
			<div class="h-btn">
				<span class="basket-count"><?php if (!$_smarty_tpl->tpl_vars['cart']->value->total_products) {?>0<?php } else { ?><?php echo $_smarty_tpl->tpl_vars['cart']->value->total_products;?>
<?php }?></span>
			</div>
		</a>

		<div class="basket">
			<div class="basket-header">
				<span class="bh-name">Корзина</span>
				<a href="#" class="basket-close">Свернуть</a>
			</div>
			<?php if (count($_smarty_tpl->tpl_vars['cart']->value->purchases)) {?>
			<div class="items-wrap">
				<ul class="basket-items list-unstyled">
				<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cart']->value->purchases; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
?>
					<li class="b-item">
						<div class="b-price-img hidden-xs">
						<?php  $_smarty_tpl->tpl_vars['image'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['image']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['product']->value->product->images; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['image']->key => $_smarty_tpl->tpl_vars['image']->value) {
$_smarty_tpl->tpl_vars['image']->_loop = true;
?>
							<img src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['image']->value->filename,63,32);?>
" alt="<?php echo $_smarty_tpl->tpl_vars['product']->value->product->name;?>
" class="img-responsive">
						<?php } ?>
						</div>
						<div class="b-price-info">
							<a href="#" class="price-name"><?php echo $_smarty_tpl->tpl_vars['product']->value->product->name;?>
</a>
							<div class="form-inline">
								<label class="price-count" for="b-item-1">Кол-во:</label>
								<input type="text" class="form-control" id="b-item-1" value="<?php echo $_smarty_tpl->tpl_vars['product']->value->amount;?>
">
							</div>
						</div>
						<div class="b-price-cost"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['product']->value->variant->price);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>
</div>
						<div class="b-price-close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					</li>
				<?php } ?>	
				</ul>
			</div>
			

			<div class="basket-buttons">
				<div class="basket-total">Итого к оплате: <b><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['cart']->value->total_price);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>
</b></div>
				<div><a href="#" class="link">Продолжить покупки</a></div>
				<div><a href="#" class="btn">Оформить заказ</a></div>
			</div>
			<?php } else { ?>
			<div class="items-wrap">
			Пусто
			</div>
			<?php }?>
		</div>
<?php }} ?>
