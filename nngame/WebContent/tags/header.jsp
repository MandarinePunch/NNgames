<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<header>
		<%-- user session 변수 설정 --%>
		<c:set var="udto" scope="session" value="${udto }" />
		
		<nav class="navbar navbar-expand-lg navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand header__nav-brand" href="/index.jsp"> 
					<img src="/img/logo/logo.png">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item header__nav-item"><a class="nav-link active"
							aria-current="page" href="/store/Storegamelist">스토어</a></li>
						<li class="nav-item header__nav-item">	
							<a class="nav-link active" aria-current="page" 
							href="/support/List">고객지원</a>
						</li>
						<li class="nav-item header__nav-item"><a class="nav-link active"
							aria-current="page" href="/library.jsp">라이브러리</a></li>
					</ul>
					<form class="d-flex">
						<input class="header__search me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>

					<ul class="navbar-nav">
						<%-- 장바구니 로그인 여부 처리 --%>
						<c:choose>
							<c:when test="${empty udto }">
								<li class="nav-item header__nav-item"><a
									class="nav-link active" aria-current="page" href="javascript:pleaseLogin()">
										<i class="fa-solid fa-cart-shopping"></i>
								</a></li>
							</c:when>
							<c:otherwise>			
								<li class="nav-item header__nav-item"><a
									class="nav-link active" aria-current="page" href="/cart/List">
										<i class="fa-solid fa-cart-shopping"></i>
								</a></li>
							</c:otherwise>
						</c:choose>
						
						<%-- 유저 로그인 여부 처리 --%>
						<c:choose>
							<c:when test="${empty udto}">
								<li class="nav-item header__nav-item"><a
									class="nav-link active" aria-current="page"
									href="/login/login.jsp"> Login </a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item header__nav-item"><a
									class="nav-link active" aria-current="page"
									href="/myPage.jsp"> <i class="fa-solid fa-user"></i>
								</a></li>
								<li class="nav-item header__nav-item"><a
									class="nav-link active" aria-current="page"
									href="/user/userLogout.io"> <i
										class="fa-solid fa-arrow-right-from-bracket"></i>
								</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	
	<!-- 쓰실 분들 쓰셔도 됩니다 -->
	<script>
		function pleaseLogin() {
			alert("로그인이 필요한 서비스입니다.");
		}
	</script>
	
	<!-- fontawesome 아이콘 (fontawesome 아이콘 쓰고 싶으면 이 스크립트 복붙해서 쓰면 됩니다.) -->
	<script src="https://kit.fontawesome.com/516437ec88.js" crossorigin="anonymous"></script>
</body>
</html>