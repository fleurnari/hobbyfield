<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/profileImg.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>프로필창/이미지 업로드</title>
</head>
<body>
<div class="top" align="center">
	<form name="insertImg" action="insertImg" method="get">
		<div>
			<div class="profileSubject">
				<h1>프로필이미지 업로드</h1>
			</div>
			
		</div>
		<div>
			<label>첨부이미지</label>
			<div class="profileSection">
				<input type="file" id="fileItem" name="image">
			</div>
		</div>
		
		<button type="submit" class="imgBtn">등록</button>	
		<button type="reset" class="returnBtn">취소</button>
		
	</form>
</div>	

</body>
</html>