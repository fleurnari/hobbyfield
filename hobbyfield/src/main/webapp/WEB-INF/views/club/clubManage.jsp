<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 관리 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<script

   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>   
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/club/clubboard.css">   
</head>
<style>
/* 소모임 수정 모달  */
/* 모달 창 전체 스타일 */
 .update-modal { 
   display: none; 
   position: fixed; /* 고정 위치 */ 
   z-index: 1; /* z-index로 다른 내용 위에 위치 */
   left: 0; 
   top: 0; 
   width: 100%; /* 전체 너비 */ 
   height: 100%; /* 전체 높이 */ 
   overflow: auto; /* 스크롤 가능 */ 
   background-color: rgba(0, 0, 0, 0.4); /* 반투명한 검은색 배경 */ 
 } 

 /* 모달 창 내용 스타일 */ 
 .update-body { 
    background-color: #fefefe; 
    margin: 15% auto; /* 중앙 정렬 */ 
    padding: 20px; 
    border: 1px solid #888; 
    width: 50%; /* 모달 창 너비 */ 
} 

 /* 닫기 버튼 스타일 */
 .update-close { 
      color: #aaa; 
    float: right; 
    font-size: 28px;
    font-weight: bold;
 } 

 .update-close:hover, .update-close:focus { 
    color: black; 
    text-decoration: none; 
    cursor: pointer; 
 } 

.club-img{
	width: 70%; 
    max-width: 300px; 
    margin: auto; /* 중앙 정렬 */

}

#clubUpdate label{
	display: inline-block;
	width: 100px;
}
#clubUpdate input[type=text], #clubUpdate textarea {
	width: 80%;
}

/* 중앙 정렬 및 테두리 색상 */
.club-management-container  {
    background-color: #f4f6fa;
    border-radius: 50px; 
    padding: 20px;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

/* 소모임 이름 위치 및 스타일 */
.club-name {
    margin-bottom: 30px;
}

/* 이미지 스타일 */
.club-img {
    width: 70%;
    max-width: 300px;
    margin: 30px auto; /* 중앙 정렬 */
    height: 300px;
}

/* 수정 버튼 스타일 */
#clubUpdateButton {
    background-color: #007BFF; /* 부트스트랩 파란색 */
}

/* 탈퇴 버튼 위치 및 스타일 */
#quitBtn {
    margin-top: 20px;
}

.btn-group {
    justify-content: flex-end; /* 오른쪽 정렬 */
    gap: 10px; /* 버튼 간 간격 */
    align-items: center; /* 수직 중앙 정렬 */
}

.btn-group button {
    width: auto; /* 버튼의 너비를 내용에 맞게 자동으로 설정 */
    text-overflow: ellipsis; /* 긴 텍스트를 ...로 표시 */
    white-space: nowrap; /* 줄바꿈 방지 */
    overflow: hidden; /* 숨김 처리 */
    max-width: 200px;
    border-radius: 50px; 
    
}

#clubContainer {
    width: 80%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
}

.images {
	width: 400px;
	
}



</style>

<body>
	<div class="top">
	<div class="club-management-container">
		<!-- 모임 이름 -->
		<h2 align="center" class="club-name text-center">${club.clubName}</h2>

		<!-- 소모임 정보 및 관리(모임장만) -->
		<div class="row align-items-center">
			<div class="col-md-6 text-center d-flex justify-content-center align-items-center">
				<c:if test="${not empty club.clubImg }">
					<img class="club-img"
						src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
				</c:if>
				<c:if test="${empty club.clubImg }">
					<img class="club-img"
						src="${pageContext.request.contextPath}/resources/img/clubImg.jpg">
				</c:if>
				
				
			</div>

			<div class="card-body col-md-6">
				<div>
					<p>모임장 : ${club.profileNickname}</p>
				</div>
				<div>
					<p>카테고리 : ${club.clubCategory}</p>
				</div>
				<div>
					<p>모임형태 : ${club.clubType}</p>
				</div>
				<div>
					<p>모임지역 : ${club.majorLocation} ${club.subLocation}</p>
				</div>
				<div>
					<p>현재인원 : ${club.clubNumber } / 전체인원 : ${club.clubTotal }</p>
				</div>
				
				<div>
					<p>모임소개 : ${club.clubInfo}</p>
				</div>

			</div>
			<!-- 소모임 수정 버튼 -->
			<div class="btn-group">
				    <c:if test="${member.memberEmail eq profile.memberEmail}">
				        <button type="button" class="btn btn-primary update-btn" id="clubUpdateButton">소모임 정보 수정</button>
				    </c:if>
				    <c:if test="${member.memberEmail ne profile.memberEmail}">
				        <button type="button" class="btn btn-success" id="quitBtn">탈퇴</button>
				    </c:if>
				</div>
		</div>
	</div>
	<!-- 톱니바퀴 모양 -->
			<c:if test="${member.memberEmail eq profile.memberEmail}">
				<div id="clubUpdate" class="container">
					<!-- 소모임 수정 -->
					<form action="clubUpdate" method="post" id="updateForm">
						<div id="updateModal" class="update-modal">
							<div class="update-body">
								<div align="center" class="update-top">
									<h2>소모임 수정</h2>
								</div>

								<div>
									<input type="hidden" name="clubNumber" class="clubNumber"
										value="${club.clubNumber }"> <input type="hidden"
										name="profileNickname" class="ProfileNickname"
										value="${club.profileNickname }">
								</div>
								<div>
									<label>모임이름</label> <input type="text" class="club_input"
										name="clubName" value="${club.clubName}"><br> 
										<span class="club_input_re1">사용 가능한 모임 이름입니다.</span>
										<span class="club_input_re2">모임 이름이 이미 존재합니다. </span> 
										<span class="final_club_ck">모임 이름을 정해주세요</span>
								</div>

								<div>
									<label>모임카테고리</label> <select class="club_category"
										name="clubCategory">
										<c:forEach items="${C}" var="category">
											<option value="${category.subcode }"
												<c:if test="${category.subcode eq club.clubCategoryCd }"> selected </c:if>>${category.literal}</option>
										</c:forEach>
									</select>
								</div>

								<div>
									<label>소모임 분류</label>
									<c:forEach items="${D}" var="type">
										<input type="radio" name="clubType" value="${type.subcode}"
											<c:if test="${type.subcode eq club.clubTypeCd }"> checked="checked" </c:if>>${type.literal}
                  		   </c:forEach>
								</div>

								<div>
									<label>소모임 소개</label>
									<textarea name="clubInfo">${club.clubInfo}</textarea>
									<br>
								</div>

								<div>
									<div>
										<label>광역지역 : </label> <select class="majorlocation"
											name="majorLocation" id="majorLocation">
											<option value="">선택</option>
											<c:forEach items="${E}" var="major">
												<option value="${major.subcode }"
													<c:if test="${major.subcode eq club.majorLocationCd}">selected</c:if>>${major.literal }</option>
											</c:forEach>
										</select>
									</div>

									<div>
										<label>구 :</label> <select class="sublocation" name="subLocation"
											id="subLocation">
											<option value="${major.literal }">선택</option>
										</select><br>
									</div>

								</div>

								<div>
									<label>공개여부 : </label> <input type="radio" name="clubPublic"
										checked="checked" value="G1"
										${club.clubPublic == 'G1' ? 'checked' : ''} readonly />공개
								</div>

								<div>
									<div>
										<label>질문1</label> <input type="text" name="singupQuestion1"
											value="${club.singupQuestion1 }"><br>
									</div>
									<div>
										<label>질문2</label> <input type="text" name="singupQuestion2"
											value="${club.singupQuestion2 }"><br>
									</div>
									<div>
										<label>질문3</label> <input type="text" name="singupQuestion3"
											value="${club.singupQuestion3 }"><br>
									</div>
								</div>

								<div id="preview"></div>
								<input id="imgInput" name="uploadFile" type="file"
									value="clubImg" onchange="readURL(this);">
								<button type="button" id="uploadBtn">upload</button>
								<img class="images" id="preview"
									src="${pageContext.request.contextPath}/download/img/${club.clubImg}"
									alt="ProfileImage" />
							</div>

							<div>
								<button type="submit" class="update-button">수정하기</button>
							</div>

							<span class="update-close">&times;</span>

						</div>
					</form>
				</div>

				<div id="clubContainer">
					<h5 align="center">소모임가입 신청 리스트</h5>
					<table class="table table-striped table-hover" >
						<thead class="" align="center">
							<tr>
								<th>닉네임</th>
								<th>가입신청일자</th>
								<th>질문답변 1</th>
								<th>질문답변 2</th>
								<th>질문답변 3</th>
								<th>승인처리</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${not empty beforeMembers}">
							<c:forEach items="${beforeMembers}" var="members">
								<tr>
									<td>${members.profileNickname }</td>
									<td>${members.applyDate }</td>
									<td>${members.applyAnswer1 }</td>
									<td>${members.applyAnswer2 }</td>
									<td>${members.applyAnswer3 }</td>
									<td>
										<button type="button" class="accept btn btn-success" 
											data-nickname="${members.profileNickname}"
											data-clubnumber="${members.clubNumber}">수락</button>
										<button type="button" class="reject btn btn-danger"
											data-nickname="${members.profileNickname}"
											data-clubnumber="${members.clubNumber}">거절</button>
									</td>
								</tr>
							</c:forEach>
							</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" align="center">신청한 인원이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</c:if>
	</div>


	<script type="text/javascript">
   
   //소모임 신청인원 수락 거절//
   //수락 or 거절 버튼
   $(document).ready(function() {
       $('.accept').click(function() {
           var nickname = $(this).data('nickname');
           var clubnumber = $(this).data('clubnumber');
         
           $.post("${pageContext.request.contextPath}/club/acceptClubMember", 
                 { "profileNickname": nickname, "clubNumber": clubnumber }, 
                 function(data) {
                   alert(data.msg);
                   location.reload()
           });
       });
   
       
       $('.reject').click(function() {
           var nickname = $(this).data('nickname');
           var clubnumber = $(this).data('clubnumber');
   
           $.post("${pageContext.request.contextPath}/club/rejectClubMember", { "profileNickname": nickname, "clubNumber": clubnumber }, function(data) {
               alert(data.msg);
               location.reload()
           });
       });
   });   
   
   //==========소모임 수정 영역============   
   // 모달 창과 버튼 요소 선택
   $(document).ready(function(){
   let modal = document.getElementById('updateModal');
   let btn = document.querySelector('#clubUpdateButton');
   let span = document.querySelector('.update-close');
   
   // 버튼 클릭 시 모달 창 표시
   btn.onclick = function() {
       console.log("Button 막힘!");
       modal.style.display = "block";
   }
   
   // 닫기 버튼(X) 클릭 시 모달 창 숨김
   span.onclick = function() {
       modal.style.display = "none";
   }
   
   // 모달 창 외부 클릭 시 모달 창 숨김
   window.onclick = function(event) {
       if (event.target == modal) {
           modal.style.display = "none";
       }
   }
   });
   
      
   // 유효성 검사 통과 유무 변수 
   var clubNameCheck = false; //모임이름 
   var clubnameChk = false; //모임이름 중복체크
   
   $(document).ready(function(){
      //모임수정 버튼(모임수정 기능 작동)
      $(".update_button").on("click", function() {
         
          event.preventDefault(); // 폼 제출 방지
         
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
         
           $("#updateForm").submit();
            
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
   
   
   //파일 이미지 업로드(join_form을 통해 전달)
   function imgUploadHandler(list) {
         for (i = 0; i < list.length; i++) {
            let tag = `<input type="hidden" name="clubImg" value="\${list[i].UUID}">
                       <input type="hidden" name="clubImgPath" value="\${list[i].url}">`
            $('#updateForm').append(tag);
         }
      }


	function chgMgLo(){
		var selectedMajor =$("#majorLocation").val();
        
        // 서버에 AJAX 요청
        $.ajax({
        //   type: "POST",
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
                
                $("#subLocation").val("${club.subLocationCd}");
            }
        });
	}
   
   $(document).ready(function() {
       // 상위 카테고리가 변경될 때
       $("#majorLocation").change(function() {
    	   chgMgLo();
       });
   });

   chgMgLo();
   
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
              alert('모임 이름을 입력해주세요.');
              clubName.focus();
              return false;
          }

          if (clubCategory.value.trim() === '') {
              alert('모임 카테고리를 선택해주세요.');
              clubCategory.focus();
              return false;
          }

          if (!clubType) {
              alert('소모임 분류를 선택해주세요.');
              return false;
          }

          if (clubInfo.value.trim() === '') {
              alert('소모임 소개를 입력해주세요.');
              clubInfo.focus();
              return false;
          }

          if (majorLocation.value.trim() === '') {
              alert('광역지역을 선택해주세요.');
              majorLocation.focus();
              return false;
          }

          if (subLocation.value.trim() === '') {
              alert('지역구를 선택해주세요.');
              subLocation.focus();
              return false;
          }

          if (!clubPublic) {
              alert('공개 여부를 선택해주세요.');
              return false;
          }

          if (singupQuestion1.value.trim() === '') {
              alert('질문1을 입력해주세요.');
              singupQuestion1.focus();
              return false;
          }

          if (singupQuestion2.value.trim() === '') {
              alert('질문2를 입력해주세요.');
              singupQuestion2.focus();
              return false;
          }

          if (singupQuestion3.value.trim() === '') {
              alert('질문3을 입력해주세요.');
              singupQuestion3.focus();
              return false;
          }

          if (confirm("수정하시겠습니까?")) {
              return true;
          } else {
              return false;
          }
      }

      // "수정하기" 버튼 클릭 시 유효성 검사 실행
      document.querySelector(".update-button").addEventListener("click", function(e) {
          if (!validateForm()) {
              e.preventDefault();
          }
      });
   
   
</script>
</body>
</html>