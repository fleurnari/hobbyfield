<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수락 페이지</title>
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
                <span onclick="location.href='${pageContext.request.contextPath}/noticeList'">공지사항</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" style="color:#5aa5db;">후원현황</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'">프로젝트만들기</span>
                <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'">프로젝트 승인</span>
                </c:if>
            </h4>
        </div>
    </div>
    <br><br><br>
    <div class="text-center">
    	<table class="table table-condensed">
    		<thead>
    			<tr class="active">
    				<th>카테고리</th>
    				<th>프로젝트 제목</th>
    				<th>판매자 ID</th>
    				<th>프로젝트 등록일</th>
    				<th>프로젝트 시작일 </th>
    				<th>프로젝트 종료일</th>
    				<th>프로젝트 목표금액</th>
    				<th>프로젝트 상태</th>
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${fundingPostList }" var="fundingPost">
    				<form onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'" name="" action="" method="post">
    					<tr>
    						<td>${fundingPost.fndCategory }</td>
    						<td>${fundingPost.fndTitle }</td>
    						<td>${fundingPost.memberEamil }</td>
    						<td>${fundingPost.fndWdate }</td>
    						<td>${fundingPost.fndStartDate }</td>
    						<td>${fundingPost.fndEndDate }</td>
    						<td>${fundingPost.fndTargetAmount }</td>
    						<td><button type="button" class="btn btn-primary">${fundingPost.fndStatus }</button></td>
    					</tr>
    				</form>
    					<button type="submit" class="btn btn-primary"></button>
    			</c:forEach>
    		</tbody>
    	</table>
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