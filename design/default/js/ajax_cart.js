// Аяксовая корзина
$(document).ready(function() {
$('form.variants').on('submit', function(e) {
	e.preventDefault();
	var forma = $(this);
	button = $(this).find('input[type="submit"]');
	if($(this).find('input[name=variant]:checked').size()>0)
		variant = $(this).find('input[name=variant]:checked').val();
	if($(this).find('select[name=variant]').size()>0)
		variant = $(this).find('select').val();
	$.ajax({
		url: "ajax/cart.php",
		data: {variant: variant},
		dataType: 'json',
		success: function(data){
			$('#cart_informer').html(data.cart);
			$('#cnt_in_cart').text(data.count);
			$('#txt_cnt').html(data.text);
			var o1 = forma.offset();
			var o2 = $('.h-btn').offset();
			var dx = o1.left - o2.left;
			var dy = o1.top - o2.top;
			var distance = Math.sqrt(dx * dx + dy * dy);
			if(!forma.data('page')){
				forma.closest('.price-item').find('.price-img img').effect("transfer", { to: $(".h-btn"), className: "transfer_class" }, distance);	
				$('.transfer_class').html(forma.closest('.price-item').find('.price-img').html());
			}else{
				forma.closest('.price-info').find('.price-item img').effect("transfer", { to: $(".h-btn"), className: "transfer_class" }, distance);	
				$('.transfer_class').html(forma.closest('.price-info').find('.price-item img').prop('outerHTML'));	
			}
			$('.transfer_class').find('img').css('height', '100%');
		}
	});

	return false;
});

	$('body').on('submit', 'form.removeFromCart', function(e) {
		console.log($(e.target));
		e.preventDefault();
		var form = $(this),
			button = $(this).find('input[type="submit"]');
			buttonMainCart = $(this).find('button[type="submit"]');
		if($(this).find('input[name="variant_id"]').size()) 
			var variant_id = $(this).find('input[name="variant_id"]').val();

		$.ajax({
			url: "ajax/cart.php",
			data: {
				action: "removeFromCart",
				variant_id: variant_id
			},
			dataType: 'json',
			success: function(data){
				$('#cart_informer').html(data.cart);
				$('#cnt_in_cart').text(data.count);
				$('#txt_cnt').html(data.text);
				if(document.location.pathname.indexOf('/cart')>-1){
				if(buttonMainCart)
					buttonMainCart.closest('div.basket-row').remove();
				if(parseInt(data.totalPrice)){
					$('.basket-total-cost').html(data.totalPrice + ' р.');
					if(data.totalPrice>=400){
						$('#free').html('(бесплатно)');
					}else{
						$('#free').html('(120 р.)');
					}
				}else{
					$('.basket-container').remove();
					$('.basket-result').remove();
					$('.page-header-block h1').text('Корзина пуста');
				}
				}
			}
		});
	});

	$('body').on('change', 'input[name="item_amount"]', function() {
		var max = 99,
			min = 1,
			inp = $(this),
			amount = parseInt(inp.val()),
			form = $(this).closest('.b-item').find('form');

		if(form.find('input[name="variant_id"]').size()) 
			var variant_id = form.find('input[name="variant_id"]').val();

		if(amount < min) amount = min;
		if(amount > max) amount = max;

		$.ajax({
			url: "ajax/cart.php",
			data: {
				action: "updateAmount",
				variant_id: variant_id,
				amount: amount
			},
			dataType: 'json',
			success: function(data){
				$('#cart_informer').html(data.cart);
				$('#cnt_in_cart').text(data.count);
				$('#txt_cnt').html(data.text);
			}
		});
	});
});
