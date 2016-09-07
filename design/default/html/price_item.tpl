{* $product - объект с данными о товаре *}

<div class="price-item catalog-item">
	<div class="price-header clearfix">
		<div class="info-flags">
			{if $product->novelty}
				<div class="info-flag {if $product->novelty == 1}flag-new{elseif $product->novelty == 2}flag-hit{/if}">{if $product->novelty == 1}new{elseif $product->novelty == 2}Хит{/if}</div>
			{/if}
			{if $product->variant->skidka > 0}
				<div class="info-flag flag-discount">-{$product->variant->skidka}%</div>
			{/if}
		</div>
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
	<form class="variants" action="/cart">
	<div class="price-footer clearfix">
		<div class="price-form" style="width:80%">
			<button style="background:#948788;" class="btn selectOption" onclick="document.location.href='/products/{$product->url}'">{if $product->option_label}{$product->option_label}{else}{$config->label_for_variants}{/if}</button>
		</div>
	</div>
	</form>
	{/if}
</div>