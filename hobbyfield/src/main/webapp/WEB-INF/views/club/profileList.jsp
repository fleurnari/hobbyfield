<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<title>프로필 유저정보</title>
<style type="text/css">
.images{
	width: 200px;
	height: 150px;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<section>

	<div align="center">
		<div>
			<table border="1">
					<thead>
						<tr>
							<td>프로필 닉네임</td>
							<td>프로필 이미지</td>
						</tr>
					</thead>
					<c:forEach items="${getNomalMypage}" var="profile">
					<tbody>
						<tr onclick="fetchProfileDetails(this.value)">
							<td>
							${profile.profileNickname}
							</td>
							<td>
							${profile.clubName}
							</td>
							<td>
							<img class="images" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profil.profileImgPath}"/>
							</td>	
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		
		<!-- modal 창 -->
		<div align="center" id="club-modal" class="club-modal">
			<form action="updateProfile" method="POST" id="uploadForm">
				<input class="nick_input" name="profileNickname" type="text" value="${profile.profileNickname }"> 
				<br>
				<span class="nick_input_re1">사용 가능한 닉네임 입니다.</span>
		        <span class="nick_input_re2">닉네임이 이미 존재합니다.</span>
		        <span class="final_name_ck">사용할 닉네임을 입력하세요.</span>
				<c:if test="${not empty errorMessage}"> 
			    <div class="error">${errorMessage}</div>
				</c:if>
				<!-- 이미지 선택 인풋 -->
				<input type="file" id="imgInput" name="uploadFile" onchange="readURL(this);"/>
				
				<!-- 이미지 업로드 버튼 -->
				<button type="button" id="uploadBtn" >Upload</button>
				
				<!-- 이미지 미리보기 기본 이미지 -->
				<img class=images id="preview" src="${pageContext.request.contextPath}/download/img/${profile.profileImg}${profil.profileImgPath}" alt="Profile Image"/>
				
			
			<div>
				<button class="join_button" id="changeImageBtn" type="submit">수정</button>
			</div>
			</form>
		</div>
		<!-- modal 창 끝 -->
		


		
	</div>
</section>
	
<script>
	//유효성 검사 통과 유무 변수 
	var nickCheck = false; //닉네임 
	var nickchCheck = false; //닉네임 중복체크
	
	$(document).ready(function(){
	   //프로필 등록 버튼
	   $(".join_button").on("click", function() {
	      
	      //입력값 변수
	      var nick = $('.nick_input').val(); //닉네임 입력란
	      
	      /* 닉네임 유효성검사 */
	      if(nick == ""){
	         $('.final_name_ck').css('display', 'block');
	         nickCheck = false;
	      }else{
	         $('.final_name_ck').css('display', 'none');
	         nickCheck = true;
	      }
	      
	//	      /* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
	//	      if(nickCheck&&nickchCheck){
	//	        $("#join_form").submit();
	//	      }
	      
	      return false;
	   });
	});
	
	
	//닉네임 중복체크
	$('.nick_input').on("propertychange change keyup paste input", function(){
	      /* console.log("keyup 테스트"); */
	   var inputTag = $(this); //닉네임 개별체크 이벤트   
	   var profileNickname = inputTag.val();  //.nick_input 입력될값
	   var data = {profileNickname : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick_input에 입력되는 값)
	   
	   $.ajax({
	      type : "post",
	      url : "${pageContext.request.contextPath}/club/nickChk",
	      data : data,
	      success : function(result) {
	         /* console.log("성공" + result); */
	         if(result != 'fail'){
	        	inputTag.next('.nick_input_re1').css("display", "inline-block");
	            inputTag.next('.nick_input_re2').css("display", "none");
	            nickchCheck = true;
	         }else{
	        	inputTag.next('.nick_input_re2').css("display", "inline-block");
	            inputTag.next('.nick_input_re1').css("display", "none");
	            nickchCheck = false;
	         }
	      }// success 종료
	   }); // ajax 종료
	}); // function 종료


	/* 이미지 업로드 */
	function imgUploadHandler(list) {
		for (i = 0; i < list.length; i++) {
			let tag = `<input type="hidden" name="profileImg" value="\${list[i].UUID}">
			           <input type="hidden" name="profileImgPath" value="\${list[i].url}">`
			$('#uploadForm').append(tag);
		}
	}
	
	
	
	
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

	$(document).ready(function(){
		$('tbody tr').click(function(){
		// 단건조회 ajax 호출
		let profileNickname = $(this).data('profileNickname')
		fetchProfileDetails($(this).find('input.nick_input').val());
		// 모달 창 열기
			$('#club-modal').show();
		});
			$('.close').click(function(){
				// 모달 창 닫기
				$('#club-modal').hide();
		});
	});
	
	//프로필 단건조회
	function fetchProfileDetails(nickname) {
	    if (!nickname) return;  
	
	    $.ajax({
	        url: '${pageContext.request.contextPath}/app/selectProfile',
	        type: 'GET',
	        data: { profileNickname: nickname },
	        success: function(data) {
	            let  = (data.profileImgPath || "") + (data.profileImg || "");
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
