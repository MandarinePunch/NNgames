<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<c:set var="totalCnt" scope="request" value="${totalCnt }"/>
	<c:set var="gamelist" scope="request" value="${gamelist }" />
	<c:set var="keyword" scope="request" value="${keyword }" />

	<!-- header -->
	<%@ include file="./tags/header.jsp"%>
	<!-- store 시작 -->
	<main>
		<!-- 검색바 -->
		<section class="search-area">
			<nav class="navbar navbar-light">
			  <div class="container-fluid">
			    <form action="/search/Searchgamelist" class="d-flex search-sb-100" name="searchFormSearch" onsubmit="checkForm(); return false;">
			      <input class="form-control me-2 search-input" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="searchTerm" value="${keyword }">
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
				<li class="store-nav dropdown">
					<form id="store-form" method="post">
						<select name="store-sort" class="form-select store-form-select" aria-label="Default select example">
							<option value="ABC">사전순</option>
							<option value="DESC">가격: 오름차순</option>
							<option value="ASC">가격: 내림차순</option>
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
							<a class="card h-100 store-card" href="/gamedetail.jsp"> 
								<img src="/img/games/${list.imageDTO.image_main }" class="card-img-top" alt="...">
								<div class="card-body store-card-body">
									<h5 class="card-title">${list.gameDTO.game_name } </h5>
									<p class="card-text">&#xFFE6; ${list.gameDTO.game_price }</p>
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
		
	</main>
	<!-- footer -->
	<%@ include file="./tags/footer.jsp"%>

	<script type="text/javascript">
		// 검색어입력체크
		function checkForm(){
			let frmSc = document.searchFormSearch;
			
			// search페이지 검색어입력체크
			if( !frmSc.searchTerm.value ){
				alert('검색어를 입력해 주세요');
			    frmSc.searchTerm.focus();
			    return false;
			}
			
			frmSc.submit();		
			
		}
	</script>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>