<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
</head>
<body>
	<table class="notice-info">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${noticeInfo}" var="notice">
			<tr>
				<td>${notice.noticeId}</td>
				<td>${notice.noticeWriter}</td>
				<td>${notice.noticeCate}</td>
				<td>${notice.noticeTitle}</td>
				<td>${notice.noticeSubject}</td>
				<td>${notice.noticeWdate}</td>
				<td>${notice.noticeView}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>