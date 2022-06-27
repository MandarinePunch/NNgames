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
	<c:set var="sort" scope="request" value="${sort }"/>

	<!-- header -->
	<%@ include file="/tags/header.jsp"%>
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
		<%@ include file="/tags/store-search.jsp"%>

		
		
	</main>
	
	
	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>
	
	<!-- 검색어 validation 체크 -->
	<script src="/js/search/search.js"></script>


    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>