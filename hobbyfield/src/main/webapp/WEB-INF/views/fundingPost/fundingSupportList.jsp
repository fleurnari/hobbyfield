<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
            </div>
            <br>
            <br>
                          <div class="dropdown">
                <span>
                <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                </button>
                <ul class="dropdown-menu" aria-labelledby="categoryDropdown">
                    <c:forEach items="${category}" var="type">
                        <li>
                            <a class="dropdown-item" href="#" data-type-code="${type.literal}">${type.literal}</a>
                        </li>
                    </c:forEach>
                </ul>
                </span>
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/ParticipantsList'">   |  인기</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/endDateList'"> |  마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/notice/noticeList?noticeCate=AA3'"> |  공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'"> |  후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'"> |  프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'"> |  프로젝트 승인</span>
                </c:if>
            </div>
        </div>
        <br>
			<div class="text-center">
					<div>
						<h4><span style="color:#5aa5db;">후원현황</span><span> | </span><span onclick="location.href='fundingMyProject'">내 프로젝트</span></h4>
						<p>프로젝트를 설정해주세요</p>
					</div>
					<br> <br> <br> <br> <br>
					<div class="container">	
								<c:forEach items="${fundingSupportList }" var="fundingSupportList">
						<div class="row">
							<div class="col-sm-6">
							
								<div onclick="location.href='fundingPostInfo?fndPostNumber=${fundingSupportList.fndPostNumber }'">
								
								<figure>
									<img id="img" src="${pageContext.request.contextPath}${fundingSupportList.fndGoodsImgPath }${fundingSupportList.fndGoodsImg }"
									alt="img" style="float: left" width="250px" height="200px">
								</figure>
								
									<p>${fundingSupportList.fndCategory }</p> <br>
									<p>${fundingSupportList.fndTitle }</p><br>
									<p>${fundingSupportList.fndStatus }</p>
									<p>
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
						<hr>
								</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>