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
			forma.closest('.price-item').find('.price-img img').effect("transfer", { to: $(".h-btn"), className: "transfer_class" }, distance);	
			$('.transfer_class').html(forma.closest('.price-item').find('.price-img').html());
			$('.transfer_class').find('img').css('height', '100%');
		}
	});

	return false;
});

	$('body').on('submit', 'form.removeFromCart', function(e) {
		e.preventDefault();
		var form = $(this),
			button = $(this).find('input[type="submit"]');
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
