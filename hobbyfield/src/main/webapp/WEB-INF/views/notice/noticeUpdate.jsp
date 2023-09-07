<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	margin-top: 150px;
	font-family: Arial, sans-serif; /* 폰트 설정 */
}

.container {
	width: 80%;
	margin: 0 auto;
}

h3 {
	margin-top: 0;
	padding-top: 20px; 
	border-top: 1px solid #ccc;
	display: flex;
	align-items: center; 
}

form {
	margin-top: 20px;
}

.form-input {
	margin-bottom: 20px; 
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-right: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h3>공지사항 수정</h3>
		<form method="post">
			<div class="form-input">
				<label for="noticeCate">카테고리</label> <select id="noticeCate"
					name="noticeCate" required>
					<option value="" disabled selected>카테고리 선택</option>
					<option value="" disabled selected>카테고리</option>
					<option value="AA1">전체공지</option>
					<option value="AA2">소모임</option>
					<option value="AA3">펀딩</option>
					<option value="AA4">쇼핑몰</option>
					<option value="AA5">포인트상점</option>
					<option value="AA6">재능기부</option>
				</select>
			</div>

			<div class="form-input">
				<label for="noticeTitle">제목</label> <input type="text"
					id="noticeTitle" name="noticeTitle"
					value="${noticeInfo.noticeTitle}" required>
			</div>

			<div class="form-input">
				<label for="noticeSubject">내용</label>
				<textarea id="noticeSubject" name="noticeSubject" rows="10" required>${noticeInfo.noticeSubject}</textarea>
			</div>

			<input type="hidden" name="noticeId" value="${noticeInfo.noticeId}">

			<button type="submit">수정완료</button>
			<button type="button" onclick="location.href='noticeList'">취소</button>
			<button type="reset">초기화</button>

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
                   arlert("공지사항이 수정되었습니다.");
                } else {
                	arlert("공지사항이 수정되지 않았습니다.");
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
