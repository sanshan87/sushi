<?php /* Smarty version Smarty-3.1.18, created on 2016-07-28 19:44:54
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\page.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3399579a4496cbda57-93726373%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c58252a9311a965d4226f3a43aea27efc5443c74' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\page.tpl',
      1 => 1394928218,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3399579a4496cbda57-93726373',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'page' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_579a4496d0bc67_65147037',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_579a4496d0bc67_65147037')) {function content_579a4496d0bc67_65147037($_smarty_tpl) {?>


<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/".((string)$_smarty_tpl->tpl_vars['page']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>

<!-- Заголовок страницы -->
<h1 data-page="<?php echo $_smarty_tpl->tpl_vars['page']->value->id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page']->value->header, ENT_QUOTES, 'UTF-8', true);?>
</h1>

<!-- Тело страницы -->
<?php echo $_smarty_tpl->tpl_vars['page']->value->body;?>
<?php }} ?>
