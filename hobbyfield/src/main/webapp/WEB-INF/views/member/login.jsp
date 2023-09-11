<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/styles.min.css" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: SUITE-Regular';
}
</style>
<!-- <style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
  }

  .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .wrap {
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    width: 600px;
    padding: 20px;
    text-align: center;
  }

  .logo_wrap span {
    font-size: 24px;
    font-weight: bold;
    color: #333333;
  }

  /* Remove border around input fields */
  .id_input, .pw_iput {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none; /* Remove the border */
    border-radius: 4px;
  }

  .login_button {
    background-color: #007bff;
    color: #ffffff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 20px;
    transition: background-color 0.3s ease-in-out;
  }

  .login_button:hover {
    background-color: #0056b3;
  }

  .login_warn {
    color: #ff0000;
    margin-top: 10px;
  }

  a {
    color: #007bff;
    text-decoration: none;
    display: block;
    margin-top: 10px;
  }

  .p-2 img, #naver_id_login img {
   
    margin-top: 20px;
    border-radius: 4px;
    transition: transform 0.3s ease-in-out;
  }

  .p-2 img:hover , #naver_id_login img:hover{
    transform: scale(1.1);
  }
  
  .logo_wrap > span{
  	font-size : 100px;
  	
  }
  
  .logo_wrap {
  	margin-top : 40px;
  	margin-bottom : 40px;
  }
</style> -->
</head>
<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="./index.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="${pageContext.request.contextPath}/resources/images/logo2.png" width="180" alt="">
                </a>
                <p class="text-center">로그인 페이지입니다</p>
                <form id="login_form" action="${pageContext.request.contextPath}/login" method="post">
                  <div class="mb-3">
                  	<div class="login_wrap">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" class="form-control" name="memberEmail" id="exampleInputEmail1" aria-describedby="emailHelp">
                  	</div>
                  </div>
                  <div class="mb-4">
                  <div class="pw_wrap">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" name="memberPwd" id="exampleInputPassword1">
                  </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="form-check">
                    	<c:if test = "${error ne null}">
							<div class = "login_warn">${exception}</div>
						</c:if>
						<c:if test = "${result == 1}">
							<div class = "login_warn">존재하지 않는 아이디입니다. 회원가입 후 간편 로그인을 진행해 주세요.</div>
						</c:if>
                      <input class="form-check-input primary" type="checkbox" value="" id="flexCheckChecked" checked>
                      <label class="form-check-label text-dark" for="flexCheckChecked">
                        Remeber this Device
                      </label>
                    </div>
                    <a class="text-primary fw-bold" href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
                  </div>
                  <a type="button" id="login_button" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign In</a>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">회원가입을 하시겠습니까?</p>
                    <a class="text-primary fw-bold ms-2" href="${pageContext.request.contextPath}/member/memberJoinSelect">지금 생성할게요!</a>
                  </div>
                  	<br>
                  		<!-- 카카오 로그인 -->
                  		<div style="text-align:center">
						<spring:eval var="key" expression="@property['key.KAKAO']" />
						<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=${key}&redirect_uri=http://localhost/app/member/kakaoLogin&response_type=code">
							<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="width:223px; height:48.22px;">
						</a>
                  		</div>
						<br>
						<div id="naver_id_login" style="text-align:center"><a href="${url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>			
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


		<%-- <div class="wrapper">
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
						<a href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
						<!-- 카카오 로그인 -->
						<spring:eval var="key" expression="@property['key.KAKAO']" />
						<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=${key}&redirect_uri=http://localhost/app/member/kakaoLogin&response_type=code">
							<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="width:223px; height:48.22px;">
						</a>
						<div id="naver_id_login" style="text-align:center"><a href="${url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>			
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
 --%>
<script>
	// 로그인 버튼 클릭
	$("#login_button").click(function(){
		
		// 서버에 로그인 요청
		$("#login_form").submit();
		
	});
	
</script>	
<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>		
</body>
</html>