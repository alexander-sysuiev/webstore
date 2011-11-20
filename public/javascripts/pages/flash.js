$(function () {
	console.log($(".flash"));
	$(".flash").effect("pulsate", {times: 1}, 1000);
	$(".flash").effect("fade", {}, 5000);
	// $(".flash").effect('appear');
});