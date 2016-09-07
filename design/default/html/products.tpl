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
					<li{if $cat@last} class="active"{/if}>{if !$cat@last}<a href="catalog/{$cat->url}">{/if}{$cat->name|escape}{if !$cat@last}</a>{/if}</li>
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
					<div class="menu-number {if !$product->variant->sku}b-transp{/if}">{$product->variant->sku}</div>
				</div>
				<a href="products/{$product->url}" class="price-link">
				{if $product->image}
					<div class="price-img"><img src="{$product->image->filename|resize:$settings->preview_x:$settings->preview_y}" alt="{$product->name|escape}" class="img-responsive"></div>
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
				{if $product->variants|count < 2}
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
				{else}
				<form class="variants" action="">
				<div class="price-footer clearfix">
					<div class="price-form" style="width:80%">
						<button style="background:#948788;" class="btn selectOption" onclick="document.location.href='/products/{$product->url}'">{if $product->option_label}{$product->option_label}{else}{$config->label_for_variants}{/if}</button>
					</div>
				</div>
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
				{include file="sidebar.tpl"}
			</div>
		</div>
	</div>
	<div class="text-content">
		<div class="container">
			<h1 class="text-center">Суши и роллы в Орле</h1>
			<div class="row">
				<div class="col-md-6 col-xs-12">
					<img src="design/{$settings->theme|escape}/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
					Самым популярным японским блюдом является суши, его можно 
					считать визитной карточкой японской кухни. Япония располагается 
					на островах, окруженных морем, которое богато разнообразными рыбами, моллюсками и ракообразными. Поскольку в Японии гористая местность, существует проблема с недостатком культивируемой пахотной земли, поэтому население Японии, преимущественно выращивает рис. Для иностранцев суши (комбинация сырого филе и сваренного особым образом риса) всегда казалось экзотическим блюдом, но для японцев эта пища считается натуральной, так как они привыкли питаться дарами моря и рисовыми полями.
				</div>
				<div class="col-md-6 col-xs-12">
					Суши или суси, как их иногда называют, приобрели широкую популярность во всем мире с начала 1980-х годов. В нашей стране сегодня это блюдо любят и едят очень многие. Суши невозможно сравнить ни с одним рыбным блюдом русской или европейской кухни. Они имеют неповторимый вкус и очень нежную текстуру.<br> Первые суши появились в Южной Азии. Там варёный рис начали использовать для приготовления и консервации рыбы.Рыба очищалась и нарезалась на маленькие кусочки. Затем ее солили и смешивали с рисом. После этого на рыбу клали камни 
					в качестве пресса. Это помогало избежать попадания воздуха. 
				</div>
			</div>
		</div>
	</div>