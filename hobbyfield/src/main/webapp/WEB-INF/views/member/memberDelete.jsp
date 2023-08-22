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
        </div>
        <button type="button" id="memDelete" name="memDelete">회원 탈퇴</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage'">뒤로 가기</button>
        </form>
   </section>
   <script>
	$(document).ready(function(){
		
		$("#memDelete").on("click", function(){
			
			if($("#memberPwd").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#memberPwd").focus();
				return false;
			}
			
			if($("#memberPwdChk").val()==""){
				alert("비밀번호 확인을 입력해주세요");
				$("memberPwdChk").focus();
				return false;
			}
			
			if ($("#memberPwd").val() !== $("#memberPwdChk").val()) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
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