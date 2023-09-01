<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
</head>
<body>
		<!-- 검색창 -->
		<div class="search-div">
		  <input class="search-text" type="text" id="search-text" name="searchText" placeholder="검색어 입력">
		  <img class="search-img" id="search-img" name="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		</div>
	<section>
		<div>
			<!-- 게시글 정보 -->
			<c:forEach items="${board}" var="board">
				<c:forEach items="${comment}" var="comment">
				
					<c:if test="${comment.boardNumber eq board.boardNumber}">
					<!-- 댓글 정보 -->
						<p>${comment.profileNickName}</p>
						<img src="${comment.profile}">
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</section>
	
	
	
	
	
	

<script type="text/javascript">
	

</script>
</body>
</html>