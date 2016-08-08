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
});
