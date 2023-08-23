<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<section id="container">
				<form name="updateForm"  method="post" action="replyDelete">
					<input type="hidden" name="csNumber" value="${replyDelete.csNumber}" readonly="readonly"/>
					<input type="hidden" id="replyId" name="replyId" value="${replyDelete.replyId}" />
					<div>
						<p>삭제??</p>
						<button type="submit" class="delete_btn">삭제</button>
						<button type="button" class="cancel_btn">아니용</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</body>
<script >

//취소버튼
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		location.href = "CSboardInfo?csNumber=${replyDelete.csNumber}";
	});
});
	
	
</script>
</html>