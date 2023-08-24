<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li {
		list-style: none;
		float: left;
		padding: 6px;
	}
</style>
</head>
<body>
	<section class="bg-100 py-7" id="packages">
       <div class="container-lg">
         <div class="row justify-content-center">
           <div class="col-12">
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">기업 회원 승인</h1>
           </div>
         </div>
		 <div>
		 		<table>
					<thead>
						<tr>
							<th align="center" width="150">이메일</th>
							<th align="center" width="150">이름</th>
							<th align="center" width="150">회원분류</th>
							<th align="center" width="150">승인 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comMemberList}" var="comMem">
							<tr onclick="location.href='memberInfo?memberEmail=${comMem.memberEmail}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'">
								<td>${comMem.memberEmail}</td>
								<td>${comMem.memberNm}</td>
								<td>${comMem.memberGrd}</td>
								<c:if test="${comMem.memberComaccp eq 'AJ1'}">
									<td>승인 대기</td>
								</c:if>
								<c:if test="${comMem.memberComaccp eq 'AJ3'}">
									<td>승인 거절</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div class="search">
					    <select name="searchType">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="email"<c:out value="${scri.searchType eq 'email' ? 'selected' : ''}"/>>이메일</option>
					      <option value="nm"<c:out value="${scri.searchType eq 'nm' ? 'selected' : ''}"/>>이름</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "comMemberList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					  </div>
				<div>
				  <ul>
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="comMemberList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="comMemberList${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="comMemberList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				</div>
			</div>
       </div>
     </section>
</body>
</html>