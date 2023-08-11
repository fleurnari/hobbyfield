<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>포인트상점</title>
<style>
body {
	/*         display: flex; */
	/*         flex-direction: column; */
	/*         justify-content: space-between; */
	/*         align-items: center; */
	/*         min-height: 100vh; */
	/*         margin: 0; */
	
}

.header-left {
	margin-top: 150px;
}

.sort-right {
	width: 200px;
	align-items: right;
	width: 200px;
}

.state {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	width:
}

.main-body {
	display: flex;
	justify-content: center;
}

.product {
	margin: 0 10px;
	text-align: center;
}

.form-control {
	display: inlineblock;
}
</style>
</head>
<body>
	<div>
		<div class="header-left">
			<a href="/noticeList">공지사항</a>
		</div>
		<form action=/MVC2/MemberSelectController>
			<input type="text" name="pointListSearch" placeholder="검색어를 입력하세요"
				onclick="location.href='#'"> <input type="submit" value="검색">
		</form>
	</div>
	<main>
		<c:if test="${memberGrd eq A3}">
			<div class="btn-group">
				<button type="button" onclick="location.href='pointInsert'">상품등록</button> 
			</div>
		</c:if>

		<form class="sort-right">
			<select class="form-control" id="sortOption" name="sortOption"
				onchange="changeOptionSelect()">
				<option selected disabled hidden>▼조회순</option>
				<option value="latest">최신순</option>
				<option value="latest">조회많은순</option>
				<option value="low">낮은가격순</option>
				<option value="high">높은가격순</option>
			</select>
		</form>

		<div class="main-body">
			<div class="state">
				<div>
					<button type="button" name="status1" value="판매중"
						onclick="location.href='pointList'">판매중</button>
				</div>
				<div>
					<button type="button" name="status2" value="판매종료"
						onclick="location.href='pointList'">판매완료</button>
				</div>
			</div>
			<div class="product">
				<img src="resources/images/bikini bottom2.jpg" alt="bees">
				<div class="product-info">
					<h5>소모임 증원</h5>
					<p>상품 설명</p>

				</div>
			</div>
		</div>
	</main>
</body>
</html>