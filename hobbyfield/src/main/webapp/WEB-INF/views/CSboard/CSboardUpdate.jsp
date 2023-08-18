<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS게시글 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
</head>
<body>
	<div align="center">
	<form name="updateForm" method="post">
		<table>
				<tr>
					<th>번호</th>
					<td><input type="hidden" class="form-control" name="csNumber" value="${CSboardInfo.csNumber }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control" name="csTitle" value="${CSboardInfo.csTitle}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" class="form-control" name="csWriter" value="${CSboardInfo.csWriter}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="csContents" class="form-control" id=csContents_textarea>${CSboardInfo.csContents}</textarea></td>
				</tr>
				<tr>
					<th>첨부이미지</th>
					<td><input type="file" name="csImgName" class="form-control" value="${CSboardInfo.csImgName}"></td>
				</tr>
				<tr>
					<th>수정일자</th>
					<td><input type="date" class="form-control" name="csUpdate" 
						value='<fmt:formatDate value="${CSboardInfo.csUpdate}" pattern="yyyy-MM-dd" />'></td>
				</tr>
			</table>
			<div>
				<button type="submit" class="update_btn">수정하기</button>
				<button type="submit" class="cancel_btn">목록으로</button>
			</div>
		</form> 
	</div>
	<script>
		ClassicEditor
		.create(document.querySelector('#csContents_textarea'))
		.catch(error=>{
			console.error(error);
		});
	</script>
	<script>
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "CSboardList";
		})
	})
	
	$(".update_btn").on("click", function(){
			formObj.prop("action", "CSboardUpdate");
			formObj.prop("method", "get");
			formObj.submit();				
	})
		
	</script>
</body>
</html>