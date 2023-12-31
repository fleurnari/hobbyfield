<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style type="text/css">
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
		<form id="clubCommentUpdate" target="parentForm">
		<input type="hidden" id="commentNumber" name="commentNumber" value="${comment.commentNumber}" />
		<div>
			<label for="profileNickname">댓글 작성자 </label>${comment.profileNickname}
			<br>
			<label for="clubCommentContent">댓글 내용</label>
			<textarea rows="1" cols="100" id="editor" name="clubCommentContent">${comment.clubCommentContent}</textarea>
			<br>
			<label for="clubCommentSecret">비밀 댓글</label>
			<input type="checkbox" id="clubCommentSecret" name="clubCommentSecret" value="${comment.clubCommentSecret}">
		</div>
		<div>
			<button type="button" id="commentUpdate" class="btn btn-primary btn-outline btn-lg">댓글 수정</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-primary btn-outline btn-lg" onclick="window.close()">취소</button>&nbsp;&nbsp;
		</div>
	 </form>
	 <script>
	 $(document).ready(function() {
		 
		 var form = document.getElementById("clubCommentUpdate");
		 if (form.clubCommentSecret.value == 'L1') {
			 clubCommentSecret.checked = true;
		 }
		 

			$("#commentUpdate").on("click", function() {
			
				
				var commentNumber = form.commentNumber.value;
				var clubCommentContent = form.clubCommentContent.value;
				var commentSecret = clubCommentSecret.checked ? "L1" : "L2";
				var test =  {
						"clubCommentContent" : clubCommentContent,
						"clubCommentSecret" : commentSecret,
						"commentNumber" : commentNumber
					};
				console.log(test);
				$.ajax({
					url : 'clubCommentUpdate',
					data : {
						"clubCommentContent" : clubCommentContent,
						"clubCommentSecret" : commentSecret,
						"commentNumber" : commentNumber
					},
					type : "post",
					success : function(result) {
						if (result) {
							alert("댓글 수정에 성공 했습니다.");
							opener.parent.location.reload();
							window.close();
						}
					}
				})
				
			});
		});
	 
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