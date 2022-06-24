<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<link rel="stylesheet" href="../css/style.css" />

<title>패스워드 찾기</title>
</head>

<body>
	<!-- header-->
	<%@ include file="/tags/header.jsp"%>
	<div style="padding: 20px"></div>

	<!-- mainContents -->
	<div style="width: 100%; height: 60vh;">
		<div class="container"
			style="padding-top: 150px; width: 30%; margin: 0 auto; color: white;">
			<!-- PwFind Form -->
			<div class="row">
				<c:choose>
					<c:when test="${empty requestScope.findout}">
						<h1 style="font-size: 20px; text-align: center;">비밀번호 찾기</h1>
						<form action="/user/userPwFind" onsubmit="return checkId()"
							method="post">
							<div class="mb-3">
								<label for="findPwEmail" class="form-label"
									style="font-size: 13px;">이메일을 입력해주세요.</label> <input
									type="email" class="form-control" id="findPwEmail"
									name="user_email" aria-describedby="emailHelp"
									onblur="pwfind_focusOut()">
								<p id="pwfind_id" style="color: red;"></p>
							</div>
							<input type="submit" class="btn submit-btn" style="width: 100%;"
								value="비밀번호 찾기">
						</form>
					</c:when>
					<c:otherwise>
						<div align="center">
							<h2>비밀번호 찾기 결과</h2><br>
							<h3>${requestScope.findout }</h3>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- 이메일 누락 체크 Script -->
	<script src="/js/login/findpw.js"></script>

	<!-- Bootstrap 옵션 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>