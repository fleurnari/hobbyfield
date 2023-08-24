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
					success : function(list) {
						//console.log(mv.url + " => url");
						//console.log(mv.UUID + " => UUID");
						//alert("Upload성공");
						for(mv of list) {
							var preview = document.getElementById("preview");
							var imgTag = document.createElement("img");
							imgTag.src = '/app/' + mv.url+ mv.UUID; 
							imgTag.style.width=200+'px';
							imgTag.style.height=200+'px';							
							preview.appendChild(imgTag);							
						}
						imgUploadHandler(list);
					}
				})

			});
		});