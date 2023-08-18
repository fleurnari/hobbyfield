<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<meta charset="UTF-8">
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
				<img id="preview"/>
			</div>
			


			<div class="mb-3" style="width: 50%; margin: 0 auto;">
				<textarea id = "editor4" name = "editor4"></textarea>

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
	<script src = "../resources/ckeditor/ckeditor.js"></script>
	<script src="/resources/ckeditor/ckeditor.js"></script>

	<script> 
		CKEDITOR.replace('ckeditor',{
			filebrowerUploadUrl : "/ckEditorUpload"
		}); // 에디터로 생성
	 </script>
	
</body>
</html>
</body>
</html>