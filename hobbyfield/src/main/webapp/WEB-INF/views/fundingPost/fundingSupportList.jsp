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
		<div class="container">
			<div class="text-center">

					<div>
						<h3>후원현황</h3>
						<p>프로젝트를 설정해주세요</p>
					</div>
					<br> <br> <br> <br> <br>
					<div class="container">	
								<c:forEach items="${fundingSupportList }" var="fundingSupportList">
						<div class="row">
							<div class="col-sm-6">
							
								<div onclick="location.href='fundingPostInfo?fndPostNumber=${fundingSupportList.fndPostNumber }'">
								
								<figure>
									<img id="img" src="${fundingSupportList.fndGoodsImgPath }${fundingSupportList.fndGoodsImg }"
									alt="img" style="float: left" width="250px" height="200px">
								</figure>
								
									<p>${fundingSupportList.fndCategory }</p> <br>
									<p>${fundingSupportList.fndTitle }</p><br>
									<p>${fundingSupportList.fndStatus }</p>
									<p>
									<span>000%</span>
									<span class="time">
										<jsp:useBean id="now" class="java.util.Date" />
					
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					
    									<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    									<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    									<fmt:parseDate value="${fundingSupportList.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
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
								</div>
							<div class="col-sm-6">
								<div class="input-group mb-3">
									<div>
									<Span>후원 물품 이름: </Span><span>${fundingSupportList.fndGoodsName }</span><br>
									<Span>후원 물품 가격: </Span><span>${fundingSupportList.fndGoodsPrice }</span><a>원</a><br>
									<span>후원 물품 총 수량: </span><span>${fundingSupportList.fndOrderAmount }</span><a>개</a><br>
									<span>후원 물품 총 가격: </span><span>${fundingSupportList.fndTotalPrice }</span><a>원</a><br>
									<span>배송 시작일: </span><span>${fundingSupportList.fndShipdt }</span><br>
									<span>운송장 번호: </span><span>${fundingSupportList.fndInvoice }</span><br>
									</div>
								</div>
							</div>
						</div>
					
								</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>