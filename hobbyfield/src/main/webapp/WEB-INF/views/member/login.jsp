<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="wrapper">
			
			<div class="wrap">
					<form id="login_form" action="login" method="post">
					<div class="logo_wrap">
						<span>로그인</span>
					</div>
					<div class="login_wrap"> 
						<div class="id_wrap">
								<div class="id_input_box">
								<input type="email" class="id_input" id="memberEmail" name="memberEmail" placeholder="이메일">
							</div>
						</div>
						<div class="pw_wrap">
							<div class="pw_input_box">
								<input type="password" class="pw_iput" id="memberPwd" name="memberPwd" placeholder="비밀번호">
							</div>
						</div>
						<c:if test = "${result == 0}">
							<div class = "login_warn">이메일 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
						<c:if test = "${result == 1}">
							<div class = "login_warn">관리자 승인 대기 중인 기업 회원입니다.</div>
						</c:if>
						<c:if test = "${result == 2}">
							<div class = "login_warn">가입 승인이 거부된 기업 회원입니다.</div>
						</c:if>
						<div class="login_button_wrap">
							<input type="button" class="login_button" value="로그인">
						</div>			
					</div>
				</form>
			</div>
		</div>

<script>
	// 로그인 버튼 클릭
	$(".login_button").click(function(){
		
		// 서버에 로그인 요청
		$("#login_form").submit();
		
	});
	
</script>	
		
</body>
</html>