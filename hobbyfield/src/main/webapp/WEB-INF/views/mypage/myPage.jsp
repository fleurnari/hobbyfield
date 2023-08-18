<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<div>
				<label for="memberEmail">아이디</label> 
				<input type="text" name="memberEmail" id="memberEmail" value="${info.memberEmail}" readonly> 
			</div>
			<div>
				<label for="memberNm">이름</label> 
				<input type="text" name="memberNm" id="memberNm" value="${info.memberNm}" readonly> 
			</div>			
		</div>
	</div>
</body>
</html>