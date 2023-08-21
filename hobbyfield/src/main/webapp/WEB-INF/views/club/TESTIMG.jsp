<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>

<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div align="center">
		
			<div>
				<h3>게시글 정보</h3>
			</div>

			<div>
				<label>제목</label> <input type="text" name="title">
			</div>

			<div>
				<label>작성자</label> <input type="text" name="writer">
			</div>

			<div>
				<label>첨부이미지</label><input type="file" onchange="readURL(this);">
				<img id="preview" style="width: 200px; height: 200px" />
			</div>
			


			<div class="mb-3" style="width: 50%; margin: 0 auto;">
				<textarea id="editor" name="editor" ></textarea>
			</div>
			
				
			<div>
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</div>

	</div>
	<script type="text/javascript">
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
	
	<script> 
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ajax/upload'
    	}
    })
	 </script>
	
</body>
</html>
</body>
</html>