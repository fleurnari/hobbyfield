<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertclub.css">
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<title>프로필 유저정보</title>
<style type="text/css">
	.images{
		width: 200px;
		height: 150px;
	}

	.modal-body {
    height: 500px; /* 원하는 높이로 조절 */
    overflow-y: auto;
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
	
    /* 박스 스타일 */
	#box {
	  display: flex;
	  justify-content: center;
	  align-items: flex-start;
	  width: 90%; /* 너비를 조절하여 중앙에 위치하게 함 */
      margin: 0 auto; /* 중앙 정렬 */
	}
	
     #box > div:first-child {
        margin-right: 50px; /* 카테고리 오른쪽 간격 조절 */
    }
    
    .table td, .table th {
    vertical-align: middle;
    color: initial;
    padding: 20px 8px;
   
	}
	
	.tr{
	width: 20px;
	}
	
    
    .table {
    width: 100%; 
    margin: 20px 0; /* 표의 위아래 간격 조절 */
    font-size: 14px;
    border-collapse: collapse;
	}
	
	tr:hover {
    cursor: pointer;
  	}	

	.create {
        margin-top: 20px;
        margin-right: 0;
        right : 400px;
        align-self: flex-start;
        order: 2;  /* 버튼이 뒤로 오게*/
    }
	
	.images{
		width: 200px;
		height: 150px;
		margin: 0 auto; /* 중앙 정렬 */
	}
	
	.btn-secondary{
		position: relative;
		right: -90px;
		top: 310px;
	}
	
	.save.btn.btn-primary{
		position: relative;
		right: 100px;
		top: 301px;
		margin: 20px 0px 4px;
	}
	
	
	

</style>
<script type="text/javascript" src="resources/js/common.js"></script>

</head>
<body>
<section>

	<div align="center">
		<div id="box">
			<div>
         		<jsp:include page="myPageMenu.jsp"></jsp:include>
         	</div>
         	 <div style="flex: 1; width: 100%;"> 
         	<div style="text-align: right;">
         		<a class="create btn btn-primary" href="${pageContext.request.contextPath}/club/profileInsert">프로필 생성</a>
         	 </div>
         	
			<table class="table table-striped table-hover">
					<thead align="center">
						<tr>
							<th>닉네임</th>
							<th>가입한 모임</th>
							<th>프로필 이미지</th>
						</tr>
					</thead>
					<c:forEach items="${getNomalMypage}" var="profile">
					<tbody class="table-hover" align="center">
<!-- 						<tr onclick="selectProfile(this.value)"> -->
						<tr data-profile-nickname="${profile.profileNickname }"
							data-club-img="${profile.profileImg }"
							data-club-imgPath="${profile.profileImgPath }"	
							data-member-email="${profile.memberEmail }"	
							class="open-modal">
							<td>${profile.profileNickname}</td>
							<td>${profile.clubName}</td>
							<td>
							<img class="images" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profile.profileImgPath}"/>
							</td>	
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		</div>
	</div>
	
		<!-- modal 창 시작 -->
		<form action="updateProfile" method="POST" id="uploadForm">
			<div align="center" id="club-modal" class="club-modal modal fade">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body">

							<input type="text" value="${profileNickname}"
								name="profileNickname" readonly>

							<!-- 이미지 선택 인풋 -->
							<input type="file" id="imgInput" name="uploadFile"
								onchange="readURL(this);" />

							<!-- 이미지 업로드 버튼 -->
							<button type="button" class="btn btn-success" id="uploadBtn">업로드</button>

							<div class="modal-footer">
							<!-- 이미지 미리보기 기본 이미지 -->
							<img class=images id="preview" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profil.profileImgPath}"
								alt="Profile-Image" />
							
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="save btn btn-primary">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

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
			 $('#club-modal').modal('show'); // 모달 창 보여주기
	    });
		// 모달 창 닫기
		 $('.close').click(function() {
			 $('#club-modal').modal('hide'); // 모달 창 숨기기
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
		console.log(obj);
		$.ajax({
			url : '${pageContext.request.contextPath}/club/updateProfile',  //contenttype이 제이슨이 아니면 작동안한다. text로 보낼거면 텍스트로 
			type : 'post',
			contentType : 'application/json', //content ~ data (obj) json타입은 항상 세트다.
			data : JSON.stringify(obj)
		})
		.done( data => {
			console.log(data);
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
</html>