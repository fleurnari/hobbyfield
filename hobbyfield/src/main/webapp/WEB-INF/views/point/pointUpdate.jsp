<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상점 수정</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh; 
}

h3 {
	margin-top: 0;
	padding-top: 20px; 
	border-top: 1px solid #ccc;
	display: flex;
	align-items: center; 
}

form {
	margin-top: 20px;
}

.form-input {
	margin-bottom: 20px; 
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-right: 10px;
}

.endterm{
	margin-bottom: 30px;
}

</style>
</head>
<body>
<section>
		<div class="container">
			<div>
				<h3>포인트상품 수정</h3>
			</div>
			<form action="pointUpdate" class="pointUpdate" method="post">
				<input type="hidden" name="pointId" value="${point.pointId}">
				<div class="form-input">
					<label for="pointName">포인트 상품명</label> <input type="text" id="pointName" name="pointName" value="${point.pointName}" placeholder="${point.pointName}">
					<div class="formp-input">
						<label for="pointContent">상세설명</label>
						<textarea id="pointContent" name="pointContent" rows="10" required>${point.pointContent}</textarea>
					</div>
					<div class="endterm">
						<label for="pointEndterm">상품판매 마감일</label><input type="date" id="pointEndterm" name="pointEndterm" required="required">
					</div>
<!-- 					<div class="mb-2"> -->
<!-- 						<input type="file" name="uploadFile" multiple="multiple"> -->
<!-- 						<button type="button" id="uploadBtn">upload</button> -->
<!-- 					</div> -->
				<div class="buttonGroup">
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='pointList'">목록</button>
					<button type="reset" onclick="location.href='pointUpdate?pointId=${point.pointId}'">초기화</button>
				</div>
				</div>
			</form>
		</div>
</section>
	<script type="text/javascript">
	</script>
</body>
</html>