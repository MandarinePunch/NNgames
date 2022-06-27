<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<!-- header -->
	<%@ include file="/tags/header.jsp"%>
	
	<!-- payment 결제창 -->
	<c:set var="totalPrice" scope="request" value="${game_price }" />
	<c:set var="gameNum" scope="request" value="${game_num }" />
	<c:set var="discount" scope="request" value="${game_discount }" />
	
	<main>
	<!-- 카드사 선택 -->
	<form action="/payment/payOk.io" method="post" id="payForm">
		<%-- gamenum이 존재하면 게임상세에서 바로결제로 분류 --%>
		<c:if test="${not empty gameNum }">	
			<input type="hidden" value="${gameNum }" name="game_num" />
		</c:if>
		
		<div class="container payment">
			<h1 class="payment__title">결제하기</h1>
			<div class="payment__big-box">
				<!-- 카드사 선택 -->
				<div class="payment__box">
					<div class="payment__input-box">
						<label class="payment__left-text" for="select_card">결제 수단</label>
						<select class="form-select" aria-label="Default select example" name="pay_method"
							id="select_card" onblur="card_focusOut()">
							<option value="1" selected>카드사 선택</option>
							<option value="kakaopay">kakaopay</option>
							<option value="신한">신한</option>
							<option value="농협">농협</option>
							<option value="visa">visa</option>
							<option value="무통장입금">무통장입금</option>
							<option value="toss">toss</option>
						</select>
						<p id="select_pcard" class="pay_pred"></p>
					</div>
	
					<!-- 카드 선택지 설명 -->
					<div class="payment__input-box">
						<label for="cardNum" class="payment__left-text" id="card">카드 번호</label>
						<input type="text" class="form-control" id="cardNum"
							placeholder="xxxx-xxxx-xxxx-xxxx" onblur="card_focusOut()" maxlength="16" minlength="16">
						<p id="pcardNum" class="pay_pred"></p>
					</div>
					<div class="payment__input-box">
						<label for="cardDate" class="payment__left-text" id="card">유효기간</label>
						<input type="text" class="form-control" id="cardDate"
							placeholder="유효기간 : xx/yy" onblur="card_focusOut()">
						<p id="pcardDate" class="pay_pred"></p>
					</div>
					<div class="payment__input-box">
						<label for="cardPw" class="payment__left-text" id="card">비밀번호</label>
						<input type="password" class="form-control" id="cardPw" placeholder="비밀번호" onblur="card_focusOut()" maxlength="4" minlength="4">
						<p id="pcardPw" class="pay_pred"></p>
					</div>
				</div>
	
				<!-- 가격정보 -->
				<div class="payment__box">
					<h3 class="payment__right-total">가격 합계</h3>
					<div class="payment__right-text">
						<span>가격</span> <span>${totalPrice }원</span>
					</div>
					<div class="payment__right-text">					
						<span>할인금액</span>
						<c:choose>
							<c:when test="${empty discount }">
								<span>0원</span>
							</c:when>
							<c:otherwise>
								<span>${discount }원</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="payment__right-text-sum">
						<span>총금액</span> <span>${totalPrice - discount }원</span>
					</div>
					<div class="payment__submit-box">
						<button type="submit" class="btn btn-secondary btn-sm submit-btn payment__submit-btn">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	</main>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- payment validation 체크 js -->
	<script src="/js/payment/payment.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>