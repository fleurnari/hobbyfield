<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	margin-top: 150px;
	font-family: Arial, sans-serif;
	background-color: #fff;;
}

.container{
    margin-bottom: 100px;
}

.title {
	margin-bottom: 30px;
	text-align: center;
	padding: 20px;
	margin-bottom: 30px;
}

.header-left {
	margin-top: 20px;
	margin-left: 20px;
}


.notice-link:hover {
	color: #FF6A00;
	font-weight: bold;
	text-decoration: underline 2px;
}

.write-button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 3%; 
    margin-left: 45%;
}

.state-buttons {
    display: flex;
    gap: 20px;
    justify-content: center; 
    margin-bottom: 50px;
    height: 60px;
}

.state-button {

    background: linear-gradient(to right, rgba(164, 246, 194, 0.8), rgba(170, 237, 244, 0.8));
    color: rgba(0, 0, 0, 0.7);
    font-size: large;
    font-weight:bold;
    border: none;
    border-radius: 5px;
    padding: 10px 15px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    flex-grow: 1; /* 버튼이 화면을 좌우로 늘어나도록 설정 */
    text-align: center; 
}

.state-button:hover {
    background: linear-gradient(to right, rgba(164, 246, 194, 0.8), rgba(170, 237, 244, 0.8));
    color: white;
}

.state-span{
	font-size: xx-large;
	margin-top: 2px;
}

.point-list {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.point-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: calc(25% - 20px);
    background-color: #fff;
    padding: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s;
    cursor: pointer;
}

.point-item:hover {
	transform: translateY(-5px);
}

.point-item img {
	width:200px;
	max-width: 100%;
	height: auto;
	margin-left: 10%;
}

.point-details {
	text-align: center;
	padding: 10px;
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

th {
	background-color: #4CAF50;
	color: white;
}


</style>
</head>
<body>
	<h1 class="title">포인트 상점</h1>
	<div class="container">
		<div>
			<c:if test="${member.memberGrd eq 'A3'}">
				<button type="button" class="write-button" onclick="location.href='pointInsert'">아이템등록</button>
			</c:if>
		</div>

		<div class="state-buttons" role="group">
			<button class="state-button" type="button" name="state1" value="V1" onclick="changestate('V1')">판매중</button>
			<span class="state-span">|</span>
			<button class="state-button" type="button" name="state2" value="V2" onclick="changestate('V2')">판매종료</button>
		</div>
		<div class="point-list">
			<c:forEach items="${pointList}" var="point"> 
				<div class="point-item" onclick="location.href='pointInfo?pointId=${point.pointId}'"
					data-state="${point.pointState}" data-sort="${point.pointItemType }">
					<img src="${pageContext.request.contextPath}${point.pointImgPath}${point.pointImgName}"  alt="상품 이미지"
					onerror="this.onerror=null; this.src=${pageContext.request.contextPath}/resources/images/'alien.png.';"
					><br>
					<div class="point-details">
<%-- 						<p>${point.pointId}</p> --%>
						<p>${point.pointName}</p>
						<c:if test="${point.pointItemType eq 'W1' }">
						<p class="time">
							<jsp:useBean id="now" class="java.util.Date" />
								<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request" />
								<fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="strPlanDate" />
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate" />
								<fmt:parseDate value="${point.pointEndterm}" pattern="yyyy-MM-dd" var="endPlanDate" />
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
							<c:choose>
								<c:when test="${endDate - nowfmtTime > 0}">
                                    ${endDate - nowfmtTime + 1}
                                    <span>일 남음</span>
								</c:when>
								<c:when test="${endDate - nowfmtTime == 0}">
									<span>오늘 마감</span>
								</c:when>
								<c:otherwise>
									<span>마감</span>
								</c:otherwise>
							</c:choose>
						</p>
						<p>
							<fmt:parseDate value="${point.pointEndterm}" pattern="yyyy-MM-dd" var="pointEndterm" />
						</p>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
        function changestate(state) {
            // 모든 행 숨기기
            const pointItems = document.querySelectorAll('.point-item');
            pointItems.forEach(item => {
                item.style.display = 'none';
            });

            // 선택한 행 보여주기
            const selectedItems = document.querySelectorAll('.point-item[data-state="'+state+'"]');
            selectedItems.forEach(item => {
                item.style.display = 'flex';
            });
        }
        
        changestate('V1');	
        
    </script>
</body>
</html>
