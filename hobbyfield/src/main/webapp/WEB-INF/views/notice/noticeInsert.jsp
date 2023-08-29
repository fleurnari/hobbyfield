<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin-top: 150px;
	font-family: Arial, sans-serif;
}

.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: #f0f0f0;
	padding: 10px 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	z-index: 100;
}

.form-input {
	margin-bottom: 15px;
}

.form-input label {
	display: block;
	margin-bottom: 5px;
}

.form-input select, .form-input input, .form-input textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.submit-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.submit-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 8px 15px;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<h3>공지사항 등록</h3>
	</div>
	<form action="insertNotice" method="post">
		<div class="form-input">
			<label for="noticeCate">카테고리</label> <select id="noticeCate"
				name="noticeCate" required>
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
			<div>
				<label for="noticeWriter">작성자</label><input type="text"
					id="noticeWriter" name="noticeWriter" value="admin" readonly>
				<label for="noticeTitle">제목</label> <input type="text"
					id="noticeTitle" name="noticeTitle" required> <label
					for="noticeSubject">내용</label>
				<textarea id="noticeSubject" name="noticeSubject" rows="5" required></textarea>


			</div>
			<div class="submit-buttons">
				<button class="submit" type="submit" onclick="location.href='InsertNotice'">등록</button>
				<button class="submit" type="button" onclick="location.href='noticeList'">초기화</button>
				<button type="button" onclick="location.href='noticeList'">목록</button>
			</div>
		</div>
	</form>
</body>
</html>

















