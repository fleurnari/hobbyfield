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
	<div align="center" style="margin-top: 100px;">
		<br>
		<br>
		<div>
			<p>테스트</p>
		</div>
		<div>
<!-- 		<input type="file" name="uploadFile" multiple="multiple" onchange="readURL(this);"> 
			<img id="preview" /> -->

			<input name="uploadFile" type="file" multiple="multiple" >
			<button id="uploadBtn">upload</button>
			<div  id="preview" >
				<img style="width: 200px; height: 200px;"/>
			</div>
			
		</div>
		<img src="download/img/common.png" style="width: 200px; height: 200px;">
	</div>
	
	<script type="text/javascript">
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 불가");
			return false;
		}
		return true;	
	}		

	$(document).ready(function() {
			$("#uploadFile").change(function(e){
				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);

				for (var i = 0; i < files.length; i++) {	
					formData.append("uploadFile", files[i]);
				}
					
				$.ajax({
					url : "uploadAjaxFile",
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(list) {
						//console.log(mv.url + " => url");
						//console.log(mv.UUID + " => UUID");
						//alert("Upload성공");
						for(file of list) {
							var preview = document.getElementById("preview");
							var imgTag = document.createElement("img");
							imgTag.src = mv.url+ mv.UUID; 
							imgTag.style.width=200+'px';
							imgTag.style.height=200+'px';							
							preview.appendChild(imgTag);							
						}

					}
				})

			});
		});
		
		
	
	</script>
</body>
</html>