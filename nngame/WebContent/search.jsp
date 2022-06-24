<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>NNgame</title>
<link rel="stylesheet" href="/css/style.css" />
<!-- <link rel="stylesheet" href="css/store.css"> -->
</head>
<body>
	<!-- header -->
	<%@ include file="./tags/header.jsp"%>
	<!-- store 시작 -->
	<main>
		<!-- 검색바 -->
		<section class="search-area">
			<nav class="navbar navbar-light">
			  <div class="container-fluid">
			    <form class="d-flex search-sb-100">
			      <input class="form-control me-2 search-input" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
			      <button class="btn btn-outline-success" type="submit">Search</button>
			    </form>
			  </div>
			</nav>
		</section>	
		
		<!-- 정렬하기 + 총개수  -->
		<!-- 게임 썸네일 -->
<%-- 		<%@ include file="./tags/store-search.jsp"%> --%>

		<!-- 정렬하기 + 총개수  -->
		<section class="store-range">
			<ul class="nav nav-pills">
				<li class="store-nav">
					<p class="store-nav-p">정렬기준</p>
				</li>
				<li class="store-nav dropdown"><select
					class="form-select store-form-select"
					aria-label="Default select example">
						<option selected>사전순</option>
						<option value="1">인기순</option>
						<option value="2">추천순</option>
						<option value="3">가격: 오름차순</option>
						<option value="4">가격: 내림차순</option>
				</select></li>
			</ul>
			<div class="store-nav">
				<p class="store-nav-p">
					총 개수 <span>2</span>개
				</p>
			</div>
		</section>
		<!-- 게임 썸네일 -->
		<div class="row row-cols-1 row-cols-md-6 g-4 store-row">
			<div class="col">
				<a class="card h-100 store-card" href="/gamedetail.jsp"> 
					<img src="/img/games/indi/sims/indi-thumbnail-sims.jpg" class="card-img-top" alt="...">
					<div class="card-body store-card-body">
						<h5 class="card-title"></h5>
						<p class="card-text"></p>
					</div>
				</a>
			</div>
		</div>
		
	</main>
	<!-- footer -->
	<%@ include file="./tags/footer.jsp"%>


    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>