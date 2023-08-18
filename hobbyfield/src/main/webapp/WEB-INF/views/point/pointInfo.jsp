<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품 단건조회</title>
<style>
.jb-division-line {
	border-top: 1px solid #444444;
	margin: 30px;

}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>${point.pointName}</h3>
			<p>pointPrice---------------</p>
			<p>${point.pointContent}</p>
			<p>${point.pointItemType}</p>
			<p>${point.pointContent}</p>
			<p>${point.pointItemType}</p>
			<p>${point.pointState}</p>
			<p>${point.pointEndterm}</p>
			<p>${point.pointImgName}</p>
			<p>${point.pointImgPath}</p>
			<p>${point.pointView}</p>
		</div>
	</div>
	<div class="jb-division-line"></div>
</body>
</html>