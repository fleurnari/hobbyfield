<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	  max-width: 600px;
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
	
	/* Input styles */
	input[type="password"] {
	  width: 100%;
	  padding: 10px;
	  margin-bottom: 10px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	}
	
	/* Button styles */
	button[type="button"] {
	  display: inline-block;
	  padding: 10px 20px;
	  background-color: #007bff;
	  color: #fff;
	  text-decoration: none;
	  border: none;
	  border-radius: 5px;
	  margin: 10px 5px;
	  cursor: pointer;
	}
	
	/* Button hover effect */
	button[type="button"]:hover {
	  background-color: #0056b3;
	}
	
	/* Alert styles */
	.alert {
	  padding: 10px;
	  margin-bottom: 10px;
	  background-color: #f8d7da;
	  border: 1px solid #f5c6cb;
	  border-radius: 5px;
	  color: #721c24;
	}
	
	/* Button container styles */
	.button-container {
	  display: flex;
	  justify-content: center;
	  margin-top: 20px;
	}
	
	.button-container button {
	  margin: 0 10px;
	}
</style>
<body>
  <section class="bg-100 py-7" id="packages">
    <form action="memberPwdUpdate" method="post" id="pwdUpdateForm" name="pwdUpdateForm">
      <div class="container-lg">
        <div class="row justify-content-center">
          <div class="col-12">
            <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">비밀번호 변경</h1>
          </div>
        </div>
        <input type="hidden" id="memberEmail" name="memberEmail" value="${member.memberEmail}">
        <div>
          <p>변경하실 비밀번호를 입력해 주세요.</p>
          <div>
            <input type="password" id="memberPwd" name="memberPwd" placeholder="현재 비밀번호" />
          </div>
          <div>
            <input type="password" id="newMemberPwd" name="newMemberPwd" placeholder="새 비밀번호" />
          </div>
          <div>
            <input type="password" id="newPwdChk" name="newPwdChk" placeholder="새 비밀번호 확인" />
          </div>				
        </div>
        <div class="button-container">
          <button type="button" id="pwdUpdate" name="pwdUpdate">수정</button>
          <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberUpdate'">뒤로 가기</button>
        </div>
      </div>
    </form>
  </section>
  
  <script>
   $(document).ready(function(){
	    $("#pwdUpdate").on("click", function(){
	        if($("#memberPwd").val() === ""){
	            alert("현재 비밀번호를 입력해주세요");
	            $("#memberPwd").focus();
	            return false;
	        }
	        if($("#newMemberPwd").val() === ""){
	            alert("새 비밀번호를 입력해주세요");
	            $("#newMemberPwd").focus();
	            return false;
	        }
	        if($("#newPwdChk").val() === ""){
	            alert("새 비밀번호를 다시 입력해주세요");
	            $("#newPwdChk").focus();
	            return false;
	        }
	        if ($("#newMemberPwd").val() !== $("#newPwdChk").val()) {
	            alert("새 비밀번호가 일치하지 않습니다.");
	            $("#newPwdChk").focus();
	            return false;
	        }

	        $.ajax({
	            url : "memberPwdChk",
	            type : "POST",
	            dataType : "json",
	            data : $("#pwdUpdateForm").serializeArray(),
	            success: function(data){
	                if(data === 0){
	                    alert("패스워드가 틀렸습니다.");
	                    return;
	                } else {
	                    if(confirm("변경하시겠습니까?")){
	                    	alert("비밀번호 수정이 완료 되었습니다. 다시 로그인 해 주세요.");
	                        $("#pwdUpdateForm").submit();
	                    }
	                }
	            }
	        });
	    });
	});
  </script>
</body>
</html>