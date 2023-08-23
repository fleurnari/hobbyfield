<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글 상세보기</title>
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
	<div align="center" style="margin-top: 100px;">
		<div>
			<form method="post">
				<!-- 이름, 작성일 이미지  -->
				<div>
				<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
				<img alt="프로필이미지" src="download/img/common.png" style="width: 50px; height: 50px;">
				<input type="text" id="" name="clubBoardWriter" value="${board.clubBoardWriter}">
				<input type="text" id="" name="clubBoardWdate" value="${board.clubBoardWdate}">
				</div>
				<div>
					<textarea >
				</div>
			
			</form>
		</div>
		
	
	
	</div>
	
</body>
</html>