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
			<h1 class="text-center">Доставка суши</h1>
			<div class="row">
				<div class="col-xs-12">
					<img src="design/{$settings->theme|escape}/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
					<p>Интернет-магазин вкусной еды с доставкой на дом «Сушитория» рад приветствовать вас на нашем сайте! Аппетитное меню «Сушитории» включает более сотни блюд для вашего удовольствия и хорошего настроения. Мы осуществляем доставку суши, роллов, горячих блюд, пиццы, закусок и напитков на дом и в офис по городу Орлу.</p>

					<p>Японские блюда уже давно превратились из загадочной экзотики в любимую и желанную еду россиян. Их не стыдно подать на праздничный стол, ими приятно побаловать себя в выходные и будни. Для нас секрет популярности роллов и суши очевиден, ведь они:</p>
					
					<ul>
						<li>готовятся исключительно перед подачей/доставкой, а значит, это неизменно свежий и качественный продукт;</li>
						<li>не вредят фигуре и полезны для здоровья, ибо производятся только из натуральных ингредиентов;</li>
						<li>имеют изысканные, неповторимые ни в одной другой кухне мира вкусы, ароматы, текстуры и формы. Японская еда умеет удивлять, оставаясь при этом традиционной и умопомрачительно вкусной!</li>
					</ul>
		
					<p>Заказать суши – значит обеспечить себе и своим близким сытный, полезный и аппетитный обед или ужин, решить сразу множество проблем перед неожиданной вечеринкой или посиделками друзей. Не нужно готовить, сервировать, подавать! Считайте, что мы уже все сделали за вас, а вам остается лишь оформить заказ и наслаждаться результатом работы профессионалов. Ручаемся, что, заказав суши на дом, вы угадаете тайные желания своих гостей и обеспечите отличное настроение всей компании.</p>

					<p>Повара «Сушитории» вкладывают в каждое блюдо не только высокий кулинарный профессионализм, но и тонкое знание специфики японской кухни – и это именно то, что делает наши блюда незабываемыми. Мы не экономим на качестве и количестве продуктов! У нас нет и никогда не будет полуфабрикатов и заготовок – каждый раз мы готовим из свежих продуктов непосредственно перед отправкой заказа клиенту.</p>

					<p>Заказ еды в «Сушитории» - это гарантированное удовольствие от великолепного вкуса наших блюд, дополненное безупречным сервисом!</p>
				</div>
			</div>
		</div>
	</div>