<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>



<style>
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}
.ck-editor__editable {
	height: 80vh;
}
</style>
</head>
<body>
	<br><br>
	<div align="center">
		<form name="insertForm" action="clubBoardInsert" method="post" enctype="multipart/form-data">
			<div>
				<h3>게시글 정보</h3>
			</div>
			
			<div>
			<label>제목</label> 
			<input type="text" name="title"> 
			</div>
			
			<div>
			<label>작성자</label>
			<input type="text" name="writer"> 
			</div>
			
			<div>
			<textarea id="editor" name="contents"></textarea>
			</div>
			
			<div>
			<label>첨부이미지</label>
			<input type="file" onchange="readURL(this);">
			<img id="preview" style="width: 200px; height: 200px" />
			</div>
			
			<div>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
			</div>
		</form>
	</div>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>	
	<script>
	
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ajax/upload'
    	}
    })
    .catch( error => {
        console.error( error );
    } );
	
	document.querySelector('form[name="insertForm"]')
 	.addEventListener('submit', function(e){
 		e.preventDefault();
 		
 		let title = document.getElementsByName('title')[0];
 		let writer = document.getElementsByName('writer')[0];
 		
 		if (title.value == '') {
 			alert("제목을 입력해 주세요.");
 			title.focus();
 			return;
 		}
 		
 		if (content.value == '') {
 			alert("작성자를 입력해 주세요.");
 			writer.focus();
 			return;
 		}
 		
 		insertForm.submit();
 		
 	});
	
	
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