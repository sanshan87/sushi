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
		
		{get_stocks var=stocks limit=2}
		{if $stocks}
		<div class="col-xs-12 sidebar-sale">
			<h3>Акции</h3>
			{foreach $stocks as $stock}
			<div class="sale-item">
				<div class="img-block">
					<img src="{$stock->filename|resize:225:120}" alt="" class="img-responsive">
					<div class="sale-header">{$stock->name}</div>
				</div>
				<div class="info-block">
					<div class="item-text">
						{$stock->annotation|truncate:120}
					</div>
					<div class="item-time">Акция проводится {$stock->start|date_format:"%H:%M"} до {$stock->end|date_format:"%H:%M"}</div>
					<a href="/shares#{$stock@key}" class="link-more">Подробнее</a>
				</div>
			</div>
			{/foreach}
		</div>
		{/if}
	</div>
</div>