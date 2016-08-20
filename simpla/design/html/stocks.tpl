{* Title *}
{$meta_title = "Акции" scope=parent}

{* Заголовок *}
<div id="header">
	<h1>{if $stocks|@count}{$stocks|@count}{else}Нет{/if} акци{$stocks|@count|plural:'я':'й':'и'}</h1>		
	<a class="add" href="{url module=StockAdmin}">Добавить акцию</a>
</div>

{if $stocks}
<div id="main_list">
	<form id="list_form" method="post">
		<input type="hidden" name="session_id" value="{$smarty.session.id}">
		<div id="list">		
			{foreach $stocks as $stock}
			<div class="{if !$stock->visible}invisible{/if} row">
		 		<div class="checkbox cell">
					<input type="checkbox" name="check[]" value="{$stock->id}" />				
				</div>
				<div class="name cell">
					<a href="{url module=StockAdmin id=$stock->id return=$smarty.server.REQUEST_URI}">{$stock->name|escape}</a>
				</div>
				<div class="icons cell">
					<a class="enable" title="Активна" href="#"></a>
					<a class="delete" title="Удалить" href="#"></a>
				</div>
				<div class="clear"></div>
			</div>
			{/foreach}
		</div>
	
		<div id="action">
			<label id="check_all" class="dash_link">Выбрать все</label>
		
			<span id="select">
				<select name="action">
					<option value="enable">Сделать видимыми</option>
					<option value="disable">Сделать невидимыми</option>
					<option value="delete">Удалить</option>
				</select>
			</span>
		
			<input id="apply_action" class="button_green" type="submit" value="Применить">
		</div>
	</form>	
</div>
{/if}

{* On document load *}
{literal}
<script>
$(function() {

 
	// Раскраска строк
	function colorize()
	{
		$(".row:even").addClass('even');
		$(".row:odd").removeClass('even');
	}
	// Раскрасить строки сразу
	colorize();


	// Выделить все
	$("#check_all").click(function() {
		$('#list input[type="checkbox"][name*="check"]').attr('checked', $('#list input[type="checkbox"][name*="check"]:not(:checked)').length>0);
	});	

	// Удалить 
	$("a.delete").click(function() {
		$('#list_form input[type="checkbox"][name*="check"]').attr('checked', false);
		$(this).closest(".row").find('input[type="checkbox"][name*="check"]').attr('checked', true);
		$(this).closest("form").find('select[name="action"] option[value=delete]').attr('selected', true);
		$(this).closest("form").submit();
	});
	

	// Показать
	$("a.enable").click(function() {
		var icon        = $(this);
		var line        = icon.closest(".row");
		var id          = line.find('input[type="checkbox"][name*="check"]').val();
		var state       = line.hasClass('invisible')?1:0;
		icon.addClass('loading_icon');
		$.ajax({
			type: 'POST',
			url: 'ajax/update_object.php',
			data: {'object': 'stock', 'id': id, 'values': {'visible': state}, 'session_id': '{/literal}{$smarty.session.id}{literal}'},
			success: function(data){
				icon.removeClass('loading_icon');
				if(state)
					line.removeClass('invisible');
				else
					line.addClass('invisible');				
			},
			dataType: 'json'
		});	
		return false;	
	});


	$("form").submit(function() {
		if($('select[name="action"]').val()=='delete' && !confirm('Подтвердите удаление'))
			return false;	
	});
});
</script>
{/literal}