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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<c:set var="totalCnt" scope="request" value="${totalCnt }"/>
	<c:set var="gamelist" scope="request" value="${gamelist }"/>
	<c:set var="sort" scope="request" value="${sort }"/>
	<c:set var="genre" scope="request" value="${genre }"/>
	
	
<%-- 	<c:set var="genrelist" scope="request" value="${genrelist }"/> --%>
	
	<!-- header -->
	<%@ include file="/tags/header.jsp"%>
	<!-- store 시작 -->
	<main>
		<!-- 카테고리 아이콘바 -->
		<section>
		   <ul class="nav justify-content-center">
		      <li class="store-nav store-icon-width <c:if test="${genre == 0}">store-active</c:if>">
		        <a id="store-all" class="nav-link" aria-current="page" href="/store/Storegamelist?genre=0">
		          <div class="store-icon-all"></div>
		          <p class="store-icon-p">전체</p> 
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 1}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=1">
		          <div class="store-icon-action"></div>
		          <p class="store-icon-p">액션</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 4}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=4">
		          <div class="store-icon-indi"></div>
		          <p class="store-icon-p">인디</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 5}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=5">
		          <div class="store-icon-rpg"></div>
		          <p class="store-icon-p">RPG</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 3}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=3">
		          <div class="store-icon-horror"></div>
		          <p class="store-icon-p">호러</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 6}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=6">
		          <div class="store-icon-sports"></div>
		          <p class="store-icon-p">스포츠</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 2}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=2">
		          <div class="store-icon-fps"></div>
		          <p class="store-icon-p">FPS</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width <c:if test="${genre == 7}">store-active</c:if>">
		        <a class="nav-link" href="/store/Storegamelist?genre=7">
		          <div class="store-icon-strategy"></div>
		          <p class="store-icon-p">전략</p>
		        </a>
		      </li>
		   </ul>
	    </section>
		<!-- 정렬하기 + 총개수  -->
	    <!-- 게임 썸네일 -->
	   	<%@ include file="/tags/store-search.jsp"%>
		
		
	</main>
	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>
	

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>