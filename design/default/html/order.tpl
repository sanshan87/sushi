{* Страница заказа *}

{$meta_title = "Ваш заказ №`$order->id`"}
{$wrapper = 'wrapper_for_products.tpl' scope=parent}
<div class="breadcrumb-block">
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/">Главная</a></li>
			<li class="active">Заказ</li>
		</ol>
	</div>
</div>
<div class="content">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-8 col-xs-12">
				<div class="page-header-block">
					<h1>Ваш заказ №{$order->id} 
					{if $order->status == 0}принят{/if}
					{if $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
					{if $order->paid == 1}, оплачен{else}{/if}
					</h1>
					<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
				</div>
				
				{* Список покупок *}
				<div class="basket-container">
					{foreach $purchases as $purchase}
					<div class="basket-row">
						<div class="basket-col info-col">
							<div class="price-img">
								{$image = $purchase->product->images|first}
								{if $image}
								<a href="products/{$purchase->product->url}"><img src="{$image->filename|resize:86:50}" alt="{$product->name|escape}"></a>
								{/if}
							</div>
							<div class="price-descr">
								<div class="price-name">
									<a href="/products/{$purchase->product->url}">{$purchase->product_name|escape}</a>
								</div>
								{$purchase->variant_name|escape}
								{if $order->paid && $purchase->variant->attachment}
									<a class="download_attachment" href="order/{$order->url}/{$purchase->variant->attachment}">скачать файл</a>
								{/if}
							</div>
						</div>
						<div class="basket-col">
							{($purchase->price)|convert}&nbsp;{$currency->sign}
						</div>
						<div class="basket-col">&times; {$purchase->amount}&nbsp;{$settings->units}</div>
						<div class="basket-col">
							{($purchase->price*$purchase->amount)|string_format:"%.2f"}&nbsp;{$currency->sign}
						</div>
					</div>
					{/foreach}

					{* Скидка, если есть *}
					{if $order->discount > 0}
					<div class="basket-row">
						<div class="basket-col"><b>Скидка</b></div>
						<div class="basket-col"></div>
						<div class="basket-col"></div>
						<div class="basket-col">{$order->discount}&nbsp;%</div>
					</div>
					{/if}

					{* Если стоимость доставки входит в сумму заказа *}
					{*{if !$order->separate_delivery && $order->delivery_price>0}*}
					<div class="basket-row">
						<div class="basket-col"><b>{$delivery->name|escape}</b></div>
						<div class="basket-col"></div>
						<div class="basket-col"></div>
						<div class="basket-col">{$order->delivery_price|string_format:"%.2f"}&nbsp;{$currency->sign}</div>
					</div>
					{*{/if}*}

					{* Итого *}
					<div class="basket-row">
						<div class="basket-col"><b>Итого</b></div>
						<div class="basket-col"></div>
						<div class="basket-col"></div>
						<div class="basket-col">{$order->total_price|string_format:"%.2f"}&nbsp;{$currency->sign}</div>
					</div>

					{* Если стоимость доставки не входит в сумму заказа *}
					{if $order->separate_delivery}
					<div class="basket-row">
						<div class="basket-col"><b>{$delivery->name|escape}</b></div>
						<div class="basket-col"></div>
						<div class="basket-col"></div>
						<div class="basket-col">{$order->delivery_price|convert}&nbsp;{$currency->sign}</div>
					</div>
					{/if}
				</div>

				{* Детали заказа *}
				<div class="page-header-block">
					<h2>Детали заказа</h2>
				</div>
				
				<div class="order-info">
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Дата заказа</b></div>
						<div class="col-md-6 col-xs-6">
							{$order->date|date} в
							{$order->date|time}
						</div>
					</div>
					{if $order->name}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Имя</b></div>
						<div class="col-md-6 col-xs-6">{$order->name|escape}</div>
					</div>
					{/if}
					{if $order->email}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Email</b></div>
						<div class="col-md-6 col-xs-6">{$order->email|escape}</div>
					</div>
					{/if}
					{if $order->phone}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Телефон</b></div>
						<div class="col-md-6 col-xs-6">{$order->phone|escape}</div>
					</div>
					{/if}
					{if $order->address}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Адрес доставки</b></div>
						<div class="col-md-6 col-xs-6">{$order->address|escape}</div>
					</div>
					{/if}
					{if $order->payment_method_id}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Способ оплаты</b></div>
						<div class="col-md-6 col-xs-6">{$payment_method->name}</div>
						
					</div>
					{/if}
					
					{if $order->delivery_id == 2}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Точка выдачи</b></div>
						<div class="col-md-6 col-xs-6">{if $order->from_adress == 'R'}ул. Рощинская, д.41{/if}{if $order->from_adress == 'E'}ул. Емлютина, д.2{/if}</div>
						
					</div>										
					{/if}
					{if $order->comment}
					<div class="row">
						<div class="col-md-2 col-xs-6"><b>Комментарий</b></div>
						<div class="col-md-6 col-xs-6">{$order->comment|escape|nl2br}</div>
					
					</div>
					{/if}
				</div>
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


