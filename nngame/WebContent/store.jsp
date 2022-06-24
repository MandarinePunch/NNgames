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
	<c:set var="storegamelist" scope="request" value="${storegamelist }"/>
	<c:set var="genrelist" scope="request" value="${genrelist }"/>
	<!-- header -->
	<%@ include file="/tags/header.jsp"%>
	<!-- store 시작 -->
	<main>
		<!-- 카테고리 아이콘바 -->
		<section>
		   <ul class="nav justify-content-center">
		      <li class="store-nav store-icon-width">
		        <a id="store-all" class="nav-link" aria-current="page" href="/store/Storegamelist">
		          <div class="store-icon-all"></div>
		          <p class="store-icon-p">전체</p> 
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=1">
		          <div class="store-icon-action"></div>
		          <p class="store-icon-p">액션</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=4">
		          <div class="store-icon-indi"></div>
		          <p class="store-icon-p">인디</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=5">
		          <div class="store-icon-rpg"></div>
		          <p class="store-icon-p">RPG</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=3">
		          <div class="store-icon-horror"></div>
		          <p class="store-icon-p">호러</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=6">
		          <div class="store-icon-sports"></div>
		          <p class="store-icon-p">스포츠</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=2">
		          <div class="store-icon-fps"></div>
		          <p class="store-icon-p">FPS</p>
		        </a>
		      </li>
		      <li class="store-nav store-icon-width">
		        <a class="nav-link" href="/store/Storegenrelist?genre=7">
		          <div class="store-icon-strategy"></div>
		          <p class="store-icon-p">전략</p>
		        </a>
		      </li>
		   </ul>
	    </section>
		<!-- 정렬하기 + 총개수  -->
	    <!-- 게임 썸네일 -->
<%-- 	   	<%@ include file="./tags/store-search.jsp"%> --%>
		
		<!-- 정렬하기 + 총개수  -->
		<section class="store-range">
			<ul class="nav nav-pills">
				<li class="store-nav">
					<p class="store-nav-p">정렬기준</p>
				</li>
				<li class="store-nav dropdown">
					<form action="/store/Storegamelist" method="post">
						<select name="store-sort" class="form-select store-form-select" aria-label="Default select example">
							<option value="ABC">사전순</option>
							<option value="DESC">가격: 오름차순</option>
							<option value="ASC">가격: 내림차순</option>
						</select>
						<input type="submit" value="보기">
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
			<c:when test="${storegamelist != null and fn:length(storegamelist) > 0 }">
				<div class="row row-cols-1 row-cols-md-6 g-4 store-row">
					<c:forEach var="list" items="${storegamelist }">
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
			<%--장르별게임 가져오기 --%>
			<c:when test="${genrelist != null and fn:length(genrelist) > 0 }">
				<div class="row row-cols-1 row-cols-md-6 g-4 store-row">
					<c:forEach var="glist" items="${genrelist }">
						<div class="col">
							<a class="card h-100 store-card" href="/gamedetail.jsp"> 
								<img src="/img/games/${glist.imageDTO.image_main }" class="card-img-top" alt="...">
								<div class="card-body store-card-body">
									<h5 class="card-title">${glist.gameDTO.game_name } </h5>
									<p class="card-text">&#xFFE6; ${glist.gameDTO.game_price }</p>
								</div>
							</a>
						</div>
					</c:forEach>	
				</div>
			</c:when>
			<%--게임없을때 --%>
			<c:otherwise>
				<div>
					<h3>찾으시는 게임 목록이 없습니다.</h3>
				</div>
			</c:otherwise>
		</c:choose>
	</main>
	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>
	
	<script type="text/javascript">
		// 아이콘바의 아이콘을 눌렀을때 
		$("li.store-icon-width").on("click", function(){
			$("li.store-icon-width").removeClass("store-active")
			$(this).addClass("store-active")
		})
		
		
		
		
		
	</script>
	

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>