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
				<input id="uploadFile" name="uploadFile" type="file" multiple="multiple">
				<img id="preview"  style="width: 200px; height: 200px;" />
				<input type="text" id="profileImg" name="profileImg" value="">
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

$(document).ready(function() {
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
	
</script>

</body>
</html>