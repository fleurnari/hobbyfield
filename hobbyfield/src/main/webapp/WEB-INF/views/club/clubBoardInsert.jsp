<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

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
		<form name="insertForm" action="clubBoardInsert" method="post" >
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
			<input type="file" name="image">
			</div>
			
			<div>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
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
	</script>
</body>
</html>