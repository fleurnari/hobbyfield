<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap{
		width : 800px;
		height : 700px;
		
		background-color :60a2ff;
		border-radius : 20px;
		text-align: center;
		color : black;
		box-shadow: 5px 5px 5px 5px;
	}
	
	.logo_wrap span{
		padding-top : 60px;
	}
	
	.p-2 img{
		margin-top : 100px;
	}
	
	.id_input_box, .pw_input_box{
		padding: 0;
	}
	
	.login_button{
		border-radius : 40px;
		background-color: #FF6A00;
		width : 400px;
		color : black;
		border : none;
	}
	
	.login_button:hover{
		background-color: #005DFF;
	}
</style>
</head>
<body>
		<div class="wrapper">
			<div class="wrap">
					<form id="login_form" action="${pageContext.request.contextPath}/login" method="post">
					<div class="logo_wrap">
						<span>Login</span>
					</div>
					<div class="login_wrap"> 
						<div class="id_wrap">
								<div class="id_input_box">
								<input type="email" class="id_input" id="memberEmail" name="memberEmail" placeholder="EMAIL">
							</div>
						</div>
						<div class="pw_wrap">
							<div class="pw_input_box">
								<input type="password" class="pw_iput" id="memberPwd" name="memberPwd" placeholder="PASSWORD">
							</div>
						</div>
						<c:if test = "${error ne null}">
						<div class = "login_warn">${exception}</div>
						</c:if>
						<c:if test = "${result == 1}">
						<div class = "login_warn">존재하지 않는 아이디입니다. 회원가입 후 간편 로그인을 진행해 주세요.</div>
						</c:if>
						<div class="login_button_wrap">
							<input type="button" class="login_button" value="로그인">
						</div>
						<!-- 카카오 로그인 -->
						<spring:eval var="key" expression="@property['key.KAKAO']" />
						<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=${key}&redirect_uri=http://localhost/app/member/kakaoLogin&response_type=code">
							<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="height:60px">
						</a>			
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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