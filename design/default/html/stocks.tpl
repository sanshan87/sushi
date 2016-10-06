{$meta_title = "Акции" scope=parent}
{$wrapper = 'wrapper_for_products.tpl' scope=parent}
<!-- Хлебные крошки /-->
	<div class="breadcrumb-block">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="/">Главная</a></li>
				<li>Акции</li>			
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
						<h1>{$page->name|escape}</h1>
						<a href="#" class="link-back"><span class="glyphicon glyphicon-menu-left"></span>Назад</a>
					</div>
					{foreach $stocks as $stock}
						<div class="sale-item" id="{$stock@key}">
							<div class="item-susi-bg"></div>
							<div class="row">
								<div class="col-sm-4">
									<div class="img-block"><img src="{$stock->filename|resize:225:120}" alt="{$stock->name}" class="img-responsive item-img"></div>
								</div>
								<div class="col-sm-8">
									<div class="item-info-block">
										<div class="item-header">
											<h4>{$stock->name}</h4>
											{if $stock->short_annotation}
												<span class="add-info">{$stock->short_annotation}</span>
											{/if}
										</div>
										<div class="item-text">{$stock->annotation}</div>
										<div class="item-time"><span class="clock-icon"></span><span>Акция проводится {$stock->start|date_format:"%H:%M"} до {$stock->end|date_format:"%H:%M"}</span></div>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="text-content">
		<div class="container">
			{* <h1 class="text-center">Суши и роллы в Орле</h1> *}
			<div class="row">
				<div class="col-xs-12">
					<img src="design/{$settings->theme|escape}/images/ierogliph-text.png" alt="Иероглиф" class="ierogliph pull-left">
					Мы стремимся стать полезнее, выгоднее и удобнее для всех наших клиентов, поэтому каждый день с 13.00 до 17.00 у нас действуют акции! При заказе на сумму от 800 р.  (без учета сетов и напитков) вы получаете дополнительный ролл в подарок! Это отличная возможность сэкономить, получить приятный сюрприз и попробовать что-нибудь новенькое и аппетитное из нашего меню! Информацию об актуальных акциях можно уточнить у менеджеров по телефону и в нашей группе Вконтакте.
				</div>
			</div>
		</div>
	</div>