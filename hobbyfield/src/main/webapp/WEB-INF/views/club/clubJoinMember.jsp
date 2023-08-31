<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 가입 신청자 List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<section>
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<th align="center">닉네임 </th>
							<th align="center">가입신청일자 </th>
							<th align="center">질문답변 1 </th>
							<th align="center">질문답변 2</th>
							<th align="center">질문답변 3</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${beforeMembers}" var="members">
						<tr>
							<td>${members.profileNickname }</td>
							<td>${members.applyDate }</td>
							<td>${members.applyAnswer1 }</td>
							<td>${members.applyAnswer2 }</td>
							<td>${members.applyAnswer3 }</td>
						</tr>
						</c:forEach>
						
					</tbody>	
				</table>
			</div>
		</div>	
	</section>
</body>
</html>