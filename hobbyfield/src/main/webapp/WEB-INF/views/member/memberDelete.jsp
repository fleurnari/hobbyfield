<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	
	  /* Center align buttons */
	  .button-wrap {
	    display: flex;
	    justify-content: center;
	    margin-top: 20px;
	  }
	
	  .button-wrap button {
	    margin: 0 10px;
	  }
	</style>
	</head>
	<body>
	  <section class="bg-100 py-7" id="packages">
	    <form action="memberDelete" method="post" id="deleteForm" name="deleteForm">
	      <div class="container-lg">
	        <div class="row justify-content-center">
	          <div class="col-12">
	            <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">회원 탈퇴</h1>
	          </div>
	        </div>
	        <input type="hidden" id="memberEmail" name="memberEmail" value="${member.memberEmail}">
	        <div>
	          <p>회원 탈퇴를 위해 비밀번호를 입력해 주세요.</p>
	          <div>
	            <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호" />
	          </div>
	          <div>
	            <input type="password" id="memberPwdChk" name="memberPwdChk" placeholder="비밀번호 확인" />
	          </div>
	        </div>
	        <div class="button-wrap">
	          <button type="button" id="memDelete" name="memDelete">회원 탈퇴</button>
	          <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/myPage'">뒤로 가기</button>
	        </div>
	      </div>
	    </form>
	  </section>
   <script>
	$(document).ready(function(){
		
		$("#memDelete").on("click", function(){
			
			if($("#memberPwd").val()==""){
				Swal.fire("비밀번호를 입력해주세요");
				$("#memberPwd").focus();
				return false;
			}
			
			if($("#memberPwdChk").val()==""){
				Swal.fire("비밀번호 확인을 입력해주세요");
				$("memberPwdChk").focus();
				return false;
			}
			
			if ($("#memberPwd").val() !== $("#memberPwdChk").val()) {
				Swal.fire("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				$("#memberPwd").focus();
				 
				return false;
				}
			
			$.ajax({
				url : "memberPwdChk",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						alert("비밀번호를 확인해 주세요.");
						return;
					}else{
						if(confirm("정말 탈퇴 하시겠습니까?")){
							alert("그동안 이용해 주셔서 감사합니다.");
							$("#deleteForm").submit();
						}
						
					}
				}
			})
		});
	})
   </script>
</body>
</html>