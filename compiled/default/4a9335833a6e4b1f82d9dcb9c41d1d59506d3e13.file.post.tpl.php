<?php /* Smarty version Smarty-3.1.18, created on 2016-07-28 19:44:54
         compiled from "E:\xampp\htdocs\sushi.local\design\default\html\post.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11617579a44969b8296-41368922%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4a9335833a6e4b1f82d9dcb9c41d1d59506d3e13' => 
    array (
      0 => 'E:\\xampp\\htdocs\\sushi.local\\design\\default\\html\\post.tpl',
      1 => 1396197142,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11617579a44969b8296-41368922',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'post' => 0,
    'prev_post' => 0,
    'next_post' => 0,
    'comments' => 0,
    'comment' => 0,
    'error' => 0,
    'comment_text' => 0,
    'comment_name' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_579a4496ad16d2_97639118',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_579a4496ad16d2_97639118')) {function content_579a4496ad16d2_97639118($_smarty_tpl) {?><?php if (!is_callable('smarty_function_math')) include 'E:\\xampp\\htdocs\\sushi.local\\Smarty\\libs\\plugins\\function.math.php';
?>


<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/blog/".((string)$_smarty_tpl->tpl_vars['post']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>

<!-- Заголовок /-->
<h1 data-post="<?php echo $_smarty_tpl->tpl_vars['post']->value->id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</h1>
<p><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['date'][0][0]->date_modifier($_smarty_tpl->tpl_vars['post']->value->date);?>
</p>

<!-- Тело поста /-->
<?php echo $_smarty_tpl->tpl_vars['post']->value->text;?>


<!-- Соседние записи /-->
<div id="back_forward">
	<?php if ($_smarty_tpl->tpl_vars['prev_post']->value) {?>
		←&nbsp;<a class="prev_page_link" href="blog/<?php echo $_smarty_tpl->tpl_vars['prev_post']->value->url;?>
"><?php echo $_smarty_tpl->tpl_vars['prev_post']->value->name;?>
</a>
	<?php }?>
	<?php if ($_smarty_tpl->tpl_vars['next_post']->value) {?>
		<a class="next_page_link" href="blog/<?php echo $_smarty_tpl->tpl_vars['next_post']->value->url;?>
"><?php echo $_smarty_tpl->tpl_vars['next_post']->value->name;?>
</a>&nbsp;→
	<?php }?>
</div>

<!-- Комментарии -->
<div id="comments">

	<h2>Комментарии</h2>
	
	<?php if ($_smarty_tpl->tpl_vars['comments']->value) {?>
	<!-- Список с комментариями -->
	<ul class="comment_list">
		<?php  $_smarty_tpl->tpl_vars['comment'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['comment']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['comments']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['comment']->key => $_smarty_tpl->tpl_vars['comment']->value) {
$_smarty_tpl->tpl_vars['comment']->_loop = true;
?>
		<a name="comment_<?php echo $_smarty_tpl->tpl_vars['comment']->value->id;?>
"></a>
		<li>
			<!-- Имя и дата комментария-->
			<div class="comment_header">	
				<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['comment']->value->name, ENT_QUOTES, 'UTF-8', true);?>
 <i><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['date'][0][0]->date_modifier($_smarty_tpl->tpl_vars['comment']->value->date);?>
, <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['time'][0][0]->time_modifier($_smarty_tpl->tpl_vars['comment']->value->date);?>
</i>
				<?php if (!$_smarty_tpl->tpl_vars['comment']->value->approved) {?><b>ожидает модерации</b><?php }?>
			</div>
			<!-- Имя и дата комментария (The End)-->
			
			<!-- Комментарий -->
			<?php echo nl2br(htmlspecialchars($_smarty_tpl->tpl_vars['comment']->value->text, ENT_QUOTES, 'UTF-8', true));?>

			<!-- Комментарий (The End)-->
		</li>
		<?php } ?>
	</ul>
	<!-- Список с комментариями (The End)-->
	<?php } else { ?>
	<p>
		Пока нет комментариев
	</p>
	<?php }?>
	
	<!--Форма отправления комментария-->

	<!--Подключаем js-проверку формы -->
	<script src="/js/baloon/js/default.js" language="JavaScript" type="text/javascript"></script>
	<script src="/js/baloon/js/validate.js" language="JavaScript" type="text/javascript"></script>
	<script src="/js/baloon/js/baloon.js" language="JavaScript" type="text/javascript"></script>
	<link href="/js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 
	
	<form class="comment_form" method="post" action="">
		<h2>Написать комментарий</h2>
		<?php if ($_smarty_tpl->tpl_vars['error']->value) {?>
		<div class="message_error">
			<?php if ($_smarty_tpl->tpl_vars['error']->value=='captcha') {?>
			Неверно введена капча
			<?php } elseif ($_smarty_tpl->tpl_vars['error']->value=='empty_name') {?>
			Введите имя
			<?php } elseif ($_smarty_tpl->tpl_vars['error']->value=='empty_comment') {?>
			Введите комментарий
			<?php }?>
		</div>
		<?php }?>
		<textarea class="comment_textarea" id="comment_text" name="text" data-format=".+" data-notice="Введите комментарий"><?php echo $_smarty_tpl->tpl_vars['comment_text']->value;?>
</textarea><br />
		<div>
		<label for="comment_name">Имя</label>
		<input class="input_name" type="text" id="comment_name" name="name" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['comment_name']->value, ENT_QUOTES, 'UTF-8', true);?>
" data-format=".+" data-notice="Введите имя"/><br />

		<input class="button" type="submit" name="comment" value="Отправить" />
		
		<label for="comment_captcha">Число</label>
		<div class="captcha"><img src="captcha/image.php?<?php echo smarty_function_math(array('equation'=>'rand(10,10000)'),$_smarty_tpl);?>
"/></div> 
		<input class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
		
		</div>
	</form>
	<!--Форма отправления комментария (The End)-->
	
</div>
<!-- Комментарии (The End) --><?php }} ?>
