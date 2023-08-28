<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>프로필 유저정보</title>
<style type="text/css">

</style>
<script type="text/javascript" src="resources/js/common.js"></script>
</head>
<body>
<section>
	<div align="center">
	<form action="updateProfile" method="post" id="uploadForm" >
		<div>
			<label>닉네임 선택</label>
			<select name="profileNickname" id="profileNickname" onchange="fetchProfileDetails(this.value)">
				<option value="">선택</option>
				<c:forEach items="${getNomalMypage}" var="profile">
					<option value="${profile.profileNickname }">${profile.profileNickname }</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			
		</div>		
		
		<div>
			<p3>첨부이미지</p3>
			<label></label>
<%-- 			<c:forEach items="${getNomalMypage}" var="selectImg"> --%>
<%-- 				<p>${selectImg.profileImgPath }<p> --%>
<%-- 				<p>${selectImg.profileImg }<p> --%>
<%-- 				<img src="${pageContext.request.contextPath}/${selectImg.profileImgPath}${selectImg.profileImg}"> --%>
<%-- 			</c:forEach> --%>

<%-- 			<img src="${selectProfile.profileImgPath}${selectProfile.profileImg}" alt="Profile Image"> --%>

<!-- 			<img id="preview" src=""> -->

			<!-- 이미지 선택 인풋 -->
			<input type="file" id="imgInput" name="uploadFile" onchange="readURL(this);"/>
			
			<!-- 이미지 미리보기 -->
			<img id="preview" src="" alt="Profile Image"/>
			
			<!-- 이미지 업로드 버튼 -->
			<button type="button" id="uploadBtn" >Upload</button>
		</div>
		
		<button id="changeImageBtn" type="submit">수정</button>
	</form>
	</div>
</section>
	
<script>

/* 이미지 업로드 */
function imgUploadHandler(list) {
	for (i = 0; i < list.length; i++) {
		let tag = `<input type="hidden" name="profileImg" value="\${list[i].UUID}">
		           <input type="hidden" name="profileImgPath" value="\${list[i].url}">`
		$('#uploadForm').append(tag);
	}
}

function fetchProfileDetails(nickname) {
    if (!nickname) return;  

    $.ajax({
        url: '/app/selectProfile',
        type: 'GET',
        data: { profileNickname: nickname },
        success: function(data) {
            let imagePath = (data.profileImgPath || "") + (data.profileImg || "");
            if(imagePath) {
                $('#preview').attr('src', imagePath);
            } else {
                $('#preview').attr('src', '');
            }
        },
        error: function(error) {
            console.error("Failed to fetch profile details:", error);
        }
    });
}


$(document).ready(function() {
    // 프로필 닉네임 선택 옵션에서 값이 변경되었을 때의 이벤트 핸들러를 설정합니다.
    $('#profileNickname').on('change', function() {
        fetchProfileDetails(this.value);
    });
});

	
//프로필 정보 수정 (진행중)
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        $('#preview').attr('src', '');
    }
}






$('form').on('submit', ajaxDeptUpdate);

function ajaxDeptUpdate(event){
	event.preventDefault();
	
	let obj = serializeObject();
	
	$.ajax({
		url : 'updateProfile',  //contenttype이 제이슨이 아니면 작동안한다. text로 보낼거면 텍스트로 
		type : 'post',
		contentType : 'application/json', //content ~ data (obj) json타입은 항상 세트다.
		data : JSON.stringify(obj)
	})
	.done( data => {
		if(data != null && data['결과'] == 'Success'){
			alert('수정됐습니다.');	
		}else{
			alert('수정되지 않았습니다.');
		}
	})
	.fail( reject => console.log(reject));
};
//serialize , serializeArray를 언제 사용하는지 알아야 한다.
function serializeObject() {
	let formData = $('form').serializeArray();
	
	let formObj = {};
	$.each(formData, function(idx, obj) {
		formObj[obj.name] = obj.value;
	});
	
	return formObj;
}
	

// 	$(document).ready(function() {
// 	    $('select').on('change', function() {
// 	        var selectedNickname = $(this).val();
// 	        if (selectedNickname) {
// 	            $.ajax({
// 	                url: 'fetchProfileInfo',
// 	                type: 'GET',
// 	                data: {
// 	                    profileNickname: selectedNickname
// 	                },
// 	                success: function(data) {
// 	                    // 프로필 이미지 업데이트
// 	                    if (data && data.profileImgPath) {
// 	                        $('#preview').html('<img src="' + data.profileImgPath + '" alt="Profile Image">');
// 	                    } else {
// 	                        $('#preview').html('No Image Available');
// 	                    }
// 	                }
// 	            });
// 	        } else {
// 	            $('#preview').html('');  // 이미지 제거
// 	        }
// 	    });
// 	});

// function fetchProfileInfo(nickname) {
//     $.ajax({
//         url: '/app/fetchProfileInfo',  // 경로는 서버 설정에 따라 조절해야 합니다.
//         type: 'GET',
//         data: {
//             profileNickname: nickname
//         },
//         success: function(data) {
//             if (data && data.profileImgPath) {
//                 var preview = document.getElementById("preview");
//                 while (preview.firstChild) { // 기존 이미지 제거
//                     preview.removeChild(preview.firstChild);
//                 }
//                 var imgTag = document.createElement("img");
//                 imgTag.src = '/app/' + data.profileImgPath;  // 경로는 서버 설정에 따라 조절해야 합니다.
//                 imgTag.style.width = 200 + 'px';
//                 imgTag.style.height = 200 + 'px';
//                 preview.appendChild(imgTag);
//             } else {
//                 $('#preview').text('No Image Available');
//             }
//         },
//         error: function() {
//             console.error("프로필 이미지를 불러오는 데 실패했습니다.");
//         }
//     });
// }	



	
</script>
</body>
</html>