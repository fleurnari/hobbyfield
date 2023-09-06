<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<title>프로필 등록</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<div align="center" class="profile_top">

	<div>
		<a href="${pageContext.request.contextPath}/club/profileList">프로필 조회</a>
	</div><br>

   <form action="profileInsert" method="post" id="join_form">
      <div class="profile_info">
         <h2>프로필 정보</h2><br>
      </div>
      
      <div>
         <div>
            <label class="nick_name">닉네임</label>
            <input type="text" class="nick_input" name="profileNickname"><br>
         </div>
         <span class="nick_input_re1">사용 가능한 닉네임 입니다.</span>
         <span class="nick_input_re2">닉네임이 이미 존재합니다.</span>
         <span class="final_name_ck">사용할 닉네임을 입력하세요.</span>
         <c:if test="${not empty errorMessage}">
	     <div class="error">${errorMessage}</div>
		 </c:if>
         
      </div>
      
      <div>
         <label>이메일 : ${member.memberEmail}</label><br>
         <input type="hidden" value="${member.memberEmail}" name="memberEmail">
      </div>
      
      <div class="profileSection">
         <label>첨부이미지</label>
         <div id="preview"></div>
			<input name="uploadFile" type="file" value="profileImg" onchange="readURL(this);">
			<button type="button" id="uploadBtn">upload</button>
      </div>
      
      <div class="join_button_wrap">
         <button type="submit" class="join_button">등록하기</button>
      </div>
      
   </form>

</div>
</body>

<script>
	//유효성 검사 통과 유무 변수 
	var nickCheck = false; //닉네임 
	var nickchCheck = false; //닉네임 중복체크
	
	$(document).ready(function(){
	   


	//닉네임 중복체크
	$('.nick_input').on("propertychange change keyup paste input", function(){
	      /* console.log("keyup 테스트"); */
	      
	   var profileNickname = $('.nick_input').val();  //.nick_input 입력될값
	   var data = {profileNickname : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick_input에 입력되는 값)
	   
	   $.ajax({
	      type : "post",
	      url : "${pageContext.request.contextPath}/club/nickChk",
	      data : data,
	      success : function(result) {
	         /* console.log("성공" + result); */
	         if(result != 'fail'){
	            $('.nick_input_re1').css("display", "inline-block");
	            $('.nick_input_re2').css("display", "none");
	            nickchCheck = true;
	         }else{
	            $('.nick_input_re2').css("display", "inline-block");
	            $('.nick_input_re1').css("display", "none");
	            nickchCheck = false;
	         }
	      }// success 종료
	   }); // ajax 종료
	}); // function 종료
	
	/* 이미지 업로드 */
	function imgUploadHandler(list) {
				for (i = 0; i < list.length; i++) {
					let tag = `<input type="hidden" name="profileImg" value="\${list[i].UUID}">
					           <input type="hidden" name="profileImgPath" value="\${list[i].url}">`
					$('#join_form').append(tag);
				}
			}
   
	


</script>
</html>