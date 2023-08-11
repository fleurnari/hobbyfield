<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div align="center">
		<form name="insertForm" action="clubBoardInsert" method="post">
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
				<label>첨부이미지</label> <input type="file" onchange="readURL(this);"> 
<img id="preview" />
			</div>

			<div>
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</div>
		</form>
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
</body>
</html>
</body>
</html>