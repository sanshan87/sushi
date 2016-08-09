$(document).ready(function() {
	$('#navbar-form .btn-search').click(function(e) {
		var btn = $(this),
			form = btn.closest('form');

		if(!form.hasClass('open')) {
			form.addClass('open');
			form.find('input').focus();
			e.preventDefault();
		}
	});

	$(".slider-header .owl-carousel").owlCarousel({
		items: 1,
		loop: true,
		mouseDrag: false,
		dots: true
	});

	$(".stock-slider .owl-carousel").owlCarousel({
		items: 2,
		loop: true,
		margin: 30,
		mouseDrag: false,
		nav: true,
		navText: [],
		responsive: {
			0: {
				items: 1
			},
			768: {
				items: 2
			}
		}
	});

	$(".popular-price-slider .owl-carousel").owlCarousel({
		items: 4,
		loop: true,
		margin: 30,
		mouseDrag: false,
		nav: true,
		navText: [],
		navContainer: "#popular-price-slider-nav",
		responsive: {
			0: {
				items: 1
			},
			768: {
				items: 2
			},
			991: {
				items: 3
			},
			1200: {
				items: 4
			}
		}
	});

	$(".new-price-slider .owl-carousel").owlCarousel({
		items: 4,
		loop: true,
		margin: 30,
		mouseDrag: false,
		nav: true,
		navText: [],
		navContainer: "#new-price-slider-nav",
		responsive: {
			0: {
				items: 1
			},
			768: {
				items: 2
			},
			991: {
				items: 3
			},
			1200: {
				items: 4
			}
		}
	});

	$('.side-basket').on('open.basket', function(e) {
		$('body').toggleClass('side-basket-open');
		$('.side-basket').toggleClass('open');
		$('.basket-shadow').toggleClass('hidden');
	});

	$('body').on('click', '.sb-btn, .basket-shadow, .basket-close',function(e) {
		e.preventDefault();
		$('.side-basket').trigger('open.basket');
	});

	var touchStart = 0,
		touchEnd = 0,
		deltaTouch = 0;

	$('.side-basket, .basket-shadow').on('touchstart', function(e) {
		touchStart = e.originalEvent.touches[0].pageX;
	});
	$('.side-basket, .basket-shadow').on('touchmove', function(e) {
		touchEnd = e.originalEvent.touches[0].pageX;
	});
	$('.side-basket, .basket-shadow').on('touchend', function() {
		deltaTouch = touchEnd - touchStart;
		if(deltaTouch > 100) {
			$('.side-basket').trigger('open.basket');
			touchStart = 0;
			touchEnd = 0;
			deltaTouch = 0;
		}
	});
});