<?php /* Smarty version Smarty-3.1.18, created on 2016-07-28 11:22:17
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\cart_informer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:246635799cec93d1a02-59475960%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7f9b05ff2d3367e404e5c22de319cf92b7e0e363' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\cart_informer.tpl',
      1 => 1328295606,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '246635799cec93d1a02-59475960',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cart' => 0,
    'currency' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5799cec93ecf84_50939584',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5799cec93ecf84_50939584')) {function content_5799cec93ecf84_50939584($_smarty_tpl) {?>

<?php if ($_smarty_tpl->tpl_vars['cart']->value->total_products>0) {?>
	В <a href="./cart/">корзине</a>
	<?php echo $_smarty_tpl->tpl_vars['cart']->value->total_products;?>
 <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['plural'][0][0]->plural_modifier($_smarty_tpl->tpl_vars['cart']->value->total_products,'товар','товаров','товара');?>

	на <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['cart']->value->total_price);?>
 <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>

<?php } else { ?>
	Корзина пуста
<?php }?>
<?php }} ?>
