<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS게시글 등록</title>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<form name="insertForm" action="CSboardInsert" method="post">
	<div align="center">
		<div>
			<h3>게시글 정보</h3>
		</div>
		<table>
			<tr>
				<th>제목</th>
				<td><input class="form-control" name="csTitle" ></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="form-control" name="csWriter" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" name="csContents" id=csContents_textarea></textarea></td>
			</tr>
			<tr>
				<th>첨부이미지</th>
				<td><input type="file" id= "fileItem" class="form-control" name="csImgName"></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td><input type="date" class="form-control" name="csDate"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</div>	
	</form>
	<script>
	/* 위지윅 적용 */
	/* 내용 */
	ClassicEditor
	.create(document.querySelector('#csContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
		document.querySelector('form[name="insertForm"]')
				.addEventListener('submit', function(e){
					e.preventDefault();
					
					let csTitle = document.getElementsByName('csTitle')[0];
					let csWriter = document.getElementsByName('csWriter')[0];
					
					if(csTitle.value == ''){
						alert('제목이 입력되지 않았습니다.');
						csTitle.focus();
						return;
					}
					
					if(csWriter.value == ''){
						alert('작성자가 입력되지 않았습니다.');
						csWriter.focus();
						return;
					}
					
					insertForm.submit();
				});
		
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e){
			
			let formData = new FormData();
			
			let fileInput = $('input[name="csImgName"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
			
			for(let i = 0; i < fileList.length; i++){
				formData.append("csImgName", fileList[i]);
			}
			
			$.ajax({
				url: 'uploadAjax',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json'
			});	
			
			
		});
		
		/*파일은 jpg, png만 업로드 가능, 업로드 파일 최대 사이즈는 1MB */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 용량 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("JPG, PNG 파일만 업로드가능합니다.");
				return false;
			}
			
			return true;		
			
		}
		
	</script>
</body>
</html>