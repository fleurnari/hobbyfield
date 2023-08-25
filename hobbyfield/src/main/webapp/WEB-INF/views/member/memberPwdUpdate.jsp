<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
        </div>
        <button type="button" id="pwdUpdate" name="pwdUpdate">수정</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberUpdate'">뒤로 가기</button>
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