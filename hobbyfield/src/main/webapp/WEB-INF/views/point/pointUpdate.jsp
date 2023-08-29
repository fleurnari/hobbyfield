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
	margin-top: 150px;
}
</style>
</head>
<body>
	<form action="pointUpdate" class="pointUpdate" method="post">
		<div class="container">
			<div>
				<h3>포인트상품 수정</h3>
			</div>
			<input type="hidden" name="pointId" value="${point.pointId}">
			<div class="form-input">
				<label for="pointName">포인트 상품명</label> <input type="text"
					id="pointName" name="pointName" value="${point.pointName}"
					placeholder="${point.pointName}">

				<div class="formp-input">
					<label for="pointContent">상세설명</label>
					<textarea id="pointContent" name="pointContent" rows="10" required>${point.pointContent}</textarea>
				</div>
				<div>
					<label for="pointEndterm">상품판매 마감일</label><input type="date"
						id="pointEndterm" name="pointEndterm" required="required">
				</div>
				<div>=================이미지업로드================</div>
				<div class="buttonGroup">
					<button type="submit">수정완료</button>
					<button type="button" onclick="location.href='poinList'">목록</button>
					<button type="reset" onclick="location.href='pointUpdate'">초기화</button>
				</div>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		
	</script>
</body>
</html>