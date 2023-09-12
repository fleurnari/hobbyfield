<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">

/* 메인화면에 맞게 css 수정필요 */
/* 닉네임 체크를 해서 등록가능하게 할것인지. 아니면 프로필이 없으면 접근못하게 할것인지 결정해야함 */


/* 일반 스타일링 */
body {
    font-family: Arial, sans-serif; /* 글꼴 설정 */
    background-color: #f4f4f4; /* 배경색 설정 */
    margin: 0;
    padding: 0;
}

div.top {
    width: 40%; /* 너비 설정 */
    margin: 50px auto; /* 중앙 정렬 */
    background-color: #fff; /* 배경색 설정 */
    padding: 20px; /* 내부 여백 설정 */
    border-radius: 10px; /* 테두리 둥글게 설정 */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}



.lable-text{
	font-weight: bold !important;
	margin-bottom: 10px; /* 아래쪽 여백 설정 */
    display: block; /* 작동오류시 먼저 찾기 */
}

/* 입력필드 스타일 */
input[type="text"], input[type="file"], select {
    width: 50%; /* 너비 설정 */
    padding: 10px; /* 내부 여백 설정 */
    margin: 10px 0; /* 외부 여백 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 5px; /* 테두리 둥글게 설정 */
}

input[type="radio"] {
    margin-right: 5px; /* 오른쪽 여백 설정 */
}

/* 버튼 스타일 */

button {
    background-color: #4CAF50; /* 배경색 설정 */
    color: white; /* 글씨색 설정 */
    padding: 10px 15px; /* 내부 여백 설정 */
    border: none; /* 테두리 없애기 */
    border-radius: 5px; /* 테두리 둥글게 설정 */
    cursor: pointer; /* 마우스 커서를 포인터로 설정 */
}

button:hover {
    background-color: #45a049; /* 버튼에 마우스를 올렸을 때의 배경색 설정 */
}

/* 기타 스타일링 */
.club_create_sub h2 {
    border-bottom: 2px solid #4CAF50; /* 아래쪽 테두리 설정 */
    padding-bottom: 10px; /* 아래쪽 내부 여백 설정 */
    margin-bottom: 20px; /* 아래쪽 외부 여백 설정 */
}

span {
    color: red; /* 글씨색 설정 */
    display: none; /* 기본적으로 보이지 않게 설정 */
}

.join_button_wrap {
    text-align: center; /* 중앙 정렬 */
    margin-top: 20px; /* 위쪽 여백 설정 */
}

.question-box{
    width: 50%;
    height: 6.25em;
    border: medium;
    resize: none;
    border: solid 1px;
}


.form-control {
	display: block;
	width: 50%;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<script type="text/javascript" src="resources/js/common.js"></script>
<title>소모임 등록</title>
<style type="text/css">

</style>



</head>


<body>
<form action="clubInsert" method="post" id="join_form">
	<div align="center" class="top">
		<div class="club_create_sub">
			<h2>소모임 등록</h2>		
		</div>
		<div>
			<div><label class="lable-text">닉네임 선택</label>
			    <select id="profile" name="profileNickname" class="form-control">
			        <c:forEach items="${profileList}" var="profile">
			            <option value="${profile.profileNickname}">${profile.profileNickname}</option>
			        </c:forEach>
			    </select>
			</div>
			
			</div>

			<div>
				<div>	
					<label class="lable-text">모임이름</label>
					<input type="text" class="club_input" name="clubName"><br>
				</div>
				<span class="club_input_re1">사용 가능한 모임 이름입니다.</span>
				<span class="club_input_re2">모임 이름이 이미 존재합니다. </span>
				<span class="final_club_ck">모임 이름을 정해주세요</span>
			</div>

				<div>
					<label class="lable-text">모임카테고리  </label> 
					<select class="club_category form-control" name="clubCategory">
						<c:forEach items="${C}" var="category">
							<option value="${category.subcode }">${category.literal}</option>
						</c:forEach>
					</select>
				</div><br>

				<div>
				<label class="lable-text">소모임 분류</label>
				<c:forEach items="${D}" var="type">
					<input type="radio" name="clubType" value="${type.subcode}" checked="checked" >${type.literal}
				</c:forEach>
				</div>
			
			<div>
				<label class="lable-text">소모임 소개</label>
				<textarea name="clubInfo" class="question-box" placeholder="내용을 입력해 주세요"></textarea><br>
			</div>
			
			<div>
				<label class="lable-text">광역지역  </label>
				<select class="majorlocation" name="majorLocation" id="majorLocation" class="form-control">
				    <option value="">선택</option>
					<c:forEach items="${E}" var="major" >					
						<option value="${major.subcode }">${major.literal }</option>
					</c:forEach>
				</select>
				
				<label class="lable-text">지역구  </label>
				<select class="sublocation form-control" name="subLocation" id="subLocation">
					 <option value="">선택</option>
				</select><br>
			</div>
			
			<div>
				<label class="lable-text" >공개여부 </label>
				<input type="radio" name="clubPublic" value="G1" checked="checked"/>공개
				<input type="radio" name="clubPublic" value="G2" />비공개
			</div><br>
			
			<div>
				<label class="lable-text">질문1</label>
				<textarea name="singupQuestion1" placeholder="내용을 입력해 주세요." class="question-box" ></textarea><br>
				<label class="lable-text">질문2</label>
				<textarea name="singupQuestion2" placeholder="내용을 입력해 주세요." class="question-box"></textarea><br>
				<label class="lable-text"> 질문3</label>
				<textarea name="singupQuestion3" placeholder="내용을 입력해 주세요." class="question-box"></textarea><br>
			</div>
			

			
			<div id="preview"><img src="noimg.jpg" width="300" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/clubImg.jpg';"/></div>
			<input name="uploadFile" type="file" value="" onchange="readURL(this);">
			<button type="button" id="uploadBtn">upload</button>
			
			<!-- 소모임 정원 default값 50 -->
			<div class="join_button_wrap">
				<button type="submit" class="join_button">등록하기</button>
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
	
  //소모임 이름 중복체크
    $('.club_input').on("propertychange change keyup paste input", function() {
        var clubName = $('.club_input').val();
        var data = {"clubName" : clubName}

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

    $(document).ready(function(){
        // 모임 이름 유효성 검사
        $('.club_input').on("propertychange change keyup paste input", function() {
            var clubName = $('.club_input').val();

            if(clubName == ""){
                $('.final_club_ck').css('display', 'block');
                clubnameChk = false;
            }else{
                $('.final_club_ck').css('display', 'none');
                clubnameChk = true;
            }
        });

        // 상위 카테고리가 변경될 때
        $("#majorLocation").change(function() {
            var selectedMajor = $(this).val();
            
            $.ajax({
                url: "${pageContext.request.contextPath}/club/selectCommsubList",
                data: { "code": selectedMajor },
                dataType: "json",
                success: function(response) {
                    $("#subLocation").empty();
                    $.each(response, function(index, item) {
                        $("#subLocation").append('<option value="' + item.subcode + '">' + item.literal + '</option>');
                    });
                }
            });
        });
        
        // "등록하기" 버튼 클릭 시 유효성 검사 실행
        $(".join_button").on("click", function(e) {
            if (!validateForm()) {
                e.preventDefault();
            }
        });
    });
	

	function imgUploadHandler(list) {
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="clubImg" value="\${list[i].UUID}">
				           <input type="hidden" name="clubImgPath" value="\${list[i].url}">`
				$('#join_form').append(tag);
			}
		}	
	
	function validateForm() {
 let clubName = document.getElementsByName('clubName')[0];
 let clubCategory = document.getElementsByName('clubCategory')[0];
 let clubType = document.querySelector('input[name="clubType"]:checked');
 let clubInfo = document.getElementsByName('clubInfo')[0];
 let majorLocation = document.getElementsByName('majorLocation')[0];
 let subLocation = document.getElementsByName('subLocation')[0];
 let clubPublic = document.querySelector('input[name="clubPublic"]:checked');
 let singupQuestion1 = document.getElementsByName('singupQuestion1')[0];
 let singupQuestion2 = document.getElementsByName('singupQuestion2')[0];
 let singupQuestion3 = document.getElementsByName('singupQuestion3')[0];

 if (clubName.value.trim() === '') {
	 swal('등록 실패','모임 이름을 입력해주세요','error' );
     clubName.focus();
     return false;
 }
 
 if (!clubnameChk) {
     swal('등록 실패','모임 이름이 중복됩니다. 다른 이름을 선택해주세요.','error');
     return false;
 }

 if (clubCategory.value.trim() === '') {
	 swal('등록 실패','모임 카테고리를 선택해주세요','error' );
     clubCategory.focus();
     return false;
 }

 if (!clubType) {
	 swal('등록 실패','소모임 분류를 선택해주세요','error' );
     return false;
 }

 if (clubInfo.value.trim() === '') {
	 swal('등록 실패','소모임 소개를 입력해주세요','error' );
     clubInfo.focus();
     return false;
 }

 if (majorLocation.value.trim() === '') {
	 swal('등록 실패','광역지역을 선택해주세요','error' );
     majorLocation.focus();
     return false;
 }

 if (subLocation.value.trim() === '') {
	 swal('등록 실패','지역구를 선택해주세요','error' );
     subLocation.focus();
     return false;
 }

 if (!clubPublic) {
	 swal('등록 실패','공개 여부를 선택해주세요','error' );
     return false;
 }

 if (singupQuestion1.value.trim() === '') {
	 swal('등록 실패','질문1을 입력해주세요','error' );
     singupQuestion1.focus();
     return false;
 }

 if (singupQuestion2.value.trim() === '') {
	 swal('등록 실패','질문2를 입력해주세요','error' );
     singupQuestion2.focus();
     return false;
 }

 if (singupQuestion3.value.trim() === '') {
	 swal('등록 실패','질문3을 입력해주세요','error' );
     singupQuestion3.focus();
     return false;
 }

 	return true;
}
	

// "등록하기" 버튼 클릭 시 유효성 검사 실행
// document.querySelector(".join_button").addEventListener("click", function(e) {
//     if (!validateForm()) {
//         e.preventDefault();
//     }
// });



// $.ajax({
//     type: "POST",
//     url: "${pageContext.request.contextPath}/club/profileCount",
//     data: { email: "${member.memberEmail}" },
//     success: function(count) {
//         if(count >= 3) {
//             alert("소모임은 최대 3개까지만 생성할 수 있습니다.");
//             window.location.href = "${pageContext.request.contextPath}/club/clubList";
//         } else {
//             // 모든 검사를 통과한 경우 form 제출
//             if(nickCheck && nickchCheck) {
//                 $("#join_form").submit();
//             }
//         }
//     }
// });


// //프로필 선택시 클럽 생성 가능 여부 확인
// $("#profile").change(function() {
//  var selectedProfile = $(this).val();

//  $.ajax({
//      type: "GET",
//      url: "${pageContext.request.contextPath}/club/checkClubCount",
//      data: { profileNickname: selectedProfile },
//      dataType: "json",
//      success: function(response) {
//      	if (response.clubCount >= 3) { // 클럽 생성 제한을 3개로 설정
//              alert("이 프로필로는 이미 클럽이 생성되었습니다.");
//              window.location.href = "${pageContext.request.contextPath}/club/clubList"; // 클럽 리스트 페이지로 리다이렉트
//          } else {
//          	$(".join_button").prop("disabled", false); // 클럽 생성 가능한 경우, 등록 버튼 활성화
//          }
//      }
//  });
// });

	

</script>
</html>