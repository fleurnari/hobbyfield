<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트 조회</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<style type="text/css">
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

li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

</head>
<body>
	<Section>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			<h4>
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
              <span onclick="location.href='#'">카테고리</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/notice/noticeList'">공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'">후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'">프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'">프로젝트 승인</span>
                </c:if>
            </h4>
            </div>
        </div>
	</Section>
	<Section>
	<div class="container">
		<div class="container2">
		<table>
							<tbody>
			<c:forEach items="${fundingPostList }" var="fundingPost">
			<div onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'">
					<figure>
						<img id="img" src="${fundingPost.fndMainImgPath}${fundingPost.fndMainImg }" alt="">
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
					<span><fmt:formatNumber value="${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100 }" pattern="#.##" />
        %</span><span>        조회수: ${fundingPost.fndViews }</span>
				</p>
				<p>
					<span>${fundingPost.fndCurrentAmount }</span>
				</p>
				<p>
					<span>펀딩 마감까지 남은 시간</span>
					<span class="time">
						<jsp:useBean id="now" class="java.util.Date" />
					
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					
    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    					<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
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
					</tbody>
						</table>
			</c:forEach>
			<div class="container">
				<div class="search">
							<select name="searchType">
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"
									<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"
									<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}" />

							<button id="searchBtn" type="button">검색</button>
						</div>
						<div>
							<ul >
								<c:if test="${pageMaker.prev}">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				   				 </c:if> 
				
				    			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    				</c:forEach>
				
				    			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    			</c:if> 
									</ul>
						</div>
		
			</div>
	</div>
	</Section>
<script>
		$(function() {
			$('#searchBtn')
					.click(
							function() {
								self.location = "${pageContext.request.contextPath }/fundingPostList"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
		});
	</script>
</body>
</html>