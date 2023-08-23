<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/profileImg.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>프로필창/이미지 업로드</title>
<style type="text/css">
#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body>
<div class="top" align="center">
	<form name="profileImg" action="profileImg" method="get">
		<div>
			<div class="profileSubject">
				<h1>프로필이미지 업로드</h1>
			</div>
		</div>

		<div class="profileSerction">
			<label>첨부이미지</label>
			<div class="profileSection-title">
				<input type="file" id="fileItem" class="profileImg" name="profileImg" onchange="readURL(this);">
				<img id="preview" style="width: 200px; height: 200px" />
				<div id="uploadResult">
		
					 <!-- <div id="result_card">
						<div class="imgDeleteBtn">x</div>
						<img src="profileView?fileName=anonymous.png">
					 </div> -->
					
				</div>
			</div>
		</div>
		
		<div class="btn_section">
			<button type="reset" class="returnBtn">취소</button>
			<button type="submit" class="btn">등록</button>	
		</div>
		
	</form>
		<div>
			<%-- <label>닉네임 : ${profile[0].profileNickname}</label><br> --%>
			<label>이메일 : ${member.memberEmail}</label><br>
			<label>활동포인트 : ${member.memberActpnt}</label>
		</div>
		
</div>	

<script type="text/javascript">

$("input[type='file']").on("change", function(e){
	
	let formData = new FormData();
	
	let fileInput = $('input[name="profileImg"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	

	//let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	
	for(let i = 0; i < fileList.length; i++){
		formData.append("profileImg", fileObj); //여러개의 파일을 올리려면 obj대신 fileList[i]추가	
	} 
	
	$.ajax({
		url: 'uploadAjax',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result){
    		console.log(result);
    		//showUploadImage(result);
    	},
    	error : function(result){
    		alert("이미지 파일이 아닙니다.");
    	}
	});
	
})

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
	
//이미지 출력
//이미지 미리보기(썸네일 X)
function readURL(input) {
	   if (input.files && input.files[0]) {
	      var reader = new FileReader();
	       reader.onload = function(e) {
	            document.getElementById('preview').src = e.target.result;
	       };
	       reader.readAsDataURL(input.files[0]);
	        } else {
	       document.getElementById('preview').src = "";
	     }
	}
</script>

</body>
</html>