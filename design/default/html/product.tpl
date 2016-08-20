{* Страница товара *}

{* Канонический адрес страницы *}
{$canonical="/products/{$product->url}" scope=parent}
{$wrapper = 'wrapper_for_products.tpl' scope=parent}
<!-- Хлебные крошки /-->
<div class="breadcrumb-block">
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/">Главная</a></li>
			{foreach $category->path as $cat}
			<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
			{/foreach}  
			{if $brand}
			<li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a></li>
			{/if}
			<li class="active">{$product->name|escape} </li>
		</ol>
	</div>
</div>
<!-- Хлебные крошки #End /-->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-8 col-xs-12">
					<div class="page-header-block">
						<h1 data-product="{$product->id}">{$product->name|escape}</h1>
						<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
					</div>
					<div class="price-info">
						<div class="row">
						<form class="variants" action="/cart" data-page="product">
							<div class="col-md-7">
								<div class="price-item">
									<div class="price-header clearfix">
										{if $product->variant->skidka > 0}
										<div class="info-flag flag-discount">-{$product->variant->skidka}%</div>
										{/if}
										{if $product->variant->sku}<div class="menu-number">{$product->variant->sku}</div>{/if}
									</div>
									{if $product->image}
									<img src="{$product->image->filename|replace:'_mini':'_orig'|resize:466:466}" alt="{$product->name|escape}" class="img-responsive">
									{/if}
								</div>
							</div>
							<div class="col-md-5">
								<div class="price-text">
									{if $product->annotation}<p><b>Ингридиенты:</b><br><span>{$product->annotation|strip_tags:true}</span></p>{/if}
									{if $product->features}
									<!-- Характеристики товара -->
									<h2>Характеристики</h2>
									{foreach $product->features as $f}
										<p><b>{$f->name}:</b> <span>{$f->value}</span></p>
									{/foreach}
									<!-- Характеристики товара (The End)-->
									{/if}
									{if $product->body}
									<p><b>Описание:</b><br>
									<span>{$product->body|strip_tags:true}</span>
									</p>
									{/if}
									{if $product->variants|count > 0}
									{foreach $product->variants as $v}
										<div class="price-buttons">
											<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
											<div class="price-cost">{($v->price|convert - $v->price|convert*$v->skidka/100)|string_format:"%.2f"} {$currency->sign|escape}</div>
											<button type="submit" class="btn addToBasket">В корзину</button>
										</div>
									{/foreach}	
									{/if}
								</div>
							</div>
						</form>
						</div>
						<div class="like-info">
							<img src="design/{$settings->theme|escape}/images/like-info.jpg" alt="">
						</div>
					</div>
					{if $related_products}
					<div class="buyWithItem">
						<h1>С этим продуктом часто заказывают</h1>
						<div class="row">
							{foreach $related_products as $related_product}
							<div class="col-md-4 col-sm-6">
								<div class="price-item catalog-item">
									<div class="price-header clearfix">
									{if $related_product->variant->skidka > 0}
										<div class="info-flag flag-discount">-{$related_product->variant->skidka}%</div>
									{/if}
										<div class="menu-number">{$related_product->variant->sku}</div>
									</div>
									<a href="products/{$related_product->url}" class="price-link">
									{if $related_product->image}
										<div class="price-img"><img src="{$related_product->image->filename|resize:$settings->preview_x:$settings->preview_y}" alt="{$related_product->name|escape}" class="img-responsive"></div>
									{/if}	
										<div class="price-info">
											<p class="price-name">{$related_product->name|escape}</p>
											<p class="price-components">{$related_product->annotation|strip_tags:true}</p>
											{if $related_product->features}
											{foreach $related_product->features as $opt}
											<p class="price-weight">{$opt->value}</p>
											{/foreach}
											{/if}
										</div>
									</a>
									{if $related_product->variants|count > 0}
									<form class="variants" action="/cart">
									{foreach $related_product->variants as $v}
									<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
									<div class="price-footer clearfix">
										<div class="price-cost">
										{if $v->skidka > 0}
											<span class="old-cost">{$v->price|convert} {$currency->sign|escape}</span>
											<span class="current-cost">{($v->price|convert - $v->price|convert*$v->skidka/100)|string_format:"%.2f"}</span>
										{else}
											<span class="current-cost">{$v->price|convert} {$currency->sign|escape}</span>
										{/if}
										</div>
										<div class="price-form">
											<button class="btn addToBasket" type="submit">В корзину</button>
										</div>
									</div>
									{/foreach}
									</form>
									{/if}
								</div>
							</div>
							{/foreach}
						</div>	
					</div>
					{/if}
					<div class="text-content">
						<h1>Суши и роллы в Орле</h1>
						<div>
							<img src="design/{$settings->theme|escape}/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
							Самым популярным японским блюдом является суши, его можно  считать визитной карточкой японской кухни. Япония располагается на островах, окруженных морем, которое богато разнообразными рыбами, моллюсками и ракообразными. Поскольку в Японии гористая местность, существует проблема с недостатком культивируемой пахотной земли, поэтому население Японии, преимущественно выращивает рис. Для иностранцев суши (комбинация сырого филе и сваренного особым образом риса) всегда казалось экзотическим блюдом, но для японцев эта пища считается натуральной, так как они привыкли питаться дарами моря и рисовыми полями.
						</div>
					</div>
				</div>
				{include file="sidebar.tpl"}
			</div>
		</div>
	</div>