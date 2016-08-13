<nav class="navbar navbar-default">
	<div class="container">
		<div class="row">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="main-navbar">
				<ul class="nav navbar-nav" id="menu">
				{foreach $pages as $p}
					{* Выводим только страницы из первого меню *}
					{if $p->menu_id == 1}
					<li {if $page && $page->id == $p->id}class="selected"{/if}>
						<a data-page="{$p->id}" href="{$p->url}">{$p->name|escape}</a>
					</li>
					{/if}
				{/foreach}
				</ul>
					
				<ul class="nav navbar-nav navbar-right nav-social hidden-sm">
					<li><a href="https://vk.com/sushitoriya">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
				</ul>

				<form class="navbar-form navbar-right" role="search" id="navbar-form" action="/products">
					<div class="form-group">
						<input type="text" class="form-control input_search" placeholder="Поиск" name="keyword" value="{$keyword|escape}">
					</div>
					<button type="submit" class="btn btn-search"><span class="glyphicon glyphicon-search"></span></button>
				</form>
			</div>
		</div>
	</div>
</nav>
<header class="main-header">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<a href="#"><img src="design/{$settings->theme|escape}/images/header-logo.png" alt="Сушитория" class="img-responsive h-logo"></a>
			</div>
			<div class="col-md-6 col-sm-7 col-xs-12 text-center">
				<div class="h-contacts">
					<div><a href="tel:+74862303010">30-30-10</a> (Северный / Железнодорожный / Советский р-н)</div>
					<div><a href="tel:+74862303020">30-30-20</a> (Заводской / Советский р-н)</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-2 col-xs-12">
				<a href="/cart" class="h-basket">
					<div class="b-icon">
						<div class="b-icon-count" id="cnt_in_cart">{if $cart->total_products}{$cart->total_products}{else}0{/if}</div>
					</div>
					<div class="b-text hidden-sm">
						<b>Корзина</b><span id="txt_cnt">В корзине {if $cart->total_products}{$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}{else}0 товаров{/if}</span>
					</div>
				</a>
			</div>
		</div>
	</div>
</header>