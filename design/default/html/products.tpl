{* Список товаров *}
{* Канонический адрес страницы *}
{if $category && $brand}
{$canonical="/catalog/{$category->url}/{$brand->url}" scope=parent}
{elseif $category}
{$canonical="/catalog/{$category->url}" scope=parent}
{elseif $brand}
{$canonical="/brands/{$brand->url}" scope=parent}
{elseif $keyword}
{$canonical="/products?keyword={$keyword|escape}" scope=parent}
{else}
{$canonical="/products" scope=parent}
{/if}
{$wrapper = 'wrapper_for_products.tpl' scope=parent}
<!-- Хлебные крошки /-->
	<div class="breadcrumb-block">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="/">Главная</a></li>
					{if $category}
					{foreach $category->path as $cat}
					<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
					{/foreach}  
					{if $brand}
					<li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a></li>
					{/if}
					{elseif $brand}
					<li><a href="brands/{$brand->url}">{$brand->name|escape}</a></li>
					{elseif $keyword}
					<li>Поиск</li>
					{/if}				
			</ol>
		</div>
	</div>
<!-- Хлебные крошки #End /-->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-8 col-xs-12">
					<div class="page-header-block">
						{* Заголовок страницы *}
						{if $keyword}
						<h1>Поиск {$keyword|escape}</h1>
						{elseif $page}
						<h1>{$page->name|escape}</h1>
						{else}
						<h1>{$category->name|escape} {$brand->name|escape}</h1>
						{/if}
						<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
					</div>
<!--Каталог товаров-->
{if $products}
<div class="catalog-items">
	<div class="row">
<!-- Список товаров-->
	{foreach $products as $product}
	<!-- Товар-->
	<div class="col-md-4 col-sm-6">
		<div class="price-item catalog-item">
			<div class="price-header clearfix">
				{if $product->variant->skidka > 0}
					<div class="info-flag flag-discount">-{$product->variant->skidka}%</div>
				{/if}
					<div class="menu-number">{$product->variant->sku}</div>
				</div>
				<a href="products/{$product->url}" class="price-link">
				{if $product->image}
					<div class="price-img"><img src="{$product->image->filename|resize:225:120}" alt="{$product->name|escape}" class="img-responsive"></div>
				{/if}	
					<div class="price-info">
						<p class="price-name">{$product->name|escape}</p>
						<p class="price-components">{$product->annotation|strip_tags:true}</p>
												{if $product->features}
						{foreach $product->features as $opt}
						<p class="price-weight">{$opt->value}</p>
						{/foreach}
						{/if}
					</div>
				</a>
				{if $product->variants|count > 0}
				<form class="variants" action="/cart">
				{foreach $product->variants as $v}
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
	<!-- Товар (The End)-->
	{/foreach}			
{include file='pagination.tpl'}	
<!-- Список товаров (The End)-->
	</div>	
</div>
{else}
Товары не найдены
{/if}
<!--Каталог товаров (The End)-->
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
								<ul class="main-menu">
									<li class="menu-header">Меню</li>										
									{* функция вывода дерева категорий *}
									{function name=categories_tree}
									{if $categories}
									{foreach $categories as $c}
										{* Показываем только видимые категории *}
										{if $c->visible}
											<li>
											{if $c->subcategories|@count>0}
												<div class="dropdown">
														<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$c->name|escape} <span>(4)</span></a>
														<ul class="dropdown-menu"> 
															{foreach $c->subcategories as $subCat}
															<li><a {if $category->id == $subCat->id}class="selected"{/if} href="catalog/{$subCat->url}">{$subCat->name|escape}</a></li>
															{/foreach}
														</ul>
												</div>
											{else}
												<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape} <span>(4)</span></a>
											{/if}
											</li>
										{/if}
									{/foreach}
									{/if}
									{/function}
									{categories_tree categories=$categories}
								</ul>	
							</div>
						</div>
						<div class="col-xs-12">
							<div class="working-info">
								<div class="border"></div>
								<div class="wi-text">
									<p><b>Доставка суши и роллов</b></p>
									<p>Бесплатная<br>доставка от 400р.</p>
									<img src="design/{$settings->theme|escape}/images/time-icon.png" alt="Time" class="time-icon">
									<p><b>Время работы:</b></p>
									<p>вс - чт с 10-00 до 22-00<br>пт - сб с 10-00 до 23-00</p>
									<p>Без перерывов<br>и выходных</p>
								</div>
							</div>
						</div>
						<div class="col-xs-12 sidebar-sale">
							<h3>Акции</h3>
							<div class="sale-item">
								<div class="img-block">
									<img src="design/{$settings->theme|escape}/images/side-sale.jpg" alt="" class="img-responsive">
									<div class="sale-header">Спринг грибы в подарок!</div>
								</div>
								<div class="info-block">
									<div class="item-text">
										При заказе на сумму от 800 руб. 
										Вы получите ролл Спринг грибы 
										в подарок! В стоимость заказа 
										не входят сеты и напитки.
									</div>
									<div class="item-time">Акция проводится 10:00 до 22:00</div>
									<a href="#" class="link-more">Подробнее</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>