<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Support</title>

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
	<c:set var="totalCount" value="${requestScope.totalCount }" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalPage" value="${requestScope.totalPage }" />
	<c:set var="currentPage" value="${requestScope.currentPage }" />
	<c:set var="supportList" value="${requestScope.supportList }" />
	<c:set var="udto" scope="session" value="${udto }" />
	<main class="qna__board">
		<h1 class="qna__board-title">고객지원</h1>
		<table class="qna__table">
			<tr>
				<td align="right">문의 개수 : ${totalCount }</td>
			</tr>
		</table>
		<table class="table table-dark table-sm table-hover qna__table">
			<thead>
				<tr>
					<th scope="col" width="5%">No.</th>
					<th scope="col" width="12%">문의 형태</th>
					<th scope="col" width="40%">제목</th>
					<th scope="col" width="13%">작성자</th>
					<th scope="col" width="10%">문의 날짜</th>
					<th scope="col" width="10%">진행 상황</th>
				</tr>
			</thead>
			<tbody>
				<%-- 글 목록 --%>
				<c:choose>
					<c:when test="${empty supportList}">
						<tr height="40px" valign="middle">
							<td colspan="6">글이 없어요.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="i" value="0" />
						<c:forEach var="supportDTO" items="${supportList}" varStatus="status">			
							<tr>
								<th scope="row">${totalCount - (currentPage - 1) * 10 - status.index}</th>
								<td>${supportDTO.support_type}</td>
								<td class="qna__List-title"><a href="/support/detail?support_num=${supportDTO.support_num }">${supportDTO.support_title} </a></td>
								<td>${supportDTO.support_writer }</td>
								<td>${supportDTO.support_date}</td>
								<td class="qna__List-progress">${supportDTO.support_result}</td>
							</tr>
						</c:forEach>		
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<c:if test="${not empty udto }">		
			<table class="qna__table">
				<tr>
					<td align="right">
						<button class="btn submit-btn" onclick="location.href='/support/insert'">글쓰기</button>
					</td>
				</tr>
			</table>
		</c:if>
		
		<!-- 페이징 처리 -->
		<table class="qna__table">
			<tr>
				<td class="qna__paging">
					<%-- 이전 페이지(<) 버튼 표시 --%>
					<c:if test="${currentPage > 5 }">
						<%-- 이전 페이지로 돌아올 때 돌아온 페이지의 마지막 글에 오게끔 --%>
						<fmt:parseNumber var="page" value="${currentPage / 5 }" integerOnly="true" />
						<c:choose>
							<c:when test="${currentPage % 5 == 0 }">
								<a class="qna__paging-move" href="?page=${(page - 1) * 5 }"><i class="fa-solid fa-angle-left"></i></a>
							</c:when>
							<c:otherwise>							
								<a class="qna__paging-move" href="?page=${page * 5 }"><i class="fa-solid fa-angle-left"></i></a>
							</c:otherwise>
						</c:choose>
					</c:if>
					
					<%-- 페이지 넘버 표시 --%>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${i == currentPage }">
								<div class="qna__paging-selected">
									${i }
								</div>
							</c:when>
							<c:otherwise>
								<a class="qna__paging-num" href="?page=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<%-- 다음 페이지(>) 버튼 표시 --%>
					<c:if test="${endPage < totalPage }">
						<%-- 다음 페이지 넘어갈 때 넘어갈 페이지의 첫 번째 글에 오게끔 --%>
						<fmt:parseNumber var="page" value="${currentPage / 5 }" integerOnly="true" />
						<c:choose>
							<c:when test="${currentPage % 5 == 0 }">
								<a class="qna__paging-move" href="?page=${(page - 1) * 5 + 6 }"><i class="fa-solid fa-angle-right"></i></a>
							</c:when>
							<c:otherwise>									
								<a class="qna__paging-move" href="?page=${page * 5 + 6 }"><i class="fa-solid fa-angle-right"></i></a>
							</c:otherwise>
						</c:choose>		
					</c:if>
				</td>			
			</tr>
		</table>
	</main>

	<!-- footer -->
	<%@ include file="/tags/footer.jsp"%>

	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/516437ec88.js" crossorigin="anonymous"></script>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>