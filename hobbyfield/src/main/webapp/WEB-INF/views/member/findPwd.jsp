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
	
	  .card {
	    border: none;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    margin: 50px auto;
	    max-width: 600px;
	    background-color: #ffffff;
	    padding: 20px;
	  }
	
	  .jumbotron {
	    text-align: center;
	  }
	
	  h1, h2 {
	    color: #333333;
	    margin-bottom: 10px;
	  }
	
	  .btn {
	    background-color: #4e73df;
	    border: none;
	    padding: 10px 20px;
	    border-radius: 4px;
	    color: #ffffff;
	    cursor: pointer;
	    margin-top: 20px;
	  }
	
	  .btn-primary:hover {
	    background-color: #375ab3;
	  }
</style>
</head>
<body>
      <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="jumbotron">
  				<h2> 임시 비밀번호가 전송되었습니다. </h2><br/>
  				<h1>${memberEmail}</h1><br/>
  				<h2>를 확인해주세요.</h2>
  <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
  <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/'">메인</button>
		  </div>
	   </div>
</body>
</html>