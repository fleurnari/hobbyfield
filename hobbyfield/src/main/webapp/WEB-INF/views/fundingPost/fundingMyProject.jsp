<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/common.js"></script>
</head>
<body>
<Section>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			<h4>
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
              <span onclick="location.href='#'">카테고리</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" style="color:#5aa5db;">후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'">프로젝트만들기</span>
            </h4>
            </div>
        </div>
        <br><br><br>
			<div class="text-center">
			
			<div>
						<h4><span onclick="location.href='fundingSupportList'">후원현황</span><span> | </span><span style="color:#5aa5db;">내 프로젝트</span></h4>
						<p>프로젝트를 설정해주세요</p>
					</div>
					<br> <br> <br> <br> <br>
					
<div class="row">
	<c:forEach items="${fundingMyProject }" var="fundingMyProject">
	<div class="col-sm-6">
					<figure>
						<img id="img" src="${fundingMyProject.fndMainImgPath}${fundingMyProject.fndMainImg }" alt=""
						onclick="location.href='fundingPostInfo?fndPostNumber=${fundingMyProject.fndPostNumber }'">
					</figure>
				<p>
					<span>${fundingMyProject.fndCategory }</span>
				</p>
				<p>
					<span><h3>프로젝트 이름</h3></span>
					<span>${fundingMyProject.fndTitle }</span>
				</p>
				<br />
				<p>
					<span>${fundingMyProject.fndStatus}</span>
				</p>
				<p>
					<span><fmt:formatNumber value="${(fundingMyProject.fndCurrentAmount / fundingMyProject.fndTargetAmount) * 100 }" pattern="#.##" />
        %</span><span>        조회수: ${fundingMyProject.fndViews }</span>
				</p>
				<p>
					<span>${fundingMyProject.fndCurrentAmount }</span>
				</p>
				<p>
					<span>펀딩 마감까지 남은 시간</span>
				<p>
					<span class="time">
						<jsp:useBean id="now" class="java.util.Date" />
					
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					
    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    					<fmt:parseDate value="${fundingMyProject.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
    					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>

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
	<div class="col-sm-6">
		<div class="mb-3">
			<input type="text" value="${fundingMyProject.fndPostNumber }">
			<button type="button" id="supportListBtn" class="btn btn-primary" onclick="location.href='supportManagement?fndPostNumber=${fundingMyProject.fndPostNumber }'">후원자관리</button>
		</div>
		</div>
			</c:forEach>
	</div>
	</div>

</Section>
</body>
</html>