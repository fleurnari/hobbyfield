<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클럽목록</title>
</head>
<body>
	<div align="center" style="margin-top: 100px;">
	<input type="text" id="memberEmail" value="${member.memberEmail}">
		<table>
			<thead>
				<tr>
					<th>모임리더</th>
					<th>모임이름</th>
					<th>카테고리</th>
					<th>분류</th>
					<th>소개글</th>
					<th>광역시</th>
					<th>구</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clubList}" var="club">
					<tr onclick="location.href='boardInfo?bno=${board.bno}'">
						<td>${club.profileNickname}</td>
						<td>${club.clubName}</td>
						<td>${club.clubCategory}</td>
						<td>${club.clubType}</td>
						<td>${club.clubInfo}</td>
						<td>${club.majorLocation}</td>
						<td>${club.subLocation}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</body>
</html>