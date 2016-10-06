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
		{include file='price_item.tpl' product=$product}
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

{if $category->description}
	<div class="text-content">
		<div class="container">
			{* <h1 class="text-center">СУШИ И РОЛЛЫ В ОРЛЕ</h1> *}
			<div class="row">
				<div class="col-xs-12">
					<img src="design/{$settings->theme|escape}/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
					{$category->description}
				</div>
			</div>
		</div>
	</div>
{/if}