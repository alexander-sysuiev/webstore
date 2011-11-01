// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
	$(".buy-button").live("click", function() {
		var id = $(this).attr('data-product-id');
		var type = $(this).attr('data-product-type');
		$.post('/cart.js', {id: id, type: type});

		return false;
	});

	$(".quantity-decrease").live("click", function() {
		var id = $(this).attr('data-product-id');
		var type = $(this).attr('data-product-type');
		$.post('/cart/decrease.js', {id: id, type: type});

		return false;
	});

	$(".clear-cart").live("click", function() {
		$.post('/cart/clear.js');

		return false;
	});
});