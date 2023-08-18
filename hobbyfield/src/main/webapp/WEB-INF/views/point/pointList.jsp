<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
			<a href="${pageContext.request.contextPath}/noticeList">공지사항</a>
		</div>
		<!-- 		<form action=pointListSearch> -->
		<!-- 			<input type="text" name="pointListSearch" placeholder="검색어를 입력하세요" -->
		<!-- 				onclick="location.href='#'"> <input type="submit" value="검색"> -->
		<!-- 		</form> -->
	</div>
	<main>
		<%-- 		<c:if test="${memberGrd eq A3}"> --%>
		<div class="btn-group">
			<button type="button" onclick="location.href='pointInsert'">상품등록</button>
		</div>
		<%-- 		</c:if> --%>


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

		<div class="state">
			<div>
				<button type="button" name="state1" value="V1"
					onclick="changestate('판매중')">판매중</button>
			</div>
			<div>
				<button type="button" name="state2" value="V2"
					onclick="changestate('판매종료')">판매종료</button>

			</div>
		</div>
		<div>
		<table>
			<tr>
				<th>조회수</th>
				<th>이름</th>
				<th>내용</th>
				<th>등록일</th>
				<th>판매종료일</th>
				<th>이미지이름</th>
				<th>이미지경로</th>
			</tr>
			<c:forEach items="${pointList}" var="point">
				<tr onclick="location.href='pointInfo?pointId=${point.pointId}'">
					<th>${point.pointView}</th>
					<th>${point.pointName}</th>
					<th>${point.pointContent}</th>
					<th>${point.pointRegdate}</th>
					<th>${point.pointEndterm}</th>
					<th>${point.pointImgName}</th>
					<th>${point.pointImgPath}</th>
				</tr>
			</c:forEach>
		</table>
		<span>
			<jsp:useBean id="now" class="java.util.Date"/>
			
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			
			<fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="strPlanDate" />
			<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24) }" integerOnly="true" var="strDate" />
			
			<fmt:parseDate value="${pointInfo.pointEndterm }" pattern="yyyy-MM-dd" var="endPlanDate" />
			<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
			
			<c:choose>
				<c:when test="${endDate - nowfmtTime >= 1}">
				${endDate - nowfmtTime + 1}
			</c:when>
		
		</c:choose>
		
		</span>
		</div>
		
		
	</main>
	<script>
	
	</script>
</body>
</html>