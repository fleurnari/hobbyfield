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
</head>
<body>
<div align="center" class="profile_top">
	<form action="insertProfile" method="post" id="join_form">
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
		</div>
		
		<div>
			<label>이메일 : ${member.memberEmail}</label><br>
			<input type="hidden" value="${member.memberEmail}" name="memberEmail">
		</div>
		
		<div class="profileSection">
			<label>첨부이미지</label>
			<div class="profileSection-title">
				<input type="file" id="uploadFile" class="profileImg" name="uploadFile">
				<img id="preview" style="width: 200px; height: 200px" />
				<input type="text" id="profileImg" name="profileImg" value="">
				<div id="uploadResult">
		
					 <!-- <div id="result_card">
						<div class="imgDeleteBtn">x</div>
						<img src="profileView?fileName=anonymous.png">
					 </div> -->
					
				</div>
			</div>
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
	//모임생성 버튼(모임생성 기능 작동)
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
		
		/* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
		if(nickCheck&&nickchCheck){
		
        $("#join_form").submit();
			
		}
		
		return false;
	});
});

$("#uploadFile").change(function(e){
	var formData = new FormData();

	var inputFile = $("input[name='uploadFile']");

	var files = inputFile[0].files;

	console.log(files);

	for (var i = 0; i < files.length; i++) {	
		formData.append("uploadFile", files[i]);
	}
		
	$.ajax({
		url : "uploadAjaxFile",
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		success : function(mv) {
			console.log(mv.url + " => url");
			console.log(mv.UUID + " => UUID");
			var inputImgTag = document.getElementById("profileImg");
			var imgTag = document.getElementById("preview");
			inputImgTag.value = mv.url+ mv.UUID;
			imgTag.src = mv.url+ mv.UUID; 
			targetElement.appendChild(imgTag);
			console.log("ajax종료");
		}
	})

});

/*파일은 jpg, png만 업로드 가능, 업로드 파일 최대 사이즈는 1MB */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 용량 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("JPG, PNG 파일만 업로드가능합니다.");
				return false;
			}
			
			return true;		
			
		}
	

//닉네임 중복체크
$('.nick_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트"); */
		
	var profileNickname = $('.nick_input').val();  //.nick_input 입력될값
	var data = {profileNickname : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick_input에 입력되는 값)
	
	$.ajax({
		type : "post",
		url : "nickChk",
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

</script>
</html>