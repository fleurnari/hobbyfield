<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
		<form id="clubRecommentInsert" target="parentForm">
		<input type="hidden" id="boardNumber" name="boardNumber" value="${comment.boardNumber}" />
		<input type="hidden" id="commentNumber" name="commentNumber" value="${comment.commentNumber}" />
		<div>
			<label for="profileNickname"> 댓글 작성자 </label><input type="text" id="profileNickname" name="profileNickname" value="${profile.profileNickname}">
			<br>
			<label for="clubCommentContent">댓글 내용</label><textarea rows="1" cols="100" id="clubCommentContent" name="clubCommentContent"></textarea>
			<br>
			<label for="clubCommentSecret">비밀 댓글</label>
			<input type="hidden" id="commentSecret" name="commentSecret">
			<input type="checkbox" id="clubCommentSecret" name="clubCommentSecret">
		</div>
		<div>
			<button type="button" id="recommentInsertBtn" class="btn btn-primary btn-outline btn-lg">작성</button>&nbsp;&nbsp;
			<button type="button" onclick="window.close()" class="btn btn-primary btn-outline btn-lg">취소</button>&nbsp;&nbsp;
		</div>
	 </form>
	 <script>
	 $(document).ready(function() {

			$("#recommentInsertBtn").on("click", function() {
			
				var form = document.getElementById("clubRecommentInsert");
				var commentNumber = form.commentNumber.value;
				var boardNumber = form.boardNumber.value;
				var profileNickname = form.profileNickname.value;
				var clubCommentContent = form.clubCommentContent.value;
				var clubCommentSecretCheckbox = form.clubCommentSecret;
				var commentSecret = clubCommentSecretCheckbox.checked ? "on" : "";
				
				$.ajax({
					url : 'clubRecommentInsert',
					data : {
						"commentNumber" : commentNumber,
						"boardNumber" : boardNumber,
						"profileNickname" : profileNickname,
						"clubCommentContent" : clubCommentContent,
						"clubCommentSecret" : commentSecret
					},
					type : "post",
					success : function(result) {
						if (result == 1) {
							alert("대댓글 등록에 성공 했습니다.");
							window.close();
						}
					}
				})
				
			});
		});
	 </script>
</body>
</html>