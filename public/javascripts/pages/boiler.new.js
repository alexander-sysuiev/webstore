$(function() {
	var removeSetting = function() {
		$(this).parent().remove();
		return false;
	};

	$(".setting-add-link").click(function () {
		div = $('#setting-prototype').clone().removeAttr('id').show();
		div.find('.remove-setting').click(removeSetting);
		div.appendTo('#settings-area');

		return false;	
	});

	$(".remove-setting").click(removeSetting);
	
	
});