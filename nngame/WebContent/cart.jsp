<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<%@ include file="/tags/header.jsp"%>

	<div class="cart_mycart">
		<h2>나의 장바구니</h2>
	</div>

	<!-- main -->
	<main class="cart-container">
	<div class="cart-main">
		<div>
			<div class="cart-box">
				<input type="checkbox" />
				<div class="cart-box__game">
					<div class="cart-box__image">
						<img src="./img/games/strategy/starcraft/strategy-banner-starcraft.jpg"
							class="img-fluid rounded-start">
					</div>
					<div class="cart-box__info">
						<div class="cart-box__text">
							<h5>스타크래프트 : 리마스터</h5>
							<p>&#92; 16,500</p>
						</div>
						<div class="cart-box__delete">
							<button type="button" class="cart-box__del-button">삭제</button>
						</div>
					</div>
				</div>
			</div>
			<div class="cart-box">
				<input type="checkbox" />
				<div class="cart-box__game">
					<div class="cart-box__image">
						<img src="./img/games/strategy/totalwar/strategy-banner-totalwar.jpg"
							class="img-fluid rounded-start">
					</div>
					<div class="cart-box__info">
						<div class="cart-box__text">
							<h5>토탈 워 : 삼국</h5>
							<p>&#92; 41,000</p>
						</div>
						<div class="cart-box__delete">
							<button type="button" class="cart-box__del-button">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cart-pay">
			<div class="cart-pay">
				<h2>게임 합계</h2>
				<div class="cart-pay__price">
					<h5>가격</h5>
					<h5>&#92; 57,500</h5>
				</div>
				<div class="cart-pay__price">
					<h5>할인 금액</h5>
					<h5>&#92; -17,500</h5>
				</div>
				<div class="cart-pay__price">
					<h5>소계</h5>
					<h5>&#92; 40,000</h5>
				</div>
			</div>
			<div class="d-grid gap-2">
				<button class="btn submit-btn" type="button" onclick="location.href='/payment/payment.jsp'">구매하기</button>
			</div>
		</div>
	</div>
	</main>


	<%@ include file="/tags/footer.jsp"%>
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>