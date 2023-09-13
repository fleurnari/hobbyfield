<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
	margin-top: 100px;
	font-family: Arial, sans-serif;
}

.container {
	width: 90%;
	margin: 0 auto;
}

h3 {
	margin-top: 0;
	padding-top: 20px; 
	border-top: 1px solid #ccc;
	display: flex;
	align-items: center; 
}

button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

form {
	margin-top: 20px;
}

/* .form-input { */
/* 	margin-bottom: 5px;  */
/* } */

label {
	display: block;
	font-weight: bold;
/* 	margin-bottom: 5px; */
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

	.ck-editor__editable {
		height: 20vh;
	}

</style>
</head>
<body>
	<div class="container">
		<h3>공지사항 수정</h3>
		<form method="post">
			<div class="form-input">
				<label for="noticeCate">카테고리</label> <select id="noticeCate" name="noticeCate" required>
					<option value="" disabled selected>카테고리 선택</option>
					<option value="" disabled selected>카테고리</option>
					<option value="AA1">전체공지</option>
					<option value="AA2">소모임</option>
					<option value="AA3">펀딩</option>
					<option value="AA4">쇼핑몰</option>
					<option value="AA5">포인트상점</option>
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
	
	//editor
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ckeditor/upload'
    	}
    })
    .then(editor => {
    	 editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
    })
    .catch( error => {
        console.error( error );
    });
	
	
        $('form').on('submit', function(e) {
            let objData = serializeObject();
            $.ajax({
                url : 'updateNotice',
                method : 'post',
                data : objData
            })
            .done(data => { 
                if(data.result){
                	Swal.fire(
                			  '공지사항이 수정되었습니다.',
                			  ' ',
                			  'success'
                	).then(()=>{
                        window.location.href = "noticeList";
                      			
                      		})
                } else {
                	Swal.fire(
              			  '공지사항이 수정에 실패했습니다.',
              			  ' ',
              			  'error'
              		).then(()=>{
               		 window.location.href = '${pageContext.request.contextPath}/notice/noticeList';
              			
              		})
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
