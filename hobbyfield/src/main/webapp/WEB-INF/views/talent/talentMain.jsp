<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능기부 메인</title>
<style>
body {
	margin-top: 150px;
	font-family: Arial, sans-serif;
	padding: 0;
}

.review-section {
	background-color: #f9f9f9;
	padding: 20px;
	text-align: center;
}

.category-section {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 20px;
}

.category-box {
	width: calc(20% - 20px); <!-- 5개씩 보이도록 --> 
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 20px;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<input type="text" placeholder="검색어를 입력하세요">
		<button>검색</button>
	</div>
	<div class="talentInsert">
		<button type="button" onclick="location.href='/talent/talentInsert'">재능기부하기</button>
	</div>
	<div class="review-section">
		<a href="${pageContext.request.contextPath}/tReview">
			<div style="border: 2px solid #333; padding: 20px; cursor: pointer;">
				<h2>재능기부 후기</h2>
			</div>
		</a>
	</div>

	<div class="category-section">
		<c:forEach items="${tlntCate}" var="category">
			<a href="${pageContext.request.contextPath}/category/${category.talentCate}">
				<div class="category-box">
					<img src="${category.imageURL}" alt="${category.talentCate}">
					<h3>${category.talentCate}</h3>
				</div>
			</a>
		</c:forEach>
	</div>
</body>
</html>
