<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="gamedetail" scope="request" value="${gameDetail }" />
<c:set var="success" scope="request" value="${success }" />

<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NNgame - ${gamedetail.gameDTO.game_name }</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<%@ include file="/tags/header.jsp"%>
	
	<!-- main -->

	<c:choose>
		<c:when test="${success == true }">
			<script>
				alert("장바구니에 추가되었습니다.");
			</script>
		</c:when>
		<c:when test="${success == false }">
			<script>
				alert("이미 있는 게임입니다.");
			</script>
		</c:when>
	</c:choose>
	
	<div class="container detail">
		<h1 class="detail__title">${gamedetail.gameDTO.game_name }</h1>
		<div class="detail__main">
			<!-- 슬라이드 이미지 구현구역  -->
			<div class="detail__main-img">
				<!--대형 인게임 이미지 출력위치  -->
				<div class="detail__big-img">
					<p>
						<img src="/img/games/${gamedetail.imageDTO.image_screen1 }">
					</p>
					<p style="display: none;">
						<img src="/img/games/${gamedetail.imageDTO.image_screen2 }">
					</p>
					<p style="display: none;">
						<img src="/img/games/${gamedetail.imageDTO.image_screen3 }">
					</p>
					<p style="display: none;">
						<img src="/img/games/${gamedetail.imageDTO.image_screen4 }">
					</p>
				</div>

				<!-- 미니이미지 출력위치  -->
				<div class="detail__small-img">
					<div class="detail__small-thumb">
						<img src="/img/games/${gamedetail.imageDTO.image_screen1 }">
					</div>
					<div class="detail__small-thumb">
						<img src="/img/games/${gamedetail.imageDTO.image_screen2 }">
					</div>
					<div class="detail__small-thumb">
						<img src="/img/games/${gamedetail.imageDTO.image_screen3 }">
					</div>
					<div class="detail__small-thumb">
						<img src="/img/games/${gamedetail.imageDTO.image_screen4 }">
					</div>
				</div>
			</div>

			<!-- 게임 배너 메뉴바  -->
			<div class="d-grid detail__info-box">
				<div class="detail__banner">
					<img src="/img/games/${gamedetail.imageDTO.image_banner }">
				</div>
				<c:choose>
					<c:when test="${gamedetail.gameDTO.game_price == 0 }">
						<h5>가격 : 무료</h5>
					</c:when>
					<c:otherwise>
						<h5>가격 : ${gamedetail.gameDTO.game_price }원</h5>
					</c:otherwise>
				</c:choose>
				<form action="/cart/insert" method="post" id="gamePaymentForm">
					<div class="detail__btn-box">
						<button type="button" class="btn submit-btn detail__btn" onclick="goToPay(${gamedetail.gameDTO.game_price}, ${gamedetail.gameDTO.game_num })">바로 구매</button>
					</div>
					<div class="detail__btn-box">
						<button type="button" class="btn submit-btn detail__btn" onclick="insertCart(${gamedetail.gameDTO.game_num})">장바구니에 담기</button>
					</div>	
				</form>
				<div class="detail__info-text">장르 : ${gamedetail.cateDTO.cate_genre }</div>
				<div class="detail__info-text">연령 : ${gamedetail.gameDTO.game_agelimit }세</div>
				<div class="detail__info-text">개발사 : ${gamedetail.gameDTO.game_developer }</div>
				<div class="detail__info-text">출시일 : ${fn:substring(gamedetail.gameDTO.game_release, 0, 10) }</div>
			</div>
		</div>

		<!-- 게임 상세설명   -->
		<div class="detail__description">
			<div class="detail__description-title">게임에 대해</div>
			<div class="detail__description-info">
				${gamedetail.gameDTO.game_detail }
			</div>
			<div class="detail__description-title">요구사양</div>
			<div class="detail__description-info">
				${gamedetail.gameDTO.game_require }
			</div>
		</div>
		<h1 class="detail__review-title">Review</h1>
		<form class="d-flex">
	        <input class="me-2 detail__review-input" type="search" placeholder="Search" aria-label="Search">
	    	<button class="btn submit-btn" type="submit">Comment</button>
	    </form>
	    <section>
	    	<table class="detail__review-table">
	    		<tr height="40px">
	    			<td width="10%" style="font-weight: bold">Mandarine</td>
	    			<td width="10%" style="color:rgba(255,255,255,0.5)">2020-10-10</td>
	    			<td width="80%" align="right" class="detail__review-delete">
						<a>[수정]</a>&nbsp;&nbsp;
						<a>[삭제]</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan="2">어떤 내용을 원하시나요</td>
	    		</tr>
	    	</table>
	    	<table class="detail__review-table">
	    		<tr height="40px" valign="middle">
	    			<td width="10%" class="detail__review-name">Mandarine</td>
	    			<td width="10%" class="detail__review-date">2020-10-10</td>
	    			<td width="80%" align="right" class="detail__review-delete">
						<a>[수정]</a>&nbsp;&nbsp;
						<a>[삭제]</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan="2">어떤 내용을 원하시나요</td>
	    		</tr>
	    	</table>
	    </section>
	</div>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- gamedetail js -->
	<script src="/js/gamedetail/gamedetail.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/516437ec88.js" crossorigin="anonymous"></script>
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>