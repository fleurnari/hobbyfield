<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>	

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
			<label for="noticeCate">카테고리</label> 
			<select id="noticeCate" name="noticeCate" required>
				<option id="" disabled selected>카테고리</option>
				<option id="AA1" value="사이트전체공지">사이트전체공지</option>
				<option id="AA2" value="소모임">소모임</option>
				<option id="AA3" value="펀딩">펀딩</option>
				<option id="AA4" value="쇼핑몰">쇼핑몰</option>
				<option id="AA5" value="재능기부">재능기부</option>
				<option id="AA6" value="포인트">포인트</option>
			</select>

		</div>		
		<div class="form-input">
			<div>
			<div>
				<label for="noticeWriter">작성자</label><input type="text"
					id="noticeWriter" name="noticeWriter" value="admin" readonly>
			</div>
			<div>	
				<label for="noticeTitle">제목</label> <input type="text"
					id="noticeTitle" name="noticeTitle" required> 
			</div>		
			<div>
				<label for="noticeSubject">내용</label>
				<textarea id="editor" name="noticeSubject"
				cols="40" rows="5" placeholder="내용을 입력하세요."></textarea>
			</div>

			</div>
			<div class="submit-buttons">
				<button class="submit" type="submit" onclick="location.href='InsertNotice'">등록</button>
				<button class="submit" type="button" onclick="location.href='noticeList'">초기화</button>
				<button type="button" onclick="location.href='noticeList'">목록</button>
			</div>
		</div>
	</form>
<script>
//editor
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ckeditor/upload'
    	}
    })
    .then(editor => {
        // 에디터 인스턴스가 생성되면 호출되는 콜백 함수
        editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
    })
    .catch( error => {
        console.error( error );
    });
</script>
</body>
</html>

















