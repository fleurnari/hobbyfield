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
	
	/* 기본 스타일 */
	body {
	  font-family: Arial, sans-serif;
	  margin: 0;
	  padding: 0;
	}
	
	.container-lg {
	  max-width: 1200px;
	  margin: 0 auto;
	  padding: 0 15px;
	}
	
	/* 섹션 스타일 */
	.section {
	  padding: 30px 0;
	}
	
	.text-center {
	  text-align: center;
	}
	
	/* 테이블 스타일 */
	table {
	  width: 100%;
	  border-collapse: collapse;
	  margin-top: 20px;
	}
	
	th, td {
	  border: 1px solid #ccc;
	  padding: 10px;
	  text-align: center;
	}
	
	/* 검색 영역 스타일 */
	.search {
	  margin-top: 20px;
	  display: flex;
	  align-items: center;
	}
	
	.search select,
	.search input[type="text"],
	.search button {
	  height: 30px;
	  padding: 0 10px;
	  font-size: 14px;
	}
	
	.search select,
	.search input[type="text"] {
	  border: 1px solid #ccc;
	  border-radius: 5px;
	  margin-right: 10px;
	}
	
	.search button {
	  background-color: #6AAFE6;
	  color: white;
	  border: none;
	  border-radius: 5px;
	  cursor: pointer;
	}
	
	/* 페이지 링크 스타일 */
	ul.pagination {
	  margin-top: 20px;
	  list-style: none;
	  display: flex;
	  justify-content: center;
	}
	
	.pagination li {
	  margin: 0 5px;
	}
	
	.pagination li a {
	  padding: 5px 10px;
	  background-color: #6AAFE6;
	  color: white;
	  text-decoration: none;
	  border-radius: 5px;
	}
	
	.pagination li a:hover {
	  background-color: #578fc6;
	}
	
	/* 박스 스타일 */
	#box {
	  display: flex;
	  justify-content: center;
	  align-items: flex-start;
	}
	
	#box > div {
	  margin-right: 20px;
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
        <div id="box">
         	<div>
         		<jsp:include page="adminPageMenu.jsp"></jsp:include>
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
       </div>
     </section>
</body>
</html>