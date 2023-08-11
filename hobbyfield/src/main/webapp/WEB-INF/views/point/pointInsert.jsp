<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.insertForm {
	margin-top: 150px;
}

.pointItemType {
	width: 300px;
}
</style>
</head>
<body>
	<form action="pointInsert" class="insertForm" method="post">
		<div>
			<h3>포인트상품등록</h3>
		</div>
		<div class="pointItemType">
			<h5>상품유형</h5>
			<select class="form-control" id="pointItemType" name="pointItemType">
				<option selected disabled>상품유형</option>
				<option value="clubCapacity">소모임 증원권</option>
				<option value="emoji">이모티콘</option>
			</select>
		</div>

		<div>
			<h5>상품이름</h5>
			<input type="text" id="pointName" name="title" required="required"
				placeholder="상품이름을 입력하세요.">
		</div>
		<div>
			<h5>상품가격</h5>
			<input type="number" id="pointPrice" name="pointPrice"
				required="required">
		</div>
		<div>
			<h5>내용</h5>
			<textarea name="content" id="pointContent" name="pointContent"
				required="required" placeholder="내용을 입력하세요."></textarea>
		</div>

		<div>
		<h5>이미지 첨부</h5>
			<input name="uploadFiles" type="file" multiple>
		</div>
		<div>
			<h5>상품등록일</h5>
		</div>
		<div>
			<h5>상품판매 마감일</h5>
			<input type="date" id="pointEndterm" name="pointEndterm"
				required="required">
		</div>
		<button type="submit">등록</button>
		<button type="button" onclick="location.href='poinList'">목록</button>
		<button type="reset" onclick="location.href='pointInsert'">취소</button>
	</form>
	<script>
	document.getElementById('pointRegdate').valueAsDate = new Date();
	document.querySelector('form.insertForm').addEventListener('submit', function(e) {
		e.preventDefault();

		let pointName = document.querySelector('input[name="title"]');
		let pointPrice = document.querySelector('input[name="pointPrice"]');
		let pointContent = document.querySelector('textarea[name="pointContent"]');
		let pointRegdate = document.querySelector('input[name="pointRegdate"]');
		let pointEndterm = document.querySelector('input[name="pointEndterm"]');
		let pointImgName = document.querySelector('input[name="pointImgName"]');
		let pointImgPath = document.querySelector('input[name="pointImgPath"]');
					
		      		let list = [];
		      		let today = new Date();
		      		let year = today.getFullYear(); 
		      		let month = today.getMonth() + 1
		      		console.log(today);

					if (pointName.value == '') {
						alert('상품이름을 입력하세요.');
						pointName.focus();
						return;
					}
					if (pointPrice.value == '') {
						alert('상품가격을 입력하세요.');
						pointPrice.focus();
						return;
					}
					if (pointContent.value == '') {
						alert('내용을 입력하세요.');
						pointContent.focus();
						return;
					}
					if (pointImgName.value == '') {
						alert('이미지를 등록하세요.');
						pointImgName.focus();
						return;
					}
					if (pointImgPath.value == '') {
						alert('이미지 경로를 입력하세요.');
						pointImgPath.focus();
						return;
					}
						
					this.submit();		
				}
		document.querySelector('.uploadBtn')
		.addEventListener('click',function(e){
			let formData = new FormData();
			
			let inputTag = document.querySelector('input[name="uploadFiles"]');
			
			let files = inputTag.files;
			
			for(let i=0; i < files.length; i++){
				console.log(files[i]);
				formData.append("uploadFiles", files[i]);
			}
			
			fetch('uploadsAjax',{ //formdata를 기반으로 보낼때 주로 사용
				method : 'post',
				body : formData
			})
			.then(response => response.json())
			.then(data => console.log(data))
			.catch(err => console.log(err));
			
		//jQuery.ajax
	         $.ajax({
	             url: 'uploadsAjax',	
	             type: 'POST',
	             processData: false,	// 기본값은 true, ajax 통신을 통해 데이터를 전송할 때, 기본적으로 key와 value값을 Query String으로 변환해서 보냅니다.
	             contentType: false,	// multipart/form-data타입을 사용하기위해 false 로 지정합니다.
	             data: formData,               
	             success: function(result){
	                 for(let images of result){
	                	 let path = '${pagecontext.request.contextPath}/images/'+result;
	                	 let imgTag = $('img').prop('src','path');
	                	 $('div').append(imgTag);
	                 }
	             },
	             error: function(reject){	
                  console.log(reject);
           		}
	</script>
</body>
</html>
