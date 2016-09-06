	<div class="footer-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xs-12 hidden-xs">
				{get_rolls var=rolls id=6}
				{if $rolls}
					<ul class="footer-nav list-unstyled">
						<li class="menu-header">{$rolls->name}</li>
							{foreach $rolls->subcategories as $subcat}
							{if $subcat->visible}
								<li><a href="/catalog/{$subcat->url}" {if $category->id == $subcat->id}class="selected_menu_footer"{/if}>{$subcat->name}</a></li>
							{/if}
							{/foreach}
					</ul>
				{/if}	
					<ul class="footer-nav list-unstyled border-right">
						<li class="menu-header">Меню</li>
						{if $categories}
						{foreach $categories as $c}
							{* Показываем только видимые категории *}
							{if $c->visible}
								<li>
									<a {if $category->id == $c->id}class="selected_menu_footer"{/if} href="catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape}</a>
								</li>
							{/if}
						{/foreach}
						{/if}
					</ul>
					<ul class="footer-nav list-unstyled">
					{foreach $pages as $p}
					{* Выводим только страницы из первого меню *}
						{if $p->menu_id == 1}
						<li>
							<a href="{$p->url}"{if $page && $page->id == $p->id} class="selected_menu_footer"{/if}>{$p->name|escape}</a>
						</li>
						{/if}
					{/foreach}
					</ul>
				</div>
				<div class="col-md-6 col-xs-12">
					<div class="f-contacts">
						<div><a href="tel:+74862303010">30-30-10</a> (Северный / Железнодорожный / Советский р-н)</div>
						<div><a href="tel:+74862303020">30-30-20</a> (Заводской / Советский р-н)</div>
					</div>
					<div class="f-worktime">
						<p>Время работы:</p> 
						вс - чт с 10-00 до 22-00<br>
						пт - сб с 10-00 до 23-00<br>
						Без перерывов и выходных
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-7 col-xs-12">
					<span class="f-copyright">© Сушитория. 2016 г. Все права защищены.</span>
					<a href="https://vk.com/sushitoriya" class="f-social">Мы вконтакте <img src="design/{$settings->theme|escape}/images/top-social-vk.png" alt=""></a></li>
				</div>
				<div class="col-sm-4 col-xs-12 col-sm-offset-1">
					<div class="f-author">Создание сайта: <a href="#">студия «Соль»</a></div>
				</div>
			</div>
		</div>
	</footer>