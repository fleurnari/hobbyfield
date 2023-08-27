<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	/* 관리자 메뉴 스타일 */
	#adminMenu {
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
		<div id="adminMenu">
			<div class="menu">
				<a href="${pageContext.request.contextPath}/admin/memberList">전체 회원 조회</a>
			</div>
			<div class="menu">
				<a  href="${pageContext.request.contextPath}/admin/comMemberList">기업 회원 승인</a>
			</div>
        </div>

</body>
</html>