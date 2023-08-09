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
	<%-- <div>
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
				<c:forEach items="${clubList }" var="club">
					<tr>
						<td>${club.profileNickname}</td>
						<td>${club.name}</td>
						<td>${club.category}</td>
						<td>${club.type}</td>
						<td>${club.info}</td>
						<td>${club.majorLocation}</td>
						<td>${club.subLocation}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div> --%>
</body>
</html>