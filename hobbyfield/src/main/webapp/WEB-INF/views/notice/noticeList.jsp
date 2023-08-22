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
}

.header {
	text-align: center;
	background-color: #f0f0f0;
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
}

.search-bar {
	float: right;
	margin-top: 5px;
}

.search-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
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
		<div>
			<%-- 			<c:if test="${memberGrd eq 'A3'}"> --%>
			<div class="btn-group">
				<button type="button" onclick="location.href='insertNotice'">등록</button>
			</div>
			<%-- 			</c:if> --%>
		</div>
		<input type="text" placeholder="검색어를 입력하세요">
		<button class="search-button">검색</button>
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