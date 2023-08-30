<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글 상세보기</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
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
				<input type="text" id="clubBoardWriter" name="clubBoardWriter" value="${board.clubBoardWriter}" >
				<input type="text" id="" name="clubBoardWdate" value="${board.clubBoardWdate}">
				</div>
				<div id="editor">
					${board.clubBoardContent}
				</div>
			
			</form>
		</div>
		
		<!-- 댓글 작성용 1.댓글작성, 2. 사진포함 댓글작성 -->
		<div>
			<form>	
				<!-- 댓글 작성시 작성자의 프로필 내용 사용 -->
				<input type="text" id="" name="">
				<input>
				<img alt="" src="">
				<button></button>
			</form>
			
			
		</div>
	</div>
<script>
ClassicEditor
.create( document.querySelector( '#editor' ), {
	 toolbar: []
} )
.then( editor => {
    const toolbarElement = editor.ui.view.toolbar.element;
    editor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
        if ( isReadOnly ) {
            toolbarElement.style.display = 'none';
        } else {
            toolbarElement.style.display = 'flex';
        }
    });
})
.catch( error => {
    console.log( error );
});
   
</script>
	
</body>
</html>