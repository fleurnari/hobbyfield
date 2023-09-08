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
	<form id="fndCommentUpdate" target="parentForm">
		<input type="hidden" id="fndCommentNumber" name="fndCommentNumber" value="${comment.fndCommentNumber}" />
		<div>
			<label for="memberEmail">댓글 작성자 </label>${member.memberEmail}
			<br>
			<label for="fndCommentContent">댓글 내용</label><textarea rows="1" cols="100" id="fndCommentContent" name="fndCommentContent">${comment.fndCommentContent}</textarea>
			<br>
			<label for="fndSecret">비밀 댓글</label>
			<input type="checkbox" id="fndSecret" name="fndSecret" value="${comment.fndSecret}">
		</div>
		<div>
			<button type="button" id="commentUpdate" class="btn btn-primary btn-outline btn-lg">수정하기</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-primary btn-outline btn-lg" onclick="window.close()">취소</button>&nbsp;&nbsp;
		</div>
	 </form>
	 <script>

	 $(document).ready(function() {
		 
		 var form = document.getElementById("fndCommentUpdate");
		 if (form.fndSecret.value == 'L1') {
			 fndSecret.checked = true;
		 }
		 

			$("#commentUpdate").on("click", function() {
			
				
				var commentNumber = form.fndCommentNumber.value;
				var fndCommentContent = form.fndCommentContent.value;
				var fndCommentSecretCheckbox = form.fndSecret;
				var commentSecret = fndCommentSecretCheckbox.checked ? "L1" : "L2";
				
				$.ajax({
					url : 'fndCommentUpdate',
					data : {
						"fndCommentContent" : fndCommentContent,
						"fndSecret" : commentSecret,
						"fndCommentNumber" : commentNumber
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
	 
	 
	 </script>
</body>
</html>