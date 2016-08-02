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

	<div class="stock-slider">
		<div class="container">
			<div class="block-name"><span>Акции</span></div>
			<div class="owl-carousel">
				<div>
					<div class="stock-card">
						<div class="card-img-col">
							<div class="img-cont"><img src="design/{$settings->theme|escape}/images/stock-p1.jpg" alt="Акция" class="img-responsive"></div>
							<div class="col-header">Спринг грибы в подарок!</div>
						</div>
						<div class="card-info-col">
							При заказе на сумму от 800 руб. 
							Вы получите ролл Спринг грибы 
							в подарок! В стоимость заказа 
							не входят сеты и напитки.
							Акция проводится 10:00 до 22:00
							<a href="#" class="moreinfo-link">Подробнее</a>
						</div>
					</div>
				</div>
				<div>
					<div class="stock-card">
						<div class="card-img-col">
							<div class="img-cont"><img src="design/{$settings->theme|escape}/images/stock-p1.jpg" alt="Акция" class="img-responsive"></div>
							<div class="col-header">Спринг грибы в подарок!</div>
						</div>
						<div class="card-info-col">
							При заказе на сумму от 800 руб. 
							Вы получите ролл Спринг грибы 
							в подарок! В стоимость заказа 
							не входят сеты и напитки.
							Акция проводится 10:00 до 22:00
							<a href="#" class="moreinfo-link">Подробнее</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="slider-price popular-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Самые популярные</div>
				<div class="slider-nav" id="popular-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">
				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="info-flag flag-discount">-20%</div>
							<div class="menu-number">21</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-1.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Радуга</p>
								<p class="price-components">Рис, сыр, креветка, окунь, тунец,лосось, угорь, лосось х/к</p>
								<p class="price-weight">270 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="old-cost">190 р.</span>
								<span class="current-cost">160 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="info-flag flag-new">new</div>
							<div class="menu-number">20</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-2.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Глаз дракона</p>
								<p class="price-components">Рис, лосось х/к, томаго, огурец, икра лососевая</p>
								<p class="price-weight">220 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="current-cost">170 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="menu-number">24</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-3.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Эдо</p>
								<p class="price-components">Рис, сыр, угорь, тобикко оранжевая</p>
								<p class="price-weight">260 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="current-cost">190 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="info-flag flag-discount">-30%</div>
							<div class="menu-number">25</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-4.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Калифорния с имитацией краба</p>
								<p class="price-components">Рис, майонез, имитация краба, авокадо, огурец</p>
								<p class="price-weight">270 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="old-cost">190 р.</span>
								<span class="current-cost">160 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="slider-price new-price-slider">
		<div class="container">
			<div class="block-header">
				<div class="bh-text">Новинки</div>
				<div class="slider-nav" id="new-price-slider-nav"></div>
				<div class="clearfix"></div>
			</div>
			<div class="owl-carousel">
				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="info-flag flag-hit">хит</div>
							<div class="menu-number">31</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-5.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Аляска</p>
								<p class="price-components">Рис, сыр филадельфия, лосось х/к, огурец, укроп сверху, помидорчерри</p>
								<p class="price-weight">310 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="current-cost">180 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="menu-number">12</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-6.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Филадельфия с авокадо</p>
								<p class="price-components">Рис, сыр филадельфия, авокадо, лосось</p>
								<p class="price-weight">290 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="current-cost">180 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="info-flag flag-discount">-20%</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-7.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Тортилья с курицей</p>
								<p class="price-components">Лепешка тортилья, куриная грудка, огурец, помидор, соус цезарь, лист салата</p>
								<p class="price-weight">1 шт.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="old-cost">150 р.</span>
								<span class="current-cost">120 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="price-item">
						<div class="price-header clearfix">
							<div class="menu-number">2</div>
						</div>
						<a href="#" class="price-link">
							<div class="price-img"><img src="design/{$settings->theme|escape}/images/price-8.jpg" alt="Товар" class="img-responsive"></div>
							<div class="price-info">
								<p class="price-name">Спайс с мидиями</p>
								<p class="price-components">Рис, мидии, спайси</p>
								<p class="price-weight">110 гр.</p>
							</div>
						</a>
						
						<div class="price-footer clearfix">
							<div class="price-cost">
								<span class="current-cost">70 р.</span>
							</div>
							<div class="price-form">
								<form action="">
									<button class="btn addToBasket">В корзину</button>
								</form>
							</div>
						</div>
					</div>
				</div>
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