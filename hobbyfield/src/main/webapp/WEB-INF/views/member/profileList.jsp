<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertclub.css">
<title>프로필 유저정보</title>
<style type="text/css">
	.images{
		width: 200px;
		height: 150px;
	}

	/*모달창 */
    /* ... 기존 스타일 ... */
   .club-modal {
	    visibility: hidden;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0,0,0,0.5);
	    z-index: 1000;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    overflow-y: auto;  /* 스크롤 추가 */
	}

    .modal-body {
	    width: 70%;  /* 너비 조정 */
	    background-color: white;
	    padding: 40px 40px 60px 40px;  /* 패딩을 조정하여 내용이 적절히 들어갈 수 있도록 합니다. */
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	    border-radius: 10px;
	    z-index: 1001;
	    overflow-y: auto;  /* 내용이 많을 때 스크롤 추가 */
	    position: relative;
	}

    /* 모달 닫기 버튼 (선택) */
    .close {
	    position: absolute;  /* 버튼의 위치를 모달 내부에 절대적으로 설정 */
	    top: 15px;  /* 상단으로부터의 거리 */
	    right: 15px;  /* 오른쪽으로부터의 거리 */
	    cursor: pointer;
	    font-size: 24px;
	    z-index: 1002;
	    color: black;
	    background-color: white;  /* 버튼의 배경색을 흰색으로 설정 (필요에 따라 조정) */
	    border-radius: 50%;  /* 버튼을 원형으로 만들기 위해 설정 */
	    padding: 5px 10px;  /* 버튼 내부의 패딩 조정 */
	    line-height: 1;  /* 아이콘의 세로 정렬을 위해 설정 */
	    border: 1px solid #ddd;  /* 버튼의 테두리 설정 (필요에 따라 조정) */
	}
	
	.update-button {
	    position: absolute;  
	    bottom: 20px;
	    right: 20px;
	    z-index: 1002;  
	    background-color: blue;  /* 버튼의 배경색을 파란색으로 설정 */
	    color: white;  /* 버튼의 텍스트 색상을 흰색으로 설정 */
	    padding: 10px 20px;  /* 버튼의 패딩 조정 */
	    border-radius: 5px;  /* 버튼의 모서리 둥글게 설정 */
	    border: none;  /* 버튼의 테두리 제거 */
	    cursor: pointer;  /* 버튼에 마우스 오버 시 포인터 아이콘으로 변경 */
	}


</style>
<script type="text/javascript" src="resources/js/common.js"></script>
</head>
<body>
<section>

	<div align="center">
		<div>
		<div id="box">
			<div>
         		<jsp:include page="myPageMenu.jsp"></jsp:include>
         	</div>
         	
         	<div>
         		<a class="btn btn-success" href="${pageContext.request.contextPath}/club/profileInsert">프로필 생성</a>
         	</div>
			<table border="1">
					<thead>
						<tr>
							<th>프로필 닉네임</th>
							<th>프로필 이미지</th>
						</tr>
					</thead>
					<c:forEach items="${getNomalMypage}" var="profile">
					<tbody class="table-hover">
<!-- 						<tr onclick="selectProfile(this.value)"> -->
						<tr data-profile-nickname="${profile.profileNickname }"
							data-club-img="${profile.profileImg }"
							data-club-imgPath="${profile.profileImgPath }"	
							data-member-email="${profile.memberEmail }"	
							class="open-modal">
							<td>${profile.profileNickname}</td>
							<td>${profile.clubName}</td>
							<td>
							<img class="images" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profil.profileImgPath}"/>
							</td>	
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
		<!-- modal 창 시작 -->
		<form action="updateProfile" method="POST" id="uploadForm">
			<div align="center" id="club-modal" class="club-modal">
				<div class="modal-body">
				
				<input type="text" value="${profileNickname}" name="profileNickname" readonly>
				
					<!-- 이미지 선택 인풋 -->
					<input type="file" id="imgInput" name="uploadFile" onchange="readURL(this);"/>
					
					<!-- 이미지 업로드 버튼 -->
					<button type="button" id="uploadBtn" >Upload</button>
					
					<!-- 이미지 미리보기 기본 이미지 -->
					<img class=images id="preview" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profil.profileImgPath}" alt="Profile-Image"/>
			
				<div>
					<button class="join_button" id="changeImageBtn" type="submit">수정</button>
				</div>
					<span class="close">&times;</span>
			</div>
			
			</div>
		</form>
		<!-- modal 창 끝 -->
		


		
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
	
	//프로필 단건조회
	function selectProfile(profileNickname) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/club/selectProfile',
	        type: 'GET',
	        data: { 'profileNickname': profileNickname },
	        success: function(data) {
	        	if(data){
	        	   console.log(data)
	        	   $("#club-modal input[name='clubImg']").val(data.clubImg);
		           $("#club-modal input[name='clubImgPath']").val(data.clubImgPath);
		           $("#club-modal input[name='profileNickname']").val(data.profileNickname);
		           $("#uploadForm input[name='profileNickname']").val(data.profileNickname);
	        	}
	        	   
	        	   $('#club-modal').show();
	        },
	        error: function(error) {
	            console.log("프로필 조회 오류:", error);
	        }
	    });
	}
	
	function showModal(row){
		var profileNickname = $(row).data('profile-nickname');
		console.log("모달창 등장" + profileNickname)
		selectProfile(profileNickname);
		
	}
	
	$(document).ready(function(e){
		$('tbody tr').click(function(){
			showModal(this);
			console.log(e);
		});
		
		 $('.open-modal').click(function() {
	        $('.club-modal').css("visibility", "visible"); // 모달 창 보여주기
	    });
		// 모달 창 닫기
		 $('.close').click(function() {
	        $('.club-modal').css("visibility", "hidden"); // 모달 창 숨기기
	    });
	});
	
	
	
	
// 	$(document).ready(function() {
// 	    // 프로필 닉네임 선택 옵션에서 값이 변경되었을 때의 이벤트 핸들러를 설정합니다.
// 	    $('#profileNickname').on('change', function() {
// 	        fetchProfileDetails(this.value);
// 	    });
// 	});
	
		
// 	//프로필 정보 수정 (진행중)
// 	function readURL(input) {
// 	    if (input.files && input.files[0]) {
// 	        var reader = new FileReader();
// 	        reader.onload = function(e) {
// 	            $('#preview').attr('src', e.target.result);
// 	        };
// 	        reader.readAsDataURL(input.files[0]);
// 	    } else {
// 	        $('#preview').attr('src', '');
// 	    }
// 	}
	
	

	
	//수정버튼
	$('form').on('submit', ajaxDeptUpdate);
	
	function ajaxDeptUpdate(event){
		event.preventDefault();
		
		let obj = serializeObject();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/club/updateProfile',  //contenttype이 제이슨이 아니면 작동안한다. text로 보낼거면 텍스트로 
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
	
	function serializeObject() {
		let formData = $('form').serializeArray();
		
		let formObj = {};
		$.each(formData, function(idx, obj) {
			formObj[obj.name] = obj.value;
		});
		
		return formObj;
	}
	
	
	

	
</script>
</body>
