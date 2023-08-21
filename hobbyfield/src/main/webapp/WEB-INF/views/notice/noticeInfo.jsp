<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin-top: 150px;
}

.notice-info {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

.notice-info th, .notice-info td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 30px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
</head>
<body>
	<table class="notice-info">
		<thead>
			<tr>
				<th>조회수</th>
				<th>글번호</th>
				<th>작성자</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeInfo}" var="notice">
				<tr>
					<td>${notice.noticeView}</td>
					<td>${notice.noticeId}</td>
					<td>${notice.noticeWriter}</td>
					<td>${notice.noticeCate}</td>
					<td>${notice.noticeTitle}</td>
					<td>${notice.noticeSubject}</td>
					<td><fmt:parseDate value="${notice.noticeWdate}"
							pattern="yyyy-MM-dd" var="noticeWdate" /> <fmt:formatDate
							value="${noticeWdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 버튼 -->
	<div class="buttonGroup">
<%-- 		<c:if test="${memberGrd eq 'A3'}"> --%>
			<button type="submit" onclick="location.href='noticeUpdate'">수정</button>
			<button type="button" onclick="location.href='noticeDelete?noticeId=${notice.noticeId}'">삭제</button>
<%-- 		</c:if> --%>
			<button type="button" onclick="location.href='noticeList'">목록</button>

	</div>
</body>
</html>