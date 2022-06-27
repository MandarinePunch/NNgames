// 게임 상세 이미지 show
$(document).ready(function() {
	var current = 0;
	var thumbListSize = 6;
	var thumbnail = $('.detail__small-img');
	var thumb = thumbnail.find('.detail__small-thumb');
	var image = $('.detail__big-img p');

	/*  이미지 클릭시 발생 */
	thumb.click(function() {
		image.hide();
		var i = $(this).index();
		image.eq(i).show();
	});
});

// 장바구니에 값 넣기
function insertCart(gameNum){
	const payForm = document.getElementById("gamePaymentForm");
	
	payForm.action = "/cart/insert?game_num=" + gameNum;
	payForm.submit();
}

// pay 페이지로 가기
function goToPay(price, gameNum, discount){
	const payForm = document.getElementById("gamePaymentForm");
	
	payForm.action = "/payment/pay?game_price=" + price + "&game_num=" + gameNum + "&game_discount=" + discount;
	payForm.submit();
}

// 리뷰 삭제
function deleteReview(reviewNum, userNum, gameNum){
	location.href="/game/reviewDelete?review_num=" + reviewNum + "&user_num=" + userNum + "&game_num=" + gameNum;
}


