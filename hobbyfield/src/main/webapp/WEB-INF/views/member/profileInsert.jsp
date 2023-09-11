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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
 body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.profile_top {
    max-width: 600px;
    margin: 50px auto;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

/* Typography */
h2 {
    color: #333;
    border-bottom: 2px solid #eee;
    padding-bottom: 10px;
}

/* Links */
a {
    text-decoration: none;
    color: #007BFF;
    margin: 15px 0;
    display: inline-block;
}

a:hover {
    text-decoration: underline;
}


/* Input fields */
input[type="file"] {
    width: 40%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}



/* Labels */
label, .nick_name {
    display: block;
    margin: 15px 0 5px;
}

/* Buttons */
.btn-success {
    padding: 15px 11px;
    margin-bottom : 6px;
    margin-top : 2px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-primary{
	border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}


button:hover {
    background-color: #0056b3;
}

.profileSection {
    margin-top: 20px;
}

#preview {
    width: 100%;
    height: 200px;
    border: 1px dashed #ccc;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}

#preview img {
    max-width: 100%;
    max-height: 100%;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="myPageMenu.jsp"></jsp:include>
	</div>

	<div align="center" class="profile_top">
		<div id="box"></div>
		<div>
			<form action="profileInsert" method="post" id="join_form">
				<div class="profile_info">
					<h3>프로필 정보</h3>
				</div>
				
<!-- 				<div> -->
<%-- 		         <label>이메일  ${member.memberEmail}</label><br> --%>
		         <input type="hidden" value="${member.memberEmail}" name="memberEmail">
<!-- 		      	</div> -->

				<div>
					<div class="input-group mb-3">
						<input type="text" class="nick_input form-control" 
						aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
						name="profileNickname" placeholder="닉네임을 입력 하세요."><br>
					</div>
					<span class="nick_input_re1">사용 가능한 닉네임 입니다.</span> <span
						class="nick_input_re2">닉네임이 이미 존재합니다.</span> <span
						class="final_name_ck">사용할 닉네임을 입력하세요.</span>
					<c:if test="${not empty errorMessage}">
						<div class="error">${errorMessage}</div>
					</c:if>
				</div>

				<div class="profileSection">
					<h3>첨부이미지</h3>
					<div id="preview">
						<img src="noimg.jpg" width="300"
							onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/clubImg.jpg';" />
					</div>
					<input name="uploadFile" type="file" value="profileImg"
						onchange="readURL(this);">
					<button type="button" id="uploadBtn" class="btn btn-success">upload</button>
				</div>

				<div class="join_button_wrap">
					<button type="submit" class="btn btn-primary join_button">등록하기</button>
				</div>

			</form>
		</div>


	</div>
</body>

<script>
	//유효성 검사 통과 유무 변수 
	var nickCheck = false; //닉네임 
	var nickchCheck = false; //닉네임 중복체크
	
	$(document).ready(function(){
	   //프로필 등록 버튼
	   $(".join_button").on("click", function() {
	      
	      //입력값 변수
	      var nick = $('.nick_input').val(); //닉네임 입력란
	      
	      /* 닉네임 유효성검사 */
	      if(nick == ""){
	         $('.final_name_ck').css('display', 'block');
	         nickCheck = false;
	      }else{
	         $('.final_name_ck').css('display', 'none');
	         nickCheck = true;
	      }
	      
// 	      /* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
// 	      if(nickCheck&&nickchCheck){
// 	        $("#join_form").submit();
// 	      }
	      
	      $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/club/profileCount",
	            data: { email: "${member.memberEmail}" },
	            success: function(count) {
	                if(count >= 3) {
	                	swal('등록 실패','프로필은 3개이상 생성 불가합니다','error' );
	                    return false;
	                } else {
	                    // 모든 검사를 통과한 경우 form 제출
	                    if(nickCheck && nickchCheck) {
	                        $("#join_form").submit();
	                    }
	                }
	            }
	        });
	      
	      return false;
	   });
	});


	//닉네임 중복체크
	$('.nick_input').on("propertychange change keyup paste input", function(){
	      /* console.log("keyup 테스트"); */
	      
	   var profileNickname = $('.nick_input').val();  //.nick_input 입력될값
	   var data = {"profileNickname" : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick_input에 입력되는 값)
	   
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