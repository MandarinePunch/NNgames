<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객지원</title>

<!-- bootstrap css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- 페이지 css -->
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<!-- header -->
	<%@ include file="/tags/header.jsp"%>

	<!-- main -->
	<c:set var="user" scope="session" value="${udto }" />
	<c:set var="supportDTO" scope="request" value="${supportDTO }" />
	<main class="qna__write">
		<h1 class="qna__detail-h1">문의 내용</h1>
		
		<!-- 문의 유형 -->
		<div>
			<label class="qna__write-title">문의</label>
			<div class="qna__write-box">
				<div class="qna__detail-type">
					${supportDTO.support_type }
				</div>
			</div>
		</div>
		
		<!-- 글 제목 -->
		<div>
			<label class="qna__write-title">제목</label>
			<div class="qna__write-box">
				<div class="qna__detail-title">
					${supportDTO.support_title }
				</div>
			</div>
		</div>
		
		<!-- 글 내용 -->
		<div>
			<label class="qna__write-title">내용</label>
			<div class="qna__write-box">
				<div class="qna__detail-content">
					${supportDTO.support_content }
				</div>					
			</div>
		</div>
		
		<!-- 관리자 계정 만들시, 진행중, 완료 업데이트..
			<div class="qna__progress">
				<form action="/support/progress" method="post" class="checkProgress">
					<table class="qna__progress-table">
						<tr valign="middle">
							<td align="left" style="padding-left: 10px">
								<label class="qna__progress-text"><input type="radio" name="support_result" value="진행중" checked>&nbsp;진행중</label>
								<label class="qna__progress-text"><input type="radio" name="support_result" value="완료" >&nbsp;완료</label>
							</td>
							<td align="right">
								<button type="submit" class="btn" style="color:#ffe403">확인</button>
								<input type="hidden" name="support_num" value="${supportDTO.support_num }">
							</td>
						</tr>
					</table>	
				</form>
			</div>
		 -->
		
		<!-- 목록, 수정, 삭제 버튼 -->
		<div class="qna__write-box qna__btn-box">
			<button type="button" class="btn submit-btn" onclick="location.href='/support/List'">목록</button>
			
			<%-- 현재 로그인된 유저일시에만 수정 및 삭제 가능 --%>
			<c:if test="${supportDTO.user_num == user.user_num }">				
				<form action="/support/update" method="post">
					<button type="submit" class="btn submit-btn">수정</button>
					<input type="hidden" name="support_num" value="${supportDTO.support_num }">				
				</form>
				<form action="/support/delete" method="post" class="deleteForm">
					<button type="submit" class="btn submit-btn deleteBtn">삭제</button>
					<input type="hidden" name="support_num" value="${supportDTO.support_num }">
				</form>
			</c:if>
		</div>
	</main>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>
	
	<!-- 구현 거의 다되면 분리시킬것 -->
	<script>
		const deleteForm = document.querySelector(".deleteForm");
	
		function deleteConfirm(event) {
			let result = confirm("정말 삭제하시겠습니까?");
			
			if(!result){				
				event.preventDefault();
			} 
		}
		
		deleteForm.addEventListener("submit", deleteConfirm);
	</script>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>