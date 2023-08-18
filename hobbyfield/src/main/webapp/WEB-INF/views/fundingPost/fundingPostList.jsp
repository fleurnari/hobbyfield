<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트 조회</title>
<style>
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}

.item {
  width: 30%; 
  margin-bottom: 10px; 
}
#img{
	width: 333px;
	height: 333px;
}

</style>

</head>
<body>
	<Section>
	<!-- 임시 카테고리 -->
	<div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/fundingPostList"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></a>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">카테고리</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">인기</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">마감임박</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">공지사항</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">후원현황</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/fundingPostInsertForm">프로젝트만들기</a></li>
            </ul>
        </div>
	</Section>
	<Section>
	<div class="container">
		<div class="container2">
			<c:forEach items="${fundingPostList }" var="fundingPost">
			<div onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'">
					<figure>
						<img id="img" src="resources/images/${fundingPost.fndMainImg }" alt="">
					</figure>
				<p>
					<span>${fundingPost.fndCategory }</span>
				</p>
				<p>
					<span><h3>프로젝트 이름</h3></span>
					<span>${fundingPost.fndTitle }</span>
				</p>
				<br />
				<p>
					<span>${fundingPost.fndStatus}</span>
				</p>
				<p>
					<span>000%</span>
				</p>
				<p>
					<span>${fundingPost.fndCurrentAmount }</span>
				</p>
				<p>
					<span>펀딩 마감까지 남은 시간</span>
					<span class="time">
					<!-- 지금시간 가져오기 -->
						<jsp:useBean id="now" class="java.util.Date" />
					<!-- number타입으로 변경(계산을 위해) -->
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					<!-- DATE로 가져와서 NUMBER로 변환 -->
    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    					<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
    					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
					<!-- 남은시간에 따라 일자로 계산될지, 오늘 마감으로 처리할지 등으로 -->
    					<c:choose>
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
    					</c:choose>
					</span>
				</p>
			</div>
			</c:forEach>
		</div>
	</div>
	</Section>
</body>
</html>