<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트상점</title>
<style>
body {
	margin: 0;
}

.header-left {
	margin-top: 150px;
}

.sort-right {
	width: 200px;
	text-align: right;
	margin-right: 20px; /* 수정: 오른쪽 여백 추가 */
}

.state {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
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
	display: inline-block;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<h3>포인트 상점</h3>
	<div>
		<div class="header-left">
			<a href="${pageContext.request.contextPath}/noticeList">공지사항</a>
		</div>
		<main>
			<div class="btn-group">
				<button type="button" onclick="location.href='pointInsert'">상품등록</button>
			</div>

			<!-- 공통코드 하고 css -->
			<form class="sort-right">
				<select class="form-control" id="sortOption" name="sortOption"
					onchange="changeOptionSelect()">
					<option disabled selected>▼조회순</option>
					<option value="latest">최신순</option>
					<option value="latest">조회많은순</option>
					<option value="low">낮은가격순</option>
					<option value="high">높은가격순</option>
				</select>
			</form>

			<div class="state">
				<div>
					<button type="button" name="state1" value="V1"
						onclick="changestate('V1')">판매중</button>
				</div>
				<div>
					<button type="button" name="state2" value="V2"
						onclick="changestate('V2')">판매종료</button>
				</div>
			</div>
			<div>

				<div class="point-List">
					<div class="point-product">
						<p></p>
					</div>
				</div>

				<table>
					<thead>
						<tr>
							<th>조회수</th> 
							<th>상품이름</th>
							<th>남은기간</th>
							<th>판매종료일</th>
						</tr>
					</thead>
					<tbody class="point">
						<c:forEach items="${pointList}" var="point">
							<tr onclick="location.href='pointInfo?pointId=${point.pointId}'"
								data-state="${point.pointState }">
								<td>${point.pointView}</td>
								<td>${point.pointName}</td>
								<td class="time"><jsp:useBean id="now"
										class="java.util.Date" /> <fmt:parseNumber
										value="${now.time / (1000*60*60*24)}" integerOnly="true"
										var="nowfmtTime" scope="request" /> <fmt:parseDate
										value="${today}" pattern="yyyy-MM-dd" var="strPlanDate" /> <fmt:parseNumber
										value="${strPlanDate.time / (1000*60*60*24)}"
										integerOnly="true" var="strDate" /> <fmt:parseDate
										value="${point.pointEndterm}" pattern="yyyy-MM-dd"
										var="endPlanDate" /> <fmt:parseNumber
										value="${endPlanDate.time / (1000*60*60*24)}"
										integerOnly="true" var="endDate" /> <c:choose>
										<c:when test="${endDate - nowfmtTime >= 1}">
            					${endDate - nowfmtTime + 1}
           						<span>일 남음</span>
										</c:when>
										<c:when test="${endDate - nowfmtTime == 0}">
											<span>오늘 마감</span>
										</c:when>
										<c:otherwise>
											<span>마감</span>
										</c:otherwise>
									</c:choose></td>
								<td><fmt:parseDate value="${point.pointEndterm}"
										pattern="yyyy-MM-dd" var="pointEndterm" /> <!-- 							string으로 저장한 pointEndterm을 date로 -->
									<fmt:formatDate value="${pointEndterm}" pattern="yyyy-MM-dd" /></td>
								<!-- 								date로 변환한 pointEndterm에 format 입히기 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
		<script>
    function changestate(state) {
    	  // 모든 행 숨기기
    	  const tableRows = document.querySelectorAll('.point tr');
    	  tableRows.forEach(row => {
    	    row.style.display = 'none';
    	  });

    	  // 선택한 행 보여주기
   	    const sellingRows = document.querySelectorAll('.point tr[data-state="'+state+'"]');
   	    sellingRows.forEach(row => {
   	      row.style.display = '';
   	    });
    	 
    }

    </script>
	</div>
</body>
</html>
