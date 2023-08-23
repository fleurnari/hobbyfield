<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>프로필 유저정보</title>
</head>
<body>
<div>
	<form>
		<div align="center">
			<label>닉네임 : ${getNomalMypage.profileNickname }</label>
		</div>
		<div>
			<p3>첨부이미지</p3>
			<div class="updateProfile_img">
				<input type="file" id="fileItem" name="profileImg" class="profileImg" onchange="readURL(this);">
				<img id="preview" style="width: 200px; height: 200px" />
			</div>
		</div>
		
		<button type="submit">수정</button>
	</form>
</div>
	
<script>

$("input[type='file']").on("change", function(e){
	
	let formData = new FormData();
	
	let fileInput = $('input[name="profileImg"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	
	for(let i = 0; i < fileList.length; i++){
		formData.append("profileImg", fileObj); //여러개의 파일을 올리려면 obj대신 fileList[i]추가	
	} 
	
	$.ajax({
		url: 'uploadAjaxFile',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
//     	success : function(result){
//     		console.log(result);
//     		//showUploadImage(result);
//     	},
//     	error : function(result){
//     		alert("이미지 파일이 아닙니다.");
//     	}
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
	
	
let msg = `${result}`;
if(msg != null && msg != '') alert(msg);


//form이 가지는 data를 모아놓을수 있는 방법만 알면 자바스크립트로도 작성이 가능하다.
//선택자를 기반으로해서 태그정보를 가져온 형태의 자바스크립트
/* let inputList = document.querySelectorAll('form input');

let formObj = {};
inputList.forEach(tag => {
	formObj[tag.name] = tag.value;
	});

	console.log(formObj); */
	
//제이쿼리
$('form').on('submit', ajaxDeptUpdate);
	
	function ajaxDeptUpdate(event){
		event.preventDefault();
		
		let obj = serializeObject();
		
		$.ajax({
			url : 'updateProfile',  //contenttype이 제이슨이 아니면 작동안한다. text로 보낼거면 텍스트로 
			type : 'post',
			contentType : 'application/json', //content ~ data (obj) json타입은 항상 세트다.
			data : JSON.stringify(obj)
		})
		.done( data => {
			if(data != null && data['결과'] == 'Success'){
				alert(`수정됐습니다.\n부서번호 : ${data['닉네임']}`);	
			}else{
				alert('수정되지 않았습니다.');
			}
		})
		.fail( reject => console.log(reject));
	};
	//serialize , serializeArray를 언제 사용하는지 알아야 한다.
	function serializeObject() {
		let formData = $('form').serializeArray();
		
		let formObj = {};
		$.each(formData, function(idx, obj) {
			formObj[obj.name] = obj.value;
		});
		
		return formObj;
	}
	
</script>
</body>
</html>