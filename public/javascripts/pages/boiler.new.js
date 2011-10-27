$(function() {
	$(".setting-add-link").click(function () {
		alert(111);
		div = $('#setting-prototype').clone().removeAttr('id');
		console.log(div);
		div.show().appendTo('#settings-area');
		return false;	
	});
	
});