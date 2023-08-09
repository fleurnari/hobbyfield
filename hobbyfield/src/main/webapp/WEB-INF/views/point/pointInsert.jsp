<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품 등록</title>
</head>
<body>
	<div>
		<form action="pointInsert" method="post">
			<div>
				<input type="text" id="pointName" name="pointName"
					required="required" placeholder="상품이름을 입력하세요.">
			</div>
			<div>
				<input type="text" id="pointContent" name="pointContent"
					required="required" placeholder="내용을 입력하세요.">
			</div>
			<div>
				<select>
					<option value="">상품유형</option>
					<option value="">소모임 증원권</option>
					<option value="emoji">이모티콘</option>
				</select>
			</div>
			<div>
				<input type="datetime-local" id="pointRegdate" name="pointRegdate" required="required">
			</div>
			<div>
				<input type="datetime" id="pointEndterm" name="pointEndterm"
					required="required">
			</div>
			<div>
				<input type="file" id="pointImgName" name="pointImgName"
					accept="image/*">
			</div>
			<div>
				<input type="file" id="pointImgPath" name="pointImgPath"
					accept="image/*">
			</div>
			<div>
				<input type="number" id="pointPrice" name="pointPrice"
					required="required">
			</div>
		</form>
	</div>
</body>
</html>
