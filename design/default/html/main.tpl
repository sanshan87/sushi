{* Главная страница магазина *}

{* Для того чтобы обернуть центральный блок в шаблон, отличный от index.tpl *}
{* Укажите нужный шаблон строкой ниже. Это работает и для других модулей *}
{$wrapper = 'index.tpl' scope=parent}

{* Канонический адрес страницы *}
{$canonical="" scope=parent}

{* Заголовок страницы *}
{*<h1>{$page->header}</h1>*}

{* Тело страницы *}
{*$page->body*}

{* Акции *}
{get_stocks var=stocks}
{if $stocks}
	<div class="stock-slider">
		<div class="container">
			<div class="block-name"><span>Акции</span></div>
			<div class="owl-carousel">
			{foreach $stocks as $stock}
				<div>
					<div class="stock-card">
						<div class="card-img-col">
							<div class="img-cont"><img src="{$stock->filename|resize:225:120}" alt="Акция" class="img-responsive"></div>
							<div class="col-header">{$stock->name}</div>
						</div>
						<div class="card-info-col">
							{$stock->annotation|truncate:120}
							<div>Акция проводится {$stock->start|date_format:"%H:%M"} до {$stock->end|date_format:"%H:%M"}</div>
							<a href="/shares#{$stock@key}" class="moreinfo-link">Подробнее</a>
						</div>
					</div>
				</div>
			{/foreach}
			</div>
		</div>
	</div>
{/if}

{* Популярные товары *}
{get_featured_products var=featured_products}
{if $featured_products}
<!-- Список товаров-->
	<div class="slider-price popular-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Самые популярные</div>
				<div class="slider-nav" id="popular-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">
			{foreach $featured_products as $product}
				<div>
					{include file='price_item.tpl' product=$product}
				</div>
			{/foreach}
			</div>
		</div>
	</div>			
{/if}
	
{* Новинки *}
{get_new_products var=new_products limit=5 novelty=1}
{if $new_products}
	<div class="slider-price new-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Новинки</div>
				<div class="slider-nav" id="new-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">
			{foreach $new_products as $product}
				<div>
					{include file='price_item.tpl' product=$product}
				</div>
			{/foreach}
			</div>
		</div>
	</div>
{/if}
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