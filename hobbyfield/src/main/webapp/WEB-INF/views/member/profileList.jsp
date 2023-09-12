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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>프로필 유저정보</title>
<style type="text/css">
.images {
	width: 200px;
	height: 150px;
}

.modal-body {
	height: 400px; /* 원하는 높이로 조절 */
	overflow: hidden;
	border-radius: 30px;
}

/* 박스 스타일 */
#box {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	width: 90%; /* 너비를 조절하여 중앙에 위치하게 함 */
}

#box>div:first-child {
	margin-right: 10px; /* 카테고리 오른쪽 간격 조절 */
}

.table {

	border-collapse: collapse;
	width: 80%;
	font-size: 14px; 
	border: 1px solid #ddd;
/* 	margin: 10px auto; */
	margin-top: 0;
}

.table td, .table th {
	vertical-align: middle;
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.table th:nth-child(1) {
    min-width: 150px;
}

.table th {
	background-color: #f2f2f2;
}

.table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table tr:hover {
	cursor: pointer;
}

/* 버튼 영역 */
.create {
	margin-top: 20px;
	border-radius: 30px;
}

.update-button {
	position: absolute;
	bottom: 20px;
	/* 	    z-index: 1002;   */
	padding: 10px 20px; /* 버튼의 패딩 조정 */
	border-radius: 5px; /* 버튼의 모서리 둥글게 설정 */
	border: none; /* 버튼의 테두리 제거 */
	cursor: pointer; /* 버튼에 마우스 오버 시 포인터 아이콘으로 변경 */
}

.images {
	width: 200px;
	height: 150px;
	margin: 0 auto; /* 중앙 정렬 */
}

p {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

/* 모달창 버튼 */
.btn-secondary {
	width: 100px;
	display: inline-block;
	margin: 1rem;
}

.save.btn.btn-primary {
	float: left;
	width: 100px;
	margin: 1rem;
	display: inline-block;
}

.nick{
	width: 100px;
}

.modal-btn {
	top: 400px;
	display: inline-table;
	padding: 1em;
	align-items: center;
	text-align: center;
}

#uploadBtn {
	width: 100px;
}

.modal-footer {
	text-align: center;
}

.model-body.input {
	margin-bottom: 10px;
}

#imgInput {
	display: inline-block;
	width: 200px;
}
</style>
<script type="text/javascript" src="resources/js/common.js"></script>

</head>
<body>
<section>
    <div class="container-lg"> 
    <div class="row justify-content-center">
				<div class="col-12">
					<h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">나의 프로필</h1>
				</div>
			</div>
	<div align="center">
		<div id="box">
			<div>
         		<jsp:include page="myPageMenu.jsp"></jsp:include>
         	</div>
         	 <div style="flex: 1; width: 100%;"> 
         	
         	
			<table class="table">
					<thead align="center" style=”table-layout:fixed”>
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
							<img class="images" src="${pageContext.request.contextPath}${profile.profileImgPath}${profile.profileImg}"
							onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/clubImg.jpg';" />
							</td>	
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<a class="create btn btn-primary" href="${pageContext.request.contextPath}/club/profileInsert">프로필 생성</a>
		</div>
		
		</div>
	</div>
	
	
		<!-- modal 창 시작 -->
		<form action="updateProfile" method="POST" id="uploadForm">
			<div align="center" id="club-modal" class="club-modal modal fade">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body">
							<p> 닉네임 </p>	
							<div class="input-group mb-3">
							<input type="text" value="${profileNickname}"
								name="profileNickname"  readonly="readonly" class="nick form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" />
							</div>
							
							<div class="modal-footer">
							<!-- 이미지 미리보기 기본 이미지 -->
							<img class=images id="preview" src="${pageContext.request.contextPath}/${profile.profileImgPath}${profile.profileImg}"
							onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/clubImg.jpg';"
								 />			
							<!-- 이미지 선택 인풋 -->
							<input type="file" id="imgInput" name="uploadFile"
								onchange="readURL(this);" />

							<!-- 이미지 업로드 버튼 -->
								<div class="modal-btn">
								<button type="button" class="btn btn-success" id="uploadBtn">업로드</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="save btn btn-primary">저장</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
			if(data != null && data['status'] == 'success'){
				swal('성공','정상적으로 수정 됐습니다','success' );
// 				alert('수정됐습니다.');
				window.location.href='${pageContext.request.contextPath}/club/profileList';
			}else{
// 				alert('수정되지 않았습니다.');
				swal('실패','수정에 실패했습니다','error' );
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