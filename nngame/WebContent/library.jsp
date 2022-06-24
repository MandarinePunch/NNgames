<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./css/style.css" />

<title>라이브러리</title>
</head>

<body>
	<!-- header-->
	<%@ include file="./tags/header.jsp"%>

	<!-- section -->
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
				<div class="lib__game-img-box"></div>
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

		<!-- 플레이 리스트1 -->
		<div class="lib__game">
			<div class="lib__game-info">
				<!-- 이미지 -->
				<div class="lib__game-img-box">
					<img src="/img/games/sports/fifa/sports-banner-fifa.jpg"
						class="lib__game-img">
				</div>
				<!-- 게임명 -->
				<div class="lib__game-name">
					<span class="lib__game-font">FIFA : 남자는 동그란 것에 환장하지</span>
				</div>
				<!-- 플레이타임 -->
				<div class="lib__playtime">
					<span class="lib__game-font">00 : 30</span>
				</div>
			</div>
			<!-- 실행 버튼 -->
			<div class="lib__play-btn-box">
				<button type="button" class="btn submit-btn lib__play-btn">실행</button>
			</div>
		</div>
		<div class="lib__game">
			<div class="lib__game-info">
				<!-- 이미지 -->
				<div class="lib__game-img-box">
					<img src="/img/games/rpg/finalfantasy/rpg-banner-finalfantasy.jpg"
						class="lib__game-img">
				</div>
				<!-- 게임명 -->
				<div class="lib__game-name">
					<span class="lib__game-font">FINAL FANTASY VII REMAKE INTERGRADE</span>
				</div>
				<!-- 플레이타임 -->
				<div class="lib__playtime">
					<span class="lib__game-font">-</span>
				</div>
			</div>
			<!-- 실행 버튼 -->
			<div class="lib__play-btn-box">
				<button type="button" class="btn submit-btn lib__play-btn">실행</button>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="./tags/footer.jsp"%>

	<!-- Bootstrap 옵션 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>