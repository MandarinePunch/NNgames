<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Project CSS -->
<link rel="stylesheet" href="/css/style.css" />

<title>라이브러리</title>
</head>

<body>
	<!-- header-->
	<%@ include file="/tags/header.jsp"%>

	<!-- section -->
	<c:set var="user" scope="session" value="${udto }"/>
	<c:set var="totalCnt" scope="request" value="${totalCnt }"/>
	<c:set var="libraryList" scope="request" value="${libraryList }"/>
	
	<div class="container lib">
		<!-- 검색 바 -->
		<section class="search-area">
			<nav class="navbar navbar-light">
				<div class="container-fluid">
					<form class="d-flex search-sb-100">
						<input class="form-control me-2 search-input" type="search"
							placeholder="검색어를 입력하세요" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</nav>
		</section>
		<!-- 리스트 메뉴바 -->
		<div class="lib__list">
			<div class="lib__game-info">
				<!-- 이미지 -->
				<div class="lib__game-img-box">총 ${totalCnt }개</div>
				<!-- 게임명 -->
				<div class="lib__game-name">
					<span class="lib__list-font">게임명</span>
				</div>
				<!-- 플레이타임 -->
				<div class="lib__playtime lib__list-font">
					<span class="lib__list-font">플레이타임</span>
				</div>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${empty libraryList }">
				<div class="lib-empty">
					<h3>구매한 게임이 없습니다</h3>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 플레이 리스트 -->
				<c:forEach var="libraryList" items="${libraryList }">
					<div class="lib__game">
						<div class="lib__game-info">
							<!-- 이미지 -->
							<div class="lib__game-img-box">
								<img src="/img/games/${libraryList.imageDTO.image_banner }" class="lib__game-img">
							</div>
							<!-- 게임명 -->
							<div class="lib__game-name">
								<span class="lib__game-font">${libraryList.gameDTO.game_name }</span>
							</div>
							<!-- 플레이타임 -->
							<div class="lib__playtime">
								<span class="lib__game-font">${libraryList.lib_playtime }</span>
							</div>
						</div>
						<!-- 실행 버튼 -->
						<div class="lib__play-btn-box">
							<button type="button" class="btn submit-btn lib__play-btn">실행</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- Bootstrap 옵션 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>