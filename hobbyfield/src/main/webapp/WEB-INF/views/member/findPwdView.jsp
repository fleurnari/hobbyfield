<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fc;
  }

  .p-5 {
    margin: 50px auto;
    max-width: 400px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
  }

  .text-center {
    margin-bottom: 20px;
  }

  .h4 {
    font-size: 1.5rem;
    color: #333333;
  }

  .mb-2 {
    margin-bottom: 10px;
  }

  .mb-4 {
    margin-bottom: 20px;
  }

  .form-control {
    padding: 12px;
    border: 1px solid #d1d3e2;
    border-radius: 4px;
    width: 100%;
    margin-bottom: 20px;
  }

  .btn-primary {
    background-color: #4e73df;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    color: #ffffff;
    cursor: pointer;
  }

  .btn-primary:hover {
    background-color: #375ab3;
  }

  .btn-google {
    background-color: #ea4335;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    color: #ffffff;
    text-align: center;
    cursor: pointer;
  }

  .btn-google:hover {
    background-color: #d02818;
  }
</style>
</head>
<body>
	<script type="text/javascript">
	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
</script>
	<div class="p-5">
		<div class="text-center">
			<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
			<p class="mb-4">아이디와 이메일을 입력해주세요!</p>
		</div>
		<form class="user" action="${pageContext.request.contextPath}/member/findPwd" method="post">
			<div class="form-group">
				<input type="email" class="form-control form-control-user"
					id="memberEmail" aria-describedby="emailHelp" name="memberEmail"
					placeholder="이메일을 입력해 주세요.">
			</div>
			<div class="form-group">
				<input type="text" class="form-control form-control-user"
					id="memberNm" aria-describedby="IdHelp" name="memberNm"
					placeholder="이름을 입력해 주세요.">
			</div>
			<button type="submit" class="btn btn-primary btn-user btn-block">
				비밀번호 찾기</button>
		</form>
		<hr>
		<a href="${pageContext.request.contextPath}/member/login" class="btn btn-google btn-user btn-block">
			Login </a>
	</div>
</body>
</html>