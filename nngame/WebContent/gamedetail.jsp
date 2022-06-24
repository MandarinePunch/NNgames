<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게임 상세페이지.</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet" href="./css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@ include file="/tags/header.jsp"%>
	<!-- main -->
	<div class="container detail">
		<h1 class="detail__title">TEKKEN 7</h1>
		<div class="detail__main">
			<!-- 슬라이드 이미지 구현구역  -->
			<div class="detail__main-img">
				<!--대형 인게임 이미지 출력위치  -->
				<div class="detail__big-img">
					<p>
						<img src="./img/games/action/tekken/action-screen-tekken1.jpg">
					</p>
					<p style="display: none;">
						<img src="./img/games/action/tekken/action-screen-tekken2.jpg">
					</p>
					<p style="display: none;">
						<img src="./img/games/action/tekken/action-screen-tekken3.jpg">
					</p>
					<p style="display: none;">
						<img src="./img/games/action/tekken/action-screen-tekken4.jpg">
					</p>
				</div>

				<!-- 미니이미지 출력위치  -->
				<div class="detail__small-img">
					<div class="detail__small-thumb">
						<img src="./img/games/action/tekken/action-screen-tekken1.jpg">
					</div>
					<div class="detail__small-thumb">
						<img src="./img/games/action/tekken/action-screen-tekken2.jpg">
					</div>
					<div class="detail__small-thumb">
						<img src="./img/games/action/tekken/action-screen-tekken3.jpg">
					</div>
					<div class="detail__small-thumb">
						<img src="./img/games/action/tekken/action-screen-tekken4.jpg">
					</div>
				</div>
			</div>

			<!-- 게임 배너 메뉴바  -->
			<div class="d-grid detail__info-box">
				<div>
					<img src="./img/games/action/tekken/action-banner-tekken.jpg">
				</div>
				<h5>가격 : \40000</h5>
				<div class="detail__btn-box">
					<button class="btn submit-btn detail__btn" onclick="location.href='/payment/payment.jsp'">바로 구매</button>
				</div>
				<div class="detail__btn-box">
					<button class="btn submit-btn detail__btn">장바구니에 담기</button>
				</div>
				<div class="detail__info-text">장르 : 액션</div>
				<div class="detail__info-text">연령 : 15세</div>
				<div class="detail__info-text">개발사 : CAPCOM</div>
				<div class="detail__info-text">출시일 : 2017-06-02</div>
			</div>
		</div>

		<!-- 게임 상세설명   -->
		<div class="detail__description">
			<h1>[게임 상세 설명]</h1>
			<div class="detail__description-title">게임에 대해</div>
			<div class="detail__description-info">
				미시마 일가의 길고 긴 전설적인 싸움의 끝과, 이 잔혹한 싸움에 감춰져있는 비밀이 밝혀집니다. Unreal
				Engine 4로 개발되어, 유명 격투 게임 철권이 더욱 충실한 스토리와 영화같은 연출, 그리고 긴장감 넘치는 배틀로
				친구나 다른 게이머들과 즐길 수 있는 게임으로 돌아옵니다. 사랑, 복수, 긍지. 모든 사람은 싸워야할 이유를 가지고 있다.
				가치관은 강하거나 약하거나 상관없이 우리를 정의하고, 사람으로서 살아가도록 만든다. 이 동기에 선악은 없으며 우리가 어떠한
				행동을 취하느냐가 있을 뿐이다.
			</div>
			<div class="detail__description-title">요구사양</div>
			<div class="detail__description-info">
				최소: 64비트 프로세서와 운영 체제가 필요합니다<br>
				운영체제: Windows 7/8/10 (64-bit OS required)<br>
				프로세서: Intel Core i3-4160 @ 3.60GHz or equivalent<br>
				메모리: 6GB RAM<br>
				그래픽: NVIDIA GeForce GTX 660 2GB, GTX 750Ti 2GB, or equivalent<br>
				DirectX: 버전 11<br>
				네트워크: 초고속 인터넷 연결<br>
				저장공간: 60 GB<br>
				사용 가능 공간 사운드카드: DirectX compatible soundcard or onboard chipset
			</div>
		</div>
	</div>

	<%@ include file="/tags/footer.jsp"%>

	<script>
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
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>