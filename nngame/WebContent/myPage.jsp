<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

<title>내 정보</title>
</head>

<body>
	<!-- header-->
	<%@ include file="/tags/header.jsp"%>
	
	<!-- mainContents -->
	<div style="width: 100%;">
		<div class="container"
			style="padding-top: 100px; width: 35%; margin: 0 auto; color: white;">
			
			<!-- 회원정보 수정 -->
			<div class="row mypage-boxstyle">
				<form action="/user/userMod.io" onsubmit="return checkModNick()" method="post">
					<div class="mb-3">
						<label for="mod_Email" class="form-label">이메일</label> 
						<input type="email"	class="form-control" id="mod_Email" aria-describedby="emailHelp" value="${sessionScope.udto.getUser_email() }" disabled>
						<input type="hidden" name="user_email" value="${sessionScope.udto.getUser_email() }">
					</div>
					<div class="mb-3">
						<label for="mod_birth" class="form-label">생년월일</label>
						<input type="text" class="form-control" id="mod_birth" value="${fn:substring(sessionScope.udto.getUser_birth() , 0, 10) }" disabled>
					</div>
					<div class="mb-3">
						<label for="mod_nickname" class="form-label">닉네임</label>
						<input type="text" class="form-control" id="mod_nickname" name="user_nickname" value="${sessionScope.udto.getUser_nickname() }">
					</div>
					<div class="mb-3">
						<label for="mod_phone" class="form-label">전화번호</label>
						<input type="tel" class="form-control" id="mod_phone" name="user_phone" value="${sessionScope.udto.getUser_phone() }">
					</div>
					<div style="text-align: center;">
					<input type="submit" class="btn submit-btn" style="width: 40%; margin : 10px 0;"
						value="수정하기">
					</div>
				</form>
			</div>
			
			<!-- 비밀번호 변경 -->
			<div style="padding: 10px;"></div>
			<div class="row mypage-boxstyle">
				<form action="/user/userModPw.io" onsubmit="return checkModPw()" method="post">
					<label for="mod_pass1" class="form-label">비밀번호</label>
					<c:choose>
						<c:when test="${empty sessionScope.udto.getUser_pwd()}">
							<div class="mb-3">
								<input type="hidden" name="modid"
									value="${sessionScope.udto.getUser_email() }"> <input
									type="password" class="form-control" id="mod_beforepass"
									name="modpw" placeholder="현재 비밀번호">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control" id="mod_newpass"
									name="modnewpw" placeholder="새 비밀번호">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control"
									id="mod_newpasscheck" placeholder="새 비밀번호 확인">
							</div>
							<div style="text-align: center;">
								<input type="submit" class="btn submit-btn"
									style="width: 40%; margin: 10px 0;" value="수정하기">
							</div>
						</c:when>
						<c:otherwise>
							<p>연동 로그인기능 사용 시 비밀번호 변경이 불가합니다.</p>
						</c:otherwise>
					</c:choose>
				</form>
			</div>

			<!-- 회원 탈퇴 -->
			<div style="padding: 10px;"></div>
			<div class="row mypage-boxstyle">
				<form action="/user/userExit.io" method="post">
					<a data-bs-toggle="collapse" href="#collapseExit" role="button"
						aria-expanded="false" aria-controls="collapseExit"> 회원 탈퇴 </a>
					<div class="collapse" id="collapseExit">
						<div style="color: white;">
							<div style="font-size: 5px; padding: 5px 40px 20px;">
								<p>저희 사이트에 만족하지 못하셨나요?</p>
								<p>탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?</p>
								<p>그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!</p>
								<p>1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않습니다.</p>
								<p>2. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.</p>
								<p>3. 탈퇴 후 연동된 소셜 계정 정보도 사라지며, 소셜 로그인이 불가능합니다.</p>
								<p>4. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</p>
								<p>연동로그인 시의 비밀번호는 자동입력됩니다.</p>
							</div>
							<input type="hidden" name="user_email" value="${sessionScope.udto.getUser_email() }">
							<input type="password" name="user_pwd" class="form-control" id="mod_outpass" placeholder="현재 비밀번호 입력" value="${sessionScope.udto.getUser_pwd() }">
							<div style="text-align: center;">
								<input type="submit" class="btn submit-btn"	style="width: 40%; margin: 15px 0;" value="수정하기">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- UserMod js -->
	<script src="/js/login/usermod.js"></script>
	
	<!-- Bootstrap 옵션 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>