<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>포인트상점</title>
<style>
.header-left {
	float: left;
}

.header-right {
	float: right;
	text-align: left;
}

.sort-right {
	float: right;
	width: 120px;
	height: 20px;
	margin: 3px;
}

.main-body {
	
}

.product {
	
}

.row {
	float: center;
}
</style>
</head>
<body>
	<header>
		<div class="header-left">
			<a href="/noticeList">공지사항</a>
		</div>
		<div class="header-right">
			<input type="text" placeholder="검색어를 입력하세요.">
			<button type="submit">검색</button>
		</div>
	</header>
	<main>
	<!-- 관리자에게만 보이도록해야함 --> 
			<div class="btn-group">
				<button type="button">상품등록</button>
			</div>
		<form class="sort-right">
			<select class="form-control" id="sortOption" name="sortOption"
				onchange="changeOptionSelect()">
				<option selected disabled hidden>▼ 조회순</option>
				<option value="latest">최신순</option>
				<option value="latest">조회많은순</option>
				<option value="low">낮은가격순</option>
				<option value="high">높은가격순</option>
			</select>
		</form>

		<div class="main-body">
			<div class="row">
				<div class="col">
					<button type="button" name="status1" value="판매중">판매중</button>
				</div>
				<div class="col">
					<button type="button" name="status2" value="판매종료">판매완료</button>
				</div>
			</div>
			<div class="product">
				<img src="resources/images/bikini bottom2.jpg" alt="bees">
				<div class="product-info">
					<h6>소모임 증원</h6>
					<p>상품 설명</p>
					<p>판매 기간: 2023-03-10 ~ 2024-03-10</p>
				</div>
			</div>
			<div class="product">
				<img src="resources/images/bikini bottom2.jpg" alt="bees">
				<div class="product-info">
					<h6>이모티콘</h6>
					<p>판매 기간: 2023-03-08 ~ 2023-03-22</p>
				</div>
			</div>
			<div class="product">
				<img src="resources/images/bikini bottom2.jpg" alt="bees">
				<div class="product-info">
					<h6>이모티콘1</h6>
					<p>판매 기간: 2023-03-08 ~ 2023-03-22</p>
				</div>
			</div>
		</div>
	</main>
</body>
</html>