<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Reset some default styling */
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}
	
	/* Body styles */
	body {
	  font-family: Arial, sans-serif;
	  background-color: #f0f0f0;
	}
	
	/* Container styles */
	.container-lg {
	  max-width: 1200px;
	  margin: 0 auto;
	  padding: 20px;
	  background-color: #fff;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	/* Heading styles */
	h1 {
	  font-size: 2.5rem;
	  margin-bottom: 20px;
	  color: #333;
	  text-align: center;
	}
	
	/* Profile info styles */
	.profile-info {
	  margin: 10px 0;
	  padding: 10px;
	  background-color: #f8f9fa;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	}
	
	.profile-info label {
	  font-weight: bold;
	}
	
	.profile-info span {
	  color: #007bff;
	  font-weight: bold;
	}
	
	/* Button styles */
	.btn {
	  display: inline-block;
	  padding: 10px 20px;
	  background-color: #007bff;
	  color: #fff;
	  text-decoration: none;
	  border: none;
	  border-radius: 5px;
	  margin: 5px;
	  cursor: pointer;
	}
	
	/* Button hover effect */
	.btn:hover {
	  background-color: #0056b3;
	}
	
	/* Links styles */
	a {
	  color: #007bff;
	  text-decoration: none;
	}
	
	a:hover {
	  text-decoration: underline;
	}
	
	/* Button container styles */
	.button-container {
	  display: flex;
	  justify-content: center;
	  margin-top: 20px;
	}
	
	.button-container > div {
	  margin: 0 5px;
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
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">마이페이지</h1>
            </div>
          </div>
          <div id="box">
         	<div>
         		<jsp:include page="myPageMenu.jsp"></jsp:include>
         	</div>
			<div>
				<div>
				<div class="profile-info">
					<label for="memberEmail">아이디</label>
					<span>${info.memberEmail}</span>
				</div>
				<div class="profile-info">
					<label for="memberNm">이름</label>
					<span>${info.memberNm}</span>
				</div>
				<div class="profile-info">
					<label for="memberGrd">회원 분류 </label>
					<c:if test="${info.memberGrd eq 'A1'}">
						<span>일반 회원</span>
					</c:if>
					<c:if test="${info.memberGrd eq 'A2'}">
						<span>기업 회원</span>
					</c:if>
					<c:if test="${info.memberGrd eq 'A3'}">
						<span>관리자</span>
					</c:if>
				</div>
				<div class="profile-info">
					<label for="memberActpnt">활동포인트</label>
					<span><fmt:formatNumber value="${info.memberActpnt}" pattern="#,###" /></span>
				</div>
				<div class="profile-info">
					<label for="memberLtstconn">최근 접속일</label>
					<span><fmt:formatDate value="${member.memberLtstconn}" pattern="yyyy-MM-dd" /></span>
				</div>				
				<div class="button-container">
				  <div class="ms-lg-5">
				    <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberUpdate">회원 정보 수정</a>
				  </div>
				  <div class="ms-lg-5">
				    <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberDelete">회원 탈퇴</a>
				  </div>
				</div>
			</div>
        </div>
       </div>
      </div>
      </section>
</body>
</html>