$(document).ready(function() {
	var current = 0;
	var thumbListSize = 6;
	var thumbnail = $('.detail__small-img');
	//var prev = thumbnail.find('.left');
	//var next = thumbnail.find('.right');
	//var container = thumbnail.find('ul');
	//var containerWidth = thumbnail.find('.container').width();
	var thumb = thumbnail.find('.detail__small-thumb');
	//var maxSize = thumb.size();
	var image = $('.detail__big-img p');

	/*  이미지 클릭시 발생 */
	thumb.click(function() {
		image.hide();
		var i = $(this).index();
		image.eq(i).show();
	});

	/* 슬라이드 추가시 주석처리 해제  */
	// 				/* 다음키 클릭시 발생  */
	// 				next.click(function(){
	// 					if (current < maxSize / thumbListSize - 1) {
	// 						current++;
	// 					} else {
	// 						current = 0;
	// 					}
	// 					listMove();
	// 				});
	// 				/* 이전키 클릭시 발생  */
	// 				prev.click(function(){
	// 					if (current > 0) {
	// 						current--;
	// 					} else {
	// 						current = maxSize / thumbListSize -1;
	// 					}
	// 					listMove();
	// 				});
	// 				function listMove(){
	// 					var tl = containerWidth * current * -1;
	// 					container.stop().animate({left:tl}, 400);
	// 				}
});

function insertCart(gameNum){
	const payForm = document.getElementById("gamePaymentForm");
	
	payForm.action = "/cart/insert?game_num=" + gameNum;
	payForm.submit();
}

function goToPay(price, gameNum){
	const payForm = document.getElementById("gamePaymentForm");
	
	payForm.action = "/payment/pay?game_price=" + price + "&game_num=" + gameNum;
	payForm.submit();
}