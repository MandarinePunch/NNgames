<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<c:set var="user" scope="session" value="${udto }" />
	<c:set var="cartlist" scope="request" value="${cartgamelist }" />
	<c:set var="totalPrice" value="0" />
	
	<main class="cart-container">
	<div class="cart-main">
		<c:choose>
				<c:when test="${empty cartlist }">
					<div class="cart-empty">				
						<h1>장바구니가 비어있어요!</h1>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<%-- 장바구니 리스트 출력 --%>
						<c:forEach var="cart" items="${cartlist }">		
							<div class="cart-box">
								<div class="cart-box__game">
									<div class="cart-box__image">
										<a href="/game/detail?game_num=${cart.game_num }">
											<img src="/img/games/${cart.imageDTO.image_banner }"
												class="img-fluid rounded-start">								
										</a>
									</div>
									<div class="cart-box__info">
										<div class="cart-box__text">
											<h5>${cart.gameDTO.game_name }</h5>
											<p>&#92; ${cart.gameDTO.game_price }</p>
										</div>
										<div class="cart-box__delete">
											<form action="/cart/delete" method="post" id="cartDeleteForm">								
												<button type="button" class="cart-box__del-button" onclick="cartDelete(${cart.cart_num})">
													삭제
												</button>
											</form>							
										</div>
									</div>
								</div>
							</div>
							<c:set var="totalPrice" value="${totalPrice + cart.gameDTO.game_price }" />
						</c:forEach>
					</div>
					
					<div class="cart-pay">
						<div class="cart-pay">
							<h2>게임 합계</h2>
							<div class="cart-pay__price">
								<h5>가격</h5>
								<h5>&#92; ${totalPrice }</h5>
							</div>
							<div class="cart-pay__price">
								<h5>할인 금액</h5>
								<h5>&#92; 0</h5>
							</div>
							<div class="cart-pay__price">
								<h5>소계</h5>
								<h5>&#92; ${totalPrice }</h5>
							</div>
						</div>
						<div class="d-grid gap-2">
							<%-- totalPrice를 pay에 넘겨줌 --%>
							<div>					
								<form action="/payment/pay?game_price=${totalPrice }" method="post" id="gamePaymentForm">						
									<button class="btn submit-btn cart-pay__btn" type="submit">구매하기</button>
								</form>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</main>


	<%@ include file="/tags/footer.jsp"%>
	
	<script>
		function cartDelete(cartnum){
			const form = document.getElementById("cartDeleteForm");
			
			form.action = "/cart/delete?cart_num=" + cartnum;
			form.submit();
		}
		
	</script>	
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>