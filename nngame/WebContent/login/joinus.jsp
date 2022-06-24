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
<link rel="stylesheet" href="../css/style.css" />
<title>회원가입</title>
</head>
<body>
	<!-- header-->
	<%@ include file="/tags/header.jsp"%>

	<!-- mainContents -->
	<div class="container join">
		<!-- 회원가입 Form -->
		<div class="row">
			<form action="/user/userJoin.io" name="joinform" method="post" onsubmit="return checkJoin()">
				<div class="mb-3">
					<label for="JoinEmail1" class="form-label">이메일</label> <input
						type="email" class="form-control" id="join_Email"
						aria-describedby="emailHelp" onblur="join_focusOut()" name="user_email">
					<p id="join_pid" class="join_pred"></p>
				</div>
				<div class="mb-3">
					<label for="JoinPassword1" class="form-label">비밀번호</label> <input
						type="password" class="form-control" id="join_Password1"
						onblur="join_focusOut()" name="user_pwd">
					<p id="join_ppw" class="join_pred"></p>
				</div>
				<div class="mb-3">
					<label for="JoinPassword2" class="form-label">비밀번호 확인</label> <input
						type="password" class="form-control" id="join_Password2">
				</div>
				<div class="mb-3">
					<label for="JoinNickname" class="form-label">닉네임</label> <input
						type="text" class="form-control" id="join_Nickname"
						onblur="join_focusOut()" name="user_nickname">
					<p id="join_pnickname" class="join_pred"></p>
				</div>
				<div class="mb-3">
					<label for="JoinPhoneNum" class="form-label">전화번호</label> <input
						type="tel" class="form-control" id="join_PhoneNum"
						onblur="join_focusOut()" name="user_phone">
					<p id="join_pphnum" class="join_pred"></p>
				</div>
				<div class="mb-3">
					<label for="JoinBirth" class="form-label">생년월일</label> <input
						type="date" class="form-control" id="join_Birth"
						onblur="join_focusOut()" name="user_birth">
					<p id="join_pbirth" class="join_pred"></p>
				</div>
				<p class="join__agree-msg">가입 시 이용약관, 개인정보 취급방침에 동의합니다.</p>
				<input type="submit" class="btn submit-btn join__submit-btn"
					value="가입하기">
			</form>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- 회원가입 폼 Script -->
	<script src="/js/login/joinus.js"></script>

	<!-- Bootstrap 옵션 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>