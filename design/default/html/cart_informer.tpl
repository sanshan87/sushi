{* Информера корзины (отдаётся аяксом) *}
{*{if $cart->total_products>0}
	В <a href="./cart/">корзине</a>
	{$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}
	на {$cart->total_price|convert} {$currency->sign|escape}
{else}
	Корзина пуста
{/if}*}



		<a href="#" class="sb-btn">
			<div class="h-btn">
				<span class="basket-count">{if !$cart->total_products}0{else}{$cart->total_products}{/if}</span>
			</div>
		</a>

		<div class="basket">
			<div class="basket-header">
				<span class="bh-name">Корзина</span>
				<a href="#" class="basket-close">Свернуть</a>
			</div>
			{if $cart->purchases|@count}
			<div class="items-wrap">
				<ul class="basket-items list-unstyled">
				{foreach $cart->purchases as $product}
					<li class="b-item">
						<div class="b-price-img hidden-xs">
						{foreach $product->product->images as $image}
							<img src="{$image->filename|resize:63:32}" alt="{$product->product->name}" class="img-responsive">
						{/foreach}
						</div>
						<div class="b-price-info">
							<a href="#" class="price-name">{$product->product->name}</a>
							<div class="form-inline">
								<label class="price-count" for="b-item-1">Кол-во:</label>
								<input type="text" class="form-control" id="b-item-1" name="item_amount" value="{$product->amount}">
							</div>
						</div>
						<div class="b-price-cost">{$product->variant->price|convert} {$currency->sign|escape}</div>
						<div class="b-price-close">
							<form action="/cart" class="removeFromCart">
								<input type="hidden" name="variant_id" value="{$product->variant->id}">
								<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</form>
						</div>
					</li>
				{/foreach}	
				</ul>
			</div>
			

			<div class="basket-buttons">
				<div class="basket-total">Итого к оплате: <b>{$cart->total_price|convert} {$currency->sign|escape}</b></div>
				<div><a href="#" class="link">Продолжить покупки</a></div>
				<div><a href="#" class="btn">Оформить заказ</a></div>
			</div>
			{else}
			<div class="items-wrap">
			Пусто
			</div>
			{/if}
		</div>
