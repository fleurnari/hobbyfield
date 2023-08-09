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
	margin: 30px 0px;
}
</style>
</head>
<body>
	<main>
		<div class="product">
			<img src="resources/images/bikini bottom2.jpg" alt="bees">
			<div class="product-info">
				<p>2023-03-08 ~ 2023-03-22</p>
			</div>
		</div>
		<div>
			<input type="radio" name="chk_info" checked="checked">7일 이용권 <!-- value -->
			<input type="radio" name="chk_info" >14일 이용권
			<input type="radio" name="chk_info">30일 이용권
			<input type="radio" name="chk_info">영구 이용권
			<p>가용포인트 : ${pointInfo.memberActPnt }</p>
		</div>
		<div class="btn-group]">
			<button type="button" value="위시">위시</button>
			<button type="submit" value="구입">구입</button>
			<!-- 구매 팝업창 떠야함 -->
		</div>
		<div class="jb-division-line"></div>
		<div>
			<h3>상세설명</h3>
		</div>
	</main>
</body>
</html>