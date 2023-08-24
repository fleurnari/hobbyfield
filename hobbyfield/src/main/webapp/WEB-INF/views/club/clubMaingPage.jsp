<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 메인 페이지</title>
</head>
<body>
	<!-- 소모임  -->
	<div>
		<c:forEach items="${club}" var="club">
			<div class="clubCSS">
				<!-- 소모임 내용 -->
			</div>
		</c:forEach>
		
	</div>
	
	<!-- 게시글  -->
	<div>
		<c:forEach items="${board}" var="board">
			<div class="boardCSS">
			</div>
		</c:forEach>
	</div>
</body>
</html>