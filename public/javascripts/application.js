// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var ids = 1;
$(function() {
	
	$(".buy-button").click(function() {
		var id = $(this).attr('data-product-id');
		var type = $(this).attr('data-product-type');
		$.post('/basket.js', {id: id, type: type});

		return false;
	});
});