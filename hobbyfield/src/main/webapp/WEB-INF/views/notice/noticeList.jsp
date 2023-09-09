<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
body {
	margin-top: 150px;
	padding: 0;
	background-color: #ffffff;
}
li {
 list-style: none;
 display: inline-block;
}

.header {
	text-align: center;
	padding: 20px;
	margin-bottom: 50px;
}

.title {
	margin-bottom: 30px;
}

.write-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 5px;
	cursor: pointer;
	float: left;
	margin-left: 23%;
}

.search-bar {
	text-align: right;
	margin-top: 5px;
}

.search-input {
	margin-right: 10px;
}

.search-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 10%;
}

.notice-list {
	width: 50%;
	margin: 0 auto;
	border-collapse: collapse;
}

.notice-list th, .notice-list td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 30px;
	text-align: center;
}

.header .active {
	background-color: blue;
}
</style>
</head>
<body>
	<div class="header">
		<h1 class="title">공지사항</h1>
	<li>
	<button class="category-btn btn btn-info" data-type-code="">전체</button>
	</li>
	<c:forEach items="${cate}" var="type">
 		<li>
 			<button class="category-btn btn btn-info <c:if test="${type.subcode eq noticeVO.noticeCate}">active</c:if>" data-type-code="${type.subcode}">${type.literal}</button>
 		</li>
    </c:forEach>
	<div>
		<c:if test="${member.memberGrd eq 'A3'}">
			<button type="button" onclick="location.href='insertNotice'" class="write-button">등록</button>
		</c:if>
	</div>
	</div>
	<div class="container"> 
		<table class="notice-list">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${noticeList}" varStatus="status">
					<tr onclick="location.href='noticeInfo?noticeId=${notice.noticeId}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'">
						<td>${notice.noticeId}</td>
						<td>${notice.noticeWriter}</td>
						<td>${notice.noticeCate}</td>
						<td>${notice.noticeTitle}</td>
						<td><fmt:parseDate value="${notice.noticeWdate}" pattern="yyyy-MM-dd" var="noticeWdate" /> 
							<fmt:formatDate value="${noticeWdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div class="search">
			<form action="" name="noticeSearchForm">
			    <input type="hidden" name="noticeCate" value="${noticeVO.noticeCate}">
			    <input type="hidden" name="page" value="${scri.page}">
			    
				<select name="searchType">
					<option value="title"<c:out value="${scri.searchType eq 'title' ? 'selected' : ''}"/>>제목</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
				
				<button id="searchBtn" type="button">검색</button>
			</form>

			</div>
			<ul>
				<c:if test="${pageMaker.prev}">
			    	<li><a href="javascript:goPage(${pageMaker.startPage - 1})">이전</a></li>
			    </c:if> 
				
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li><a href="javascript:goPage(${idx})">${idx}</a></li>
			    </c:forEach>
			
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="javascript:goPage(${pageMaker.endPage + 1})">다음</a></li>
			    </c:if> 
			</ul>
	</div>
	<script type="text/javascript">
	
	function goPage(p){
		noticeSearchForm.page.value = p;
		noticeSearchForm.submit()
	}
	$(function(){
		
		$('#searchBtn').click(function(){
			//self.location = "noticeList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("[name=searchType]").val() + "&keyword=" +encodeURIComponent($('#keywordInput').val());
			noticeSearchForm.submit()
		});
	});
	
	
	//카테고리별 정렬
	$('.category-btn').on('click',  function(e) {
			
			const noticeCate = $(this).data('type-code');
			location.href = "noticeList?noticeCate="+noticeCate
	});
	
	//게시글 행 클릭시 상세보기 페이지 이동
	document.addEventListener("DOMContentLoaded", function() {
		var noticeRows = document.querySelectorAll(".notice-list tr[data-notice-id]");

		noticeRows.forEach(function(row) {
			row.addEventListener("click", function() {
				var noticeId = row.getAttribute("data-notice-id");
				if (noticeId) {
					location.href = "noticeInfo?noticeId=" + noticeId;
				}
			});
		});
	});
		
		
	</script>
</body>
</html>
