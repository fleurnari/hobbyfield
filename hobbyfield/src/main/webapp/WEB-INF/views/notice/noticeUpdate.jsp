<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
	margin-top: 150px;
	display: flex;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<h3>공지사항 수정</h3>
		</div>
		<form method="post">
			<div class="form-input">
				<label for="noticeCate">카테고리</label> <select id="noticeCate"
					name="noticeCate" required>
					<option value="" disabled selected>카테고리</option>
					<option value="소모임">소모임</option>
					<option value="쇼핑몰">쇼핑몰</option>
					<option value="펀딩">펀딩</option>
					<option value="포인트">포인트상점</option>
					<option value="재능기부">재능기부</option>
				</select>
			</div>


			<div class="form-input">
				<label for="noticeTitle">제목</label> <input type="text"
					id="noticeTitle" name="noticeTitle"
					value="${noticeInfo.noticeTitle}" required> <label
					for="noticeSubject">내용</label>
				<textarea id="noticeSubject" name="noticeSubject" rows="10" required>${noticeInfo.noticeSubject}</textarea>
        
				<input type="hidden" name="noticeId" value="${noticeInfo.noticeId}">

				<button type="submit">수정완료</button>
				<button type="button"
					onclick="location.href='noticeInfo?noticeId=${noticeInfo.noticeId}'">취소</button>
				<button type="button" onclick="location.href='noticeUpdate'">초기화</button>

			</div>
		</form>
	</div>

	<script>
		$('form').on('submit', function(e) {

			let objData = serializeObject();

			$.ajax({
				url : 'updateNotice',
				method : 'post',
				data : objData
			})
			.done(data => {
		if(data.result){
// 			let message = '수정되었습니다.';
// 			alert(message);
		}else{
// 				alert('수정되지 않았습니다.');
		}
	})
	.fail(reject => console.log(reject));
			return false;
			
		});	
			
		function serializeObject() {
			let formData = $('form').serializeArray();

			let formObject = {};
			$.each(formData, function(idx, obj) {
				let field = obj.name;
				let val = obj.value;

				formObject[field] = val;
			});

			return formObject;
		}
	</script>
</body>
</html>
