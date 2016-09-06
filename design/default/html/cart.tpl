{$meta_title = "Корзина" scope=parent}
{$wrapper = 'wrapper_for_products.tpl' scope=parent}
<div class="breadcrumb-block">
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/">Главная</a></li>
			<li class="active">Корзина</li>
		</ol>
	</div>
</div>
<div class="content">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-8 col-xs-12">
				<div class="page-header-block">
					<h1>Корзина {if !$cart->purchases|@count}пуста{/if}</h1>
					<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
				</div>
				{if $cart->purchases|@count}
				<div class="basket-container">
					<div class="basket-row basket-header">
						<div class="basket-col">Наименование</div>
						<div class="basket-col">Кол-во</div>
						<div class="basket-col text-center">Стоимость</div>
						<div class="basket-col text-center">Удалить</div>
					</div>
					{foreach $cart->purchases as $product}
					<div class="basket-row">
						<div class="basket-col info-col">
							<div class="price-img">
							{if $product->variant->sku}
								<div class="price-number">{$product->variant->sku}</div>
							{/if}
							{if $product->product->images}
								{foreach $product->product->images as $image}
								<img src="{$image->filename|resize:86:50}" alt="{$product->product->name}" class="img-responsive">
								{/foreach}
							{else}
								<img src="design/{$settings->theme|escape}/images/price-basket.jpg" alt="" class="img-responsive">
							{/if}
							</div>
							<div class="price-descr">
								<div class="price-name">{$product->product->name}{if $product->variant->name} {$product->variant->name}{/if}</div>
								{if $product->product->annotation}<div class="price-ingredients">{$product->product->annotation|strip_tags:true}</div>{/if}
								{if $product->product->features}
								{foreach $product->product->features as $opt}
								<div class="price-weight">{$opt->value}</div>
								{/foreach}
								{/if}
							</div>
						</div>
						<div class="basket-col count-col">
							<form class="count-form">
								<button type="button" class="btn btn-minus"></button>
								<input type="text" class="number" value="{$product->amount}" disabled>
								<button type="button" class="btn btn-plus"></button>
							</form>
						</div>
						<div class="basket-col cost-col">{$product->variant->price|string_format:"%.2f"} {$currency->sign|escape}</div>
						<div class="basket-col del-col">
						<form action="/cart" class="removeFromCart">
						<input type="hidden" name="variant_id" value="{$product->variant->id}">
						<button type="submit" class="close">&times;</button>
						</form>
						</div>
					</div>
					{/foreach}
				</div>
				<div class="basket-result">
					<div class="row">
						<div class="col-lg-6 col-md-5 hidden-xs hidden-sm">
							<!--<img src="design/{$settings->theme|escape}/images/result-bg.jpg" alt="" class="img-responsive">-->
						</div>
						<div class="col-lg-6 col-md-7">
							<div class="result-row">
								<div class="result-col">Товаров на сумму:</div>
								<div class="result-col basket-total-cost">{$cart->total_price|string_format:"%.2f"} {$currency->sign|escape}</div>
							</div>
							<!--<div class="result-row basket-controls">
								<div class="result-col"><a href="#" class="link">Продолжить покупки</a></div>
								<div class="result-col"><a href="#" class="btn">Оформить заказ</a></div>
							</div>-->
						</div>
					</div>
					
					{* Доставка *}
					{if $deliveries}
					<div class="page-header-block" style="border-top: none;">
						<h2>Выберите способ доставки:</h2>
					</div>
					<form method="post" action="/order" class="form-horizontal">
						{foreach $payment_methods as $payment_method}	
							<input type="hidden" name="payment_method_id" value="{$payment_method->id}">
						{/foreach}
						<div class="form-group">
							<div class="btn-group col-xs-12" data-toggle="buttons">
								{foreach $deliveries as $delivery}
								<label data-role="switches" class="btn btn-default col-sm-6 col-xs-12 {if $delivery_id==$delivery->id}active{elseif $delivery@first}active{/if}">
									<input type="radio" name="delivery_id" id="deliveries_{$delivery->id}" value="{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}"> {$delivery->name} 
									<span {if $delivery->id == 1}id="free"{/if}>
										{if $cart->total_price < $delivery->free_from && $delivery->price>0}
											({$delivery->price|convert}&nbsp;{$currency->sign})
										{elseif $cart->total_price >= $delivery->free_from}
											(бесплатно)
										{/if}
									</span>
								</label>
								{/foreach}
							</div>
						</div> 
						{foreach $deliveries as $delivery}
							<div class="form-group">
								<div class="col-md-12 col-sm-12 col-xs-12 description" id="desc_{$delivery->id}" {if $delivery->id != 1}style="display: none;"{/if}>{$delivery->description|strip_tags:true}</div>
							</div>
						{/foreach}
						<div class="page-header-block" style="border-top: none;">
						<h2>Выберите способ оплаты:</h2>
						</div>
						<div class="form-group">
							<div class="btn-group col-xs-12" data-toggle="buttons">
								{foreach $payment_methods as $payment_method}
								<label class="btn btn-default col-sm-6 col-xs-12 {if $payment_method_id==$payment_method->id}active{elseif $payment_method@first}active{/if}">
									<input type="radio" name="payment_method_id" value="{$payment_method->id}" {if $payment_method_id==$payment_method->id}checked{elseif $payment_method@first}checked{/if} id="payment_method_{$payment_method->id}"> {$payment_method->name} 
								</label>
								{/foreach}
							</div>
						</div>
						{if $error}
							<div class="from-group">
								<div class="message_error" class="col-md-12 col-sm-12 col-xs-12">
									{if $error == 'empty_name'}Введите имя{/if}
									{if $error == 'empty_email'}Введите email{/if}
									{if $error == 'captcha'}Капча введена неверно{/if}
								</div>
							</div>
						{/if}
						<div class="form-group">
							<label class="control-label col-md-2">Имя, фамилия</label>
							<div class="col-md-4">
								<input name="name" type="text" value="{$name|escape}" data-format=".+" data-notice="Введите имя" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2">Телефон</label>
							<div class="col-md-4">
								<input name="phone" type="text" value="{$phone|escape}" data-format=".+" data-notice="Введите телефон" class="form-control" />
							</div>
						</div>
						<div class="form-group" id="adressForCurier">
							<label class="control-label col-md-2">Адрес доставки</label>
							<div class="col-md-4">
								<textarea name="address" rows="5" data-format=".+" data-notice="Введите адрес" class="form-control">{$address|escape}</textarea>
							</div>
						</div>
						<div class="form-group" id="adressForDelSelf">
							<label class="control-label col-md-2">Откуда будете забирать?</label>
							<div class="col-md-4">
								<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default col-sm-12 col-xs-12 active" style="margin-bottom:5px">
									<input type="radio" name="variant_delself" value="R" checked> c ул. Рощинская, 41
								</label>
								<label class="btn btn-default col-sm-12 col-xs-12">
									<input type="radio" name="variant_delself" value="E" > c ул. Емлютина, 2
								</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-2">
								<div class="captcha" >
									<img style="width:100px" src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/>
								</div> 
							</div>
							<div class="col-md-4">
								<div class="row">
									<div class="col-xs-8">
										<input class="input_captcha form-control" id="comment_captcha" type="text" placeholder="Число с картинки" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
									</div>
									<div class="col-xs-4 text-right">
										<button type="button" class="btn btn-default glyphicon glyphicon-refresh" id="refresh"></button>
									</div>
								</div>
								
							</div>
						</div>
						
						<div class="form-group">
							<div class="result-col col-md-4 col-md-offset-2">
								<button type="submit" class="btn btn-default">Оформить заказ</button>
							</div>
						</div>
					</form>
					{literal}
					<script>
						$(document).ready(function(){
							
							var deliveryActive = $('input[name=delivery_id]:checked').val();
							if(deliveryActive == 1){
								$('#adressForDelSelf').hide();
								$('#adressForCurier').show();
							}else{
								$('#adressForDelSelf').show();
								$('#adressForCurier').hide();
							}
					
							$('input[name=delivery_id]').change(function(){
							$('#baloon').hide();
								var id = $(this).val();
								$('.description').hide();
								$('#desc_' + id).show();
								if(id==1){
									$('#adressForDelSelf').hide();
									$('#adressForCurier').show();	
									$('#adressForCurier textarea').attr({'data-format':'.+','data-notice':'Введите адрес'});
								}else{
									$('#adressForDelSelf').show();
									$('#adressForCurier').hide();
									$('#adressForCurier textarea').removeAttr('data-format');
									$('#adressForCurier textarea').removeAttr('data-notice');
									$('#adressForCurier textarea').val('');
								}
							});
							
							function randomInteger(min, max) {
								var rand = min - 0.5 + Math.random() * (max - min + 1)
								rand = Math.round(rand);
								return rand;
							}
							
							$('#refresh').click(function(){
								$('.captcha img').attr("src","captcha/image.php?" + randomInteger(10, 1000));
							});
							
						});
					</script>
					{/literal}
					{/if}
				</div>
				{/if}
			</div>
			{include file="sidebar.tpl"}
		</div>
	</div>
</div>