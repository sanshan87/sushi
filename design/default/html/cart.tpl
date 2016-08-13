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
								<div class="price-name">{$product->product->name}</div>
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
					<div class="row">
					{* Доставка *}
{if $deliveries}
				<div class="page-header-block">
					<h1>Выберите способ доставки:</h1>
				</div>
	<form method="post" action="/order">
	{foreach $payment_methods as $payment_method}	
	<input type="hidden" name="payment_method_id" value="{$payment_method->id}">
	{/foreach}
	{foreach $deliveries as $delivery}
	<div class="col-md-6 col-sm-12 col-xs-12">
		<div class="checkbox">
			<input type="radio" name="delivery_id" value="{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}">
		</div>
		
			<h3 style="margin-top: 0;
    margin-bottom: 16px;
    font-family: 'Roboto Slab',serif;
    font-size: 18px;">
			<label for="deliveries_{$delivery->id}">
			{$delivery->name}
			<span{if $delivery->id == 1} id="free"{/if}>{if $cart->total_price < $delivery->free_from && $delivery->price>0}
				({$delivery->price|convert}&nbsp;{$currency->sign})
			{elseif $cart->total_price >= $delivery->free_from}
				(бесплатно)
			{/if}
			</span>
			</label>
			</h3>
	</div>
	{/foreach}  
<div class="clearfix"></div> 
{foreach $deliveries as $delivery}
   <div class="col-md-12 col-sm-12 col-xs-12 description" id="desc_{$delivery->id}" {if $delivery->id != 1}style="display:none"{/if}>
   {$delivery->description|strip_tags:true}
   </div>
 {/foreach}
	{if $error}
	<div class="message_error" class="col-md-12 col-sm-12 col-xs-12">
		{if $error == 'empty_name'}Введите имя{/if}
		{if $error == 'empty_email'}Введите email{/if}
		{if $error == 'captcha'}Капча введена неверно{/if}
	</div>
	{/if}
	<div class="col-md-12 col-sm-12 col-xs-12">
	<label>Имя, фамилия</label>
	<input name="name" type="text" value="{$name|escape}" data-format=".+" data-notice="Введите имя"/>
	</div>
	<div  class="col-md-12 col-sm-12 col-xs-12">
	<label>Телефон</label>
	<input name="phone" type="text" value="{$phone|escape}" />
	</div>
	<div  class="col-md-12 col-sm-12 col-xs-12">
	<label>Адрес доставки</label>
	<input name="address" type="text" value="{$address|escape}"/>	
	</div>
	<div class="captcha" ><img style="width:120px" src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/></div> 
	<input class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
	<div class="result-row basket-controls">
		<!--<div class="result-col"><a href="#" class="link">Продолжить покупки</a></div>-->
		<div class="result-col"><input type="submit" name="checkout" class="button" value="Оформить заказ"><!--<a href="#" class="btn">Оформить заказ</a>--></div>
	</div>
	</form>
	<script>
	$(document).ready(function(){
		$('input[name=delivery_id]').click(function(){
		var id = $(this).val();
		$('.description').hide();
		$('#desc_' + id).show();
		
		
		});
	});
	</script>
{/if}
</div>
				</div>
				{/if}
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
							{include file="main_menu.tpl"}
						</div>
					</div>
					<div class="col-xs-12">
						<div class="working-info">
							<div class="border"></div>
							<div class="wi-text">
							{include file='working_info.tpl'}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>