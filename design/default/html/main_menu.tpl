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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$c->name|escape} <!--<span>(4)</span>--></a>
						<ul class="dropdown-menu"> 
							{foreach $c->subcategories as $subCat}
							<li><a {if $category->id == $subCat->id}class="selected"{/if} href="catalog/{$subCat->url}">{$subCat->name|escape}</a></li>
							{/foreach}
						</ul>
				</div>
			{else}
				<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape} <!--<span>(4)</span>--></a>
			{/if}
			</li>
		{/if}
	{/foreach}
	{/if}
	{/function}
	{categories_tree categories=$categories}
</ul>