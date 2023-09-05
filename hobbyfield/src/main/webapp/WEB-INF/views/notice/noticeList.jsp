<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
body {
	margin-top: 150px;
	padding: 0;
	background-color: #ffffff;
}

.header {
	text-align: center;
	padding: 20px;
	margin-bottom: 50px;
}

.title {
	margin: 0;
}

.write-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 5px;
	cursor: pointer;
	float: left;
	margin-left: 10%;
}

.search-bar {
	text-align: right;
	margin-top: 5px;
}

.search-input {
	margin-right: 10px;
}

.search-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 10%;
}

.notice-list {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

.notice-list th, .notice-list td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="header">
		<h1 class="title">공지사항</h1>
		<button type="button" onclick="location.href='insertNotice'"
			class="write-button">등록</button>
 		<!-- JSP 파일에서 페이징 및 검색 결과를 화면에 표시 --> 
 		<!-- 페이지 링크 --> 
<!-- 		<div class="pagination"> -->
<%-- 			<c:if test="${pageMaker.prev}"> --%>
<%-- 				<a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:forEach var="i" begin="${pageMaker.startPage}" --%>
<%-- 				end="${pageMaker.endPage}"> --%>
<%-- 				<a href="${pageMaker.makeQuery(i)}">${i}</a> --%>
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${pageMaker.next}"> --%>
<%-- 				<a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->

 		<!-- 검색 폼 --> 
<!-- 		<div class="search-form"> -->
<%-- 			<form action="${pageMaker.makeSearch(1)}" method="get"> --%>
<!-- 				<select name="searchType"> -->
<!-- 					<option value="notice_cate">카테고리</option> -->
<!-- 					<option value="notice_title">제목</option> -->
<%-- 				</select> <input type="text" name="keyword" value="${cri.keyword}" /> --%>
<!-- 				<button type="submit">검색</button> -->
<!-- 			</form> -->
<!-- 		</div> -->

	</div>
	<table class="notice-list">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeList}" varStatus="status">
				<tr onclick="location.href='noticeInfo?noticeId=${notice.noticeId}'">
					<td>${notice.noticeId}</td>
					<td>${notice.noticeWriter}</td>
					<td>${notice.noticeCate}</td>
					<td>${notice.noticeTitle}</td>
					<td><fmt:parseDate value="${notice.noticeWdate}"
							pattern="yyyy-MM-dd" var="noticeWdate" /> <fmt:formatDate
							value="${noticeWdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var noticeRows = document
					.querySelectorAll(".notice-list tr[data-notice-id]");

			noticeRows.forEach(function(row) {
				row.addEventListener("click", function() {
					var noticeId = row.getAttribute("data-notice-id");
					if (noticeId) {
						location.href = "noticeInfo?noticeId=" + noticeId;
					}
				});
			});
		});
	</script>
</body>
</html>
