<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	/* 기본 스타일 */
	body {
	  font-family: Arial, sans-serif;
	  margin: 0;
	  padding: 0;
	}
	
	/* 마이 페이지 메뉴 스타일 */
	#myPageMenu {
	  width: 200px;
	  padding-left: 50px;
	  padding-right: 0px;
	  float: left;
	  background-color: #f5f5f5;
	}
	
	.menu {
	  height: 50px;
	  line-height: 50px;
	  padding: 0 10px;
	  border-bottom: 1px solid #ccc;
	}
	
	.menu a {
	  display: block;
	  color: #333;
	  text-decoration: none;
	}
	
	.menu a:hover {
	  background-color: #6AAFE6;
	  color: white;
	}
	
	/* 클리어픽스 스타일 */
	.clearfix::after {
	  content: "";
	  display: table;
	  clear: both;
	}

</style>
</head>
<body>
		<c:if test="${member.memberGrd eq 'A1'}">
			<div id="myPageMenu">
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/selectJoinClub">나의 소모임</a>
				</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/club/profileList">나의 프로필</a>
				</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/selectMyClubBoard">내가 쓴 글</a>
				</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/selectMyClubComment">내가 쓴 댓글</a>
				</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/selectMyClubLike">나의 좋아요</a>
				</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/myitemList">나의 아이템</a>
				</div>

		    </div>
		</c:if>
		
		<c:if test="${member.memberGrd eq 'A2'}">
			<div id="myPageMenu">
				<div class="menu">
					<a href="${pageContext.request.contextPath}/member/selectSellList">판매 중인 상품</a>
				</div>
			</div>			
		</c:if>


</body>
</html>