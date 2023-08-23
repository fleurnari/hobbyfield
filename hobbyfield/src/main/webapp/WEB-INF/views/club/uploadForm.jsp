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
			<input name="uploadFile" type="file" name="uploadFile" multiple="multiple" >
			<button id="uploadBtn">upload</button>
			<img id="preview" style="width: 200px; height: 200px;"/>
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
	
	function readURL(input) {
  		if (input.files && input.files[0]) {
    		var reader = new FileReader();
    		reader.onload = function(e) {
      		document.getElementById('preview').src = e.target.result;
    		};
    		reader.readAsDataURL(input.files[0]);
  		} else {
    	document.getElementById('preview').src = "";
  		}
	}
	
	$(document).ready(function() {
			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);
			
				// file 데이터를 formData로 추가 
				for (var i = 0; i < files.length; i++) {
					
// 					if(!checkExtension(file[i].name, file[i].size) ){
// 						return false;
// 					}
					
					formData.append("uploadFile", files[i]);
				}
					
				$.ajax({
					url : "uploadAjaxFile",
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(mv) {
						console.log(mv.url + " => url");
						console.log(mv.UUID + " => UUID");
						alert("Upload성공");
						
						var imgTag = document.getElementById("preview");
						imgTag.src = mv.url+ mv.UUID; 
						targetElement.appendChild(imgTag);
					}
				})

			});
		});
		
		
	
	</script>
</body>
</html>