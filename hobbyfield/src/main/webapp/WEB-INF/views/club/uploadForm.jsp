<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload test</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<br>
		<br>
		<div>
			<p>테스트</p>
		</div>
		<div>
			<input type="file" name="uploadFile" multiple="multiple" onchange="readURL(this);">
			<img id="preview" />
			<button id="uploadBtn">upload</button>
		</div>
	</div>

	<script type="text/javascript">
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName){
			alert("해당 종류의 파일은 업로드 불가");
			return false;
		}
		return true;	
	}		
	
	
		$(document).ready(function() {
			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);
			
				// file 데이터를 formData로 추가 
				for (var i = 0; i < files.length; i++) {
					
					if(!checkExtension(file[i].name, file[i].size) ){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : "uploadAjax",
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(reuslt) {
						alert("Upload성공");
					}
				})

			});
		});
		
		
	
	</script>
</body>
</html>