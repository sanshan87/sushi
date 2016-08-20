{if $stock->id}
{$meta_title = $stock->name scope=parent}
{else}
{$meta_title = 'Новая акция' scope=parent}
{/if}

{* Подключаем Tiny MCE *}
{include file='tinymce_init.tpl'}

{literal}
<!-- CSS includes -->
<link href="/js/modalPopLite/modalPopLite.css" rel="stylesheet" type="text/css" /> 
<!-- CSS includes (The End) -->
<!-- JS includes -->
<script src="/js/cropit/dist/jquery.cropit.js"></script>
<script src="/js/modalPopLite/modalPopLite.min.js"></script>
<script src="/simpla/design/js/maskedinput/jquery.maskedinput.min.js"></script>
<!-- JS includes (The End) -->
<script>
$(function(){
	$('#popup-wrapper').modalPopLite({ openButton: '#clicker', closeButton: '#close-btn' }); 
	
	$('#image-cropper').cropit({ imageBackground: true, 
   		width:{/literal}{$settings->preview_x}{literal},
   		height:{/literal}{$settings->preview_y}{literal},
   		initialZoom:'image'{/literal}{if $stock->filename}{literal},
   		imageState: {
        	src: '{/literal}{$stock->filename|replace:"_mini":"_orig"|resize:600:600}{literal}',
        }
        {/literal}{/if}{literal}
    }); 
		  
    $('.export').click(function() {
        var imageData = $('#image-cropper').cropit('export');
        var imageOrig = $('img.cropit-image-background').attr('src');
        if(imageData && imageOrig) {
			$('#preview_result').html('');
			$('#imgMini').val(imageData);
			$('#imgOrig').val(imageOrig);
            $("<img src='"+ imageData + "'>").appendTo('#preview_result');
            $("#close-btn").trigger('click');
        }
    });

    $('.m-time').mask('99:99');
});
</script>
{/literal}

<!-- Основная форма -->
<form method="post" id="product" enctype="multipart/form-data">
	<input type=hidden name="session_id" value="{$smarty.session.id}">

	{if $message_success}
		<!-- Системное сообщение -->
		<div class="message message_success">
			<span class="text">{if $message_success=='updated'}Акция обновлена{elseif $message_success=='added'}Акция добавлена{else}{$message_success}{/if}</span>
			<a class="button" href="{url module=StocksAdmin}">Вернуться</a>
		</div>
		<!-- Системное сообщение (The End)-->
	{/if}

	<div id="name">
		<label>Название</label>
		<input type="text" class="name" name="name" value="{$stock->name|escape}" style="width: 90%; margin-left: 14px;"/> 
		<input name="id" type="hidden" value="{$stock->id|escape}"/> 
		<div class="checkbox">
			<input name="visible" value='1' type="checkbox" id="active_checkbox" {if $stock->visible}checked{/if}/> <label for="active_checkbox">Активна</label>
		</div>
	</div>

	<div id="column_left">
		<div class="block layer">
			<h2>Время действия акции</h2>
			<div class="form-group">
				<ul class="days">
					<li>Пн</li>
					<li>Вт</li>
					<li>Ср</li>
					<li>Чт</li>
					<li>Пт</li>
					<li class="weekend">Сб</li>
					<li class="weekend">Вс</li>
				</ul>
				<div class="time-inputs">
					<div class="weekday-time">
						<label>С</label>
						<input type="text" class="m-time" name="wd_start" value="{if $stock->wd_start}{$stock->wd_start}{else}10:00{/if}">
						<label>До</label>
						<input type="text" class="m-time" name="wd_end" value="{if $stock->wd_end}{$stock->wd_end}{else}22:00{/if}">
					</div>
					<div class="weekend-time">
						<label>С</label>
						<input type="text" class="m-time" name="we_start" value="{if $stock->we_start}{$stock->we_start}{else}10:00{/if}">
						<label>До</label>
						<input type="text" class="m-time" name="we_end" value="{if $stock->we_end}{$stock->we_end}{else}23:00{/if}">
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<div id="column_right">
		<div class="block layer images" style="height:200px; overflow: hidden;">
		    <div id="clicker" style="text-align:center;text-decoration:underline;cursor:pointer;">
		        <h2>{if $stock->filename}Редактирование{else}Добавление{/if} превью</h2>
		    </div>
			<div id="preview_result" style="text-align:center;">
				{if $stock->filename}
				<img src="{$stock->filename|resize:225:120}"/>
				{/if}
			</div>
            <div id="popup-wrapper">
                <div id="image-cropper">
                    <div class="cropit-image-preview-container">
                        <div class="cropit-image-preview"></div>
                    </div>
                    <input type="range" class="cropit-image-zoom-input" />
                    <br>
                    <input type="file" class="cropit-image-input" />
					<br>
					<input type="button" class="export" value="Получить превью">
				</div>
				<button type="button" id="close-btn"><span>&times;</span></button>
			</div>
			<input type="hidden" id="imgMini" value="" name="imgData">
			<input type="hidden" id="imgOrig" value="" name="imgDataOrig">
		</div>
	</div>

	<!-- Описание акции -->
	<div class="block layer">
		<h2>Краткое описание</h2>
		<textarea name="short_annotation" class="editor_small">{$stock->short_annotation|escape}</textarea>
	</div>
		
	<div class="block">		
		<h2>Полное описание</h2>
		<textarea name="annotation" class="editor_large">{$stock->annotation|escape}</textarea>
	</div>
	<!-- Описание акции (The End)-->
	<input class="button_green button_save" type="submit" name="" value="Сохранить" />
</form>