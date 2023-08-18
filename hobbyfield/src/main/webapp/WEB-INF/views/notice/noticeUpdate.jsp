<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div>
		<h3>공지사항 수정</h3>
	</div>
	<form action="noticeUpdate" method="post">
		<div class="form-input">
			<label for="noticeCate">카테고리</label>
			<select id="noticeCate" name="noticeCate" required>
				<option value="" disabled selected>카테고리</option>
				<option value="소모임">소모임</option>
				<option value="쇼핑몰">쇼핑몰</option>
				<option value="펀딩">펀딩</option>
				<option value="포인트">포인트상점</option>
				<option value="재능기부">재능기부</option>
			</select>
		</div>

		<div class="form-input">
			<label for="noticeTitle">제목</label>
			<input type="text" id="noticeTitle" name="noticeTitle" value="${noticeInfo.noticeTitle}" required>
		</div>
		<div class="form-input">
			<label for="noticeSubject">내용</label>
			<textarea id="noticeSubject" name="noticeSubject" rows="5" required>${noticeInfo.noticeSubject}</textarea>
		</div>
		<div class="submit-buttons">
			<button class="submit" type="submit">수정</button>
			<button class="submit" type="button" onclick="location.href='noticeList'">취소</button>
		</div>
	</form>
	<script>
		$('form').on('submit', function(e){
			e.preventDefault();
			
			let objData = serializeObject();
			
			$.ajax({
				url : 'noticeUpdate',
				method : 'post',
				data : objData,
				success: function(data) {
					console.log(data);
				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	
		function serializeObject(){
			let formData = $('form').serializeArray();
			
			let formObject = {};
			$.each(formData, function(idx, obj){
				let field = obj.name;
				let val = obj.value;
				
				formObject[field] = val;
			});
			
			return formObject;
		}
	</script>
</body>
</html>
