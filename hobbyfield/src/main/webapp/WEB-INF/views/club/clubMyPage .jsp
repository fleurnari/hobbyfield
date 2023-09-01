<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/"></script>
</head>
<body>
	<section>
		<div id="my-profile">
			<h3>내 프로필</h3>
			<c:forEach items="${profile}" var="profile">
				<div class="profile-css">
					<img src="">
				</div>
			</c:forEach>
			<!-- 내 정보 간략하게. -->
			<div>
				<div>
				<label>내정보</label>
				</div>
			</div>
		</div>
	
		<div id="my-board">
			<h3>내 게시글</h3>
			<c:forEach items="${board}" var="board">
				<div class="board-css">
					
				</div>
			</c:forEach>
		</div>
	
		<div id="my-comment">
			<h3>내 댓글</h3>
			<c:forEach items="${comment}" var="comment">
				<div class="comment-css">
				</div>
			</c:forEach>
		</div>
		
		<div id="my-apply">
			<h3>내 가입신청</h3>
			<c:forEach items="${apply}" var="apply">
				<div class="apply-css">
					
				</div>
			</c:forEach>
		</div>
	</section>
	
	<aside>
		<div class="btn-group-vertical">
  			<button type="button">내 정보</button>
  			<button type="button">내가 쓴 글</button>
  			<button type="button">내가 쓴 댓글</button>
  			<button type="button">좋아요</button>
		</div>
	</aside>
	
</body>
</html>