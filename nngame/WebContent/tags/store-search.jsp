<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- 이 페이지에서 JSTL을 사용하겠다는 태그라이브러리 선언문 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><!-- jstl function쓸떄 선언문 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NNgame</title>
</head>
<body>
	
	<!-- 정렬하기 + 총개수  -->
	<section class="store-range">
		<ul class="nav nav-pills">
			<li class="store-nav">
				<p class="store-nav-p">정렬기준</p>
			</li>
			<li class="store-nav dropdown">
				<form id="store-form" method="post" >
					<select name="store-sort" class="form-select store-form-select" aria-label="Default select example">
						<option value="ABC" <c:if test="${sort == 'ABC'}">selected="selected"</c:if>>사전순</option>
						<option value="DESC" <c:if test="${sort == 'DESC'}">selected="selected"</c:if>>가격: 오름차순</option>
						<option value="ASC" <c:if test="${sort == 'ASC'}">selected="selected"</c:if>>가격: 내림차순</option>
					</select>
					<input class="store-nav store-form-input" type="submit" value="보기">
				</form>
			</li>
		</ul>
		<div class="store-nav">
			<p class="store-nav-p">
				총 개수 <span>${totalCnt }</span>개
			</p>
		</div>
	</section>
	
	<!-- 게임 썸네일 -->
	<c:choose>
		<%--모든게임 가져오기 --%>
		<c:when test="${gamelist != null and fn:length(gamelist) > 0 }">
			<div class="row row-cols-1 row-cols-md-6 g-4 store-row">
				<c:forEach var="list" items="${gamelist }">
					<div class="col">
						<a class="card h-100 store-card" href="/game/detail?game_num=${list.gameDTO.game_num }"> 
							<img src="/img/games/${list.imageDTO.image_main }" class="card-img-top" alt="...">
							<div class="card-body store-card-body">
								<h5 class="card-title">${list.gameDTO.game_name } </h5>
								<c:choose>
									<c:when test="${list.gameDTO.game_price == 0 }">
										<p class="card-text">무료</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">&#xFFE6; ${list.gameDTO.game_price }</p>
									</c:otherwise>
								</c:choose>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</c:when>
		
		<%--게임없을때 --%>
		<c:otherwise>
			<div id="store-div-non">
				<h3 class="store-div-h3">찾으시는 게임 목록이 없습니다.</h3>
			</div>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>