<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>소모임수정</title>
<script type="text/javascript" src="resources/js/common.js"></script>
</head>
<body>
<form action="clubUpdate" method="post" id="join_form">
	<div align="center" class="update-top">
		<div class="club_create_sub">
			<h2>소모임 정보</h2>		
		</div>
		<div>
			<input type="hidden" name="clubNumber" class="clubNumber" value="${profile.clubNumber }">
			<input type="hidden" name="clubProfile" class="clubProfile" value="${profile.clubProfile }">
<!-- 			<div><label>닉네임 선택</label> -->
<!-- 			<input list="profileSelect" id="profile" name="profileNickname" autocomplete="off" /> -->
<!-- 			<datalist id="profileSelect"> -->
<%-- 				<c:forEach items="${getNomalMypage}" var="profile" > <!-- 프로필 선택란 --> --%>
<%-- 					<option value="${profile.profileNickname }" >${profile.profileNickname}</option> --%>
<%-- 				</c:forEach> --%>
<!-- 			</datalist> -->
			
		</div>

			<div>
				<div>	
					<label>모임이름</label>
					<input type="text" class="club_input" name="clubName"><br>
				</div>
				<span class="club_input_re1">사용 가능한 모임 이름입니다.</span>
				<span class="club_input_re2">모임 이름이 이미 존재합니다. </span>
				<span class="final_club_ck">모임 이름을 정해주세요</span>
			</div>

				<div>
					<label>모임카테고리 : </label> 
					<select class="club_category" name="clubCategory">
						<c:forEach items="${C}" var="category">
							<option value="${category.subcode }">${category.literal}</option>
						</c:forEach>
					</select>
				</div>

				<div>
				<label>소모임 분류</label>
				<c:forEach items="${D}" var="type">
					<input type="radio" name="clubType" value="${type.subcode}" checked="checked" >${type.literal}
				</c:forEach>
			</div>
			
			<div>
				<label>소모임 소개</label>
				<input type="text" name="clubInfo"><br>
			</div>
			
			<div>
				<label>광역지역 : </label>
				<select class="majorlocation" name="majorLocation" id="majorLocation">
				    <option value="">선택</option>
					<c:forEach items="${E}" var="major" >					
						<option value="${major.subcode }">${major.literal }</option>
					</c:forEach>
				</select>
				
				<select class="sublocation" name="subLocation" id="subLocation">
					 <option value="">선택</option>
				</select><br>
			</div>
			
			<div>
				<label>공개여부 : </label>
				<input type="radio" name="clubPublic" value="${profile.clubPublic }" readonly />공개
				
			</div>
			
			<div>
				<label>질문1</label>
				<input type="text" name="singupQuestion1"><br>
				<label>질문2</label>
				<input type="text" name="singupQuestion2"><br>
				<label>질문3</label>
				<input type="text" name="singupQuestion3"><br>
			</div>
			
			
			<div id="preview"></div>
			<input name="uploadFile" type="file" value="clubImg" onchange="readURL(this);">
			<button type="button" id="uploadBtn">upload</button>
			
			<!-- 소모임 정원 default값 50 -->
			<div class="join_button_wrap">
				<button type="submit" class="join_button">수정하기</button>
			</div>
		</div>
</form>


</body>

<script>

	// 유효성 검사 통과 유무 변수 
	/* var clubName = false; //모임이름 
	var clubnameCheck = false; //모임이름 중복체크 */
	var clubNameCheck = false; //모임이름 
	var clubnameChk = false; //모임이름 중복체크
	
	$(document).ready(function(){
		//모임수정 버튼(모임수정 기능 작동)
		$(".join_button").on("click", function() {
			
			//입력값 변수
			var club = $('.club_input').val(); //소모임 이름 입력란 
			
			/* 모임이름 유효성 검사*/
			if(clubName == ""){
				$('.final_club_ck').css('display', 'block');
				clubnameChk = false;
			}else{
				$('.final_club_ck').css('display', 'none');	
				clubnameChk = true;
			}
			
			/* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
			if(clubName&&clubnameCheck){
			
	        $("#join_form").submit();
				
			}
			
			return false;
		});
	});	
	

	//소모임 이름 중복체크

	$('.club_input').on("propertychange change keyup paste input", function() {

		var clubName = $('.club_input').val(); //.club_input 입력될 값
		var data = {
			clubName : clubName
		} //.컨트롤에 넘길 데이터 이름 데이터(.club_input에 입력되는 값)

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/club/clubnameChk",
			data : data,
			success : function(result) {

				if (result != 'fail') {
					$('.club_input_re1').css("display", "inline-block");
					$('.club_input_re2').css("display", "none");
					clubnameChk = true;
				} else {
					$('.club_input_re2').css("display", "inline-block");
					$('.club_input_re1').css("display", "none");
					clubnameChk = false;
				}
			}

		});
	});

	
	
	$(document).ready(function() {
	    // 상위 카테고리가 변경될 때
	    $("#majorLocation").change(function() {
	        var selectedMajor = $(this).val();
	        
	        // 서버에 AJAX 요청
	        $.ajax({
	        //	type: "POST",
	            url: "${pageContext.request.contextPath}/club/selectCommsubList",
	            data: { "code": selectedMajor },
	           // contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function(response) {
	                // 하위 카테고리 내용을 초기화
	                $("#subLocation").empty();
	                
	                // 응답으로 받아온 하위 카테고리를 추가
	                $.each(response, function(index, item) {
	                    $("#subLocation").append('<option value="' + item.subcode + '">' + item.literal + '</option>');
	                });
	            }
	        });
	    });
	});
	
	//파일 이미지 업로드(join_form을 통해 전달)
	function imgUploadHandler(list) {
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="clubImg" value="\${list[i].UUID}">
				           <input type="hidden" name="clubImgPath" value="\${list[i].url}">`
				$('#join_form').append(tag);
			}
		}
	
</script>
</body>
</html>