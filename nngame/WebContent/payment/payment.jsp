<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/style.css" />
</head>
<body>
	<!-- header -->
	<%@ include file="/tags/header.jsp"%>
	
	<!-- payment 결제창 -->
	<main>
	<!-- 카드사 선택 -->
	<div class="container payment">
		<h1 class="payment__title">결제하기</h1>
		<div class="payment__big-box">
			<!-- 카드사 선택 -->
			<div class="payment__box">
				<div class="payment__input-box">
					<label class="payment__left-text" for="select_card">결제 수단</label>
					<select class="form-select" aria-label="Default select example"
						id="select_card" onblur="card_focusOut()">
						<option value="1" selected>카드사 선택</option>
						<option value="2">kakaopay</option>
						<option value="3">신한</option>
						<option value="4">농협</option>
						<option value="5">visa</option>
						<option value="6">무통장입금</option>
						<option value="7">toss</option>
					</select>
					<p id="select_pcard" class="pay_pred"></p>
				</div>

				<!-- 카드 선택지 설명 -->
				<div class="payment__input-box">
					<label for="cardNum" class="payment__left-text" id="card">카드 번호</label>
					<input type="text" class="form-control" id="cardNum"
						placeholder="xxxx-xxxx-xxxx-xxxx" onblur="card_focusOut()">
					<p id="pcardNum" class="pay_pred"></p>
				</div>
				<div class="payment__input-box">
					<label for="cardDate" class="payment__left-text" id="card">유효기간</label>
					<input type="text" class="form-control" id="cardDate"
						placeholder="유효기간 : xx/yy" onblur="card_focusOut()">
					<p id="pcardDate" class="pay_pred"></p>
				</div>
				<div class="payment__input-box">
					<label for="cardPw" class="payment__left-text" id="card">비밀번호</label> <input
						type="text" class="form-control" id="cardPw" placeholder="비밀번호" onblur="card_focusOut()">
					<p id="pcardPw" class="pay_pred"></p>
				</div>
			</div>

			<!-- 가격정보 -->
			<div class="payment__box">
				<h3 class="payment__right-total">가격 합계</h3>
				<div class="payment__right-text">
					<span>가격</span> <span>$</span>
				</div>
				<div class="payment__right-text">
					<span>할인금액</span> <span>$</span>
				</div>
				<div class="payment__right-text-sum">
					<span>총금액</span> <span>$</span>
				</div>
				<div class="payment__submit-box">
					<button type="submit" class="btn btn-secondary btn-sm submit-btn payment__submit-btn"
						onclick="javascript:checkCard()">결제하기</button>
				</div>

			</div>
		</div>
	</div>
	</main>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- payment validation 체크 js -->
	<script src="../js/payment/payment.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>