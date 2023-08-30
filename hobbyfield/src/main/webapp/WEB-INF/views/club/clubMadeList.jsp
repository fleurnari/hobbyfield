<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<title>내가 만든 모임 리스트</title>
<style>
      
	/*모달창 */
    /* ... 기존 스타일 ... */
   .club-modal {
        display: none; /* 초기에 모달을 숨깁니다. */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5); /* 반투명한 검은색 배경 */
        z-index: 1; /* 다른 요소 위에 위치 */
    }

    .modal-body {
        width: 25%; /* 화면 크기 */
        height: 80%; /* 화면 크기 */
        position: absolute;
        top: 50%; 
        left: 50%;
        transform: translate(-50%, -50%); /* 중앙에 위치하도록 설정 */
        background-color: white;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    /* 모달 닫기 버튼 (선택) */
    .close {
        position: absolute;
        right: 15px;
        top: 15px;
        cursor: pointer;
    }


/* @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100); */

/* 	body { */
/* 	  background-color: #3e94ec; */
/* 	  font-family: "Roboto", helvetica, arial, sans-serif; */
/* 	  font-size: 16px; */
/* 	  font-weight: 400; */
/* 	  text-rendering: optimizeLegibility; */
/* 	} */

/* 	div.table-title { */
/* 	   display: block; */
/* 	  margin: auto; */
/* 	  max-width: 600px; */
/* 	  padding:5px; */
/* 	  width: 100%; */
/* 	} */

/* 	.table-title h3 { */
/* 	   color: #fafafa; */
/* 	   font-size: 30px; */
/* 	   font-weight: 400; */
/* 	   font-style:normal; */
/* 	   font-family: "Roboto", helvetica, arial, sans-serif; */
/* 	   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1); */
/* 	   text-transform:uppercase; */
/* 	} */


/* 	/*** Table Styles **/ */

/* 	.table-fill { */
/* 	  background: white; */
/* 	  border-radius:3px; */
/* 	  border-collapse: collapse; */
/* 	  height: 320px; */
/* 	  margin: auto; */
/* 	  max-width: 600px; */
/* 	  padding:5px; */
/* 	  width: 100%; */
/* 	  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); */
/* 	  animation: float 5s infinite; */
/* 	} */
	 
/* 	th { */
/* 	  color:#D5DDE5;; */
/* 	  background:#1b1e24; */
/* 	  border-bottom:4px solid #9ea7af; */
/* 	  border-right: 1px solid #343a45; */
/* 	  font-size:23px; */
/* 	  font-weight: 100; */
/* 	  padding:24px; */
/* 	  text-align:left; */
/* 	  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); */
/* 	  vertical-align:middle; */
/* 	} */

/* 	th:first-child { */
/* 	  border-top-left-radius:3px; */
/* 	} */
	 
/* 	th:last-child { */
/* 	  border-top-right-radius:3px; */
/* 	  border-right:none; */
/* 	} */
	  
/* 	tr { */
/* 	  border-top: 1px solid #C1C3D1; */
/* 	  border-bottom-: 1px solid #C1C3D1; */
/* 	  color:#666B85; */
/* 	  font-size:16px; */
/* 	  font-weight:normal; */
/* 	  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1); */
/* 	} */
	 
/* 	tr:hover td { */
/* 	  background:#4E5066; */
/* 	  color:#FFFFFF; */
/* 	  border-top: 1px solid #22262e; */
/* 	} */
	 
/* 	tr:first-child { */
/* 	  border-top:none; */
/* 	} */

/* 	tr:last-child { */
/* 	  border-bottom:none; */
/* 	} */
	 
/* 	tr:nth-child(odd) td { */
/* 	  background:#EBEBEB; */
/* 	} */
	 
/* 	tr:nth-child(odd):hover td { */
/* 	  background:#4E5066; */
/* 	} */

/* 	tr:last-child td:first-child { */
/* 	  border-bottom-left-radius:3px; */
/* 	} */
	 
/* 	tr:last-child td:last-child { */
/* 	  border-bottom-right-radius:3px; */
/* 	} */
	 
/* 	td { */
/* 	  background:#FFFFFF; */
/* 	  padding:20px; */
/* 	  text-align:left; */
/* 	  vertical-align:middle; */
/* 	  font-weight:300; */
/* 	  font-size:18px; */
/* 	  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1); */
/* 	  border-right: 1px solid #C1C3D1; */
/* 	} */

/* 	td:last-child { */
/* 	  border-right: 0px; */
/* 	} */

/* 	th.text-left { */
/* 	  text-align: left; */
/* 	} */

/* 	th.text-center { */
/* 	  text-align: center; */
/* 	} */

/* 	th.text-right { */
/* 	  text-align: right; */
/* 	} */

/* 	td.text-left { */
/* 	  text-align: left; */
/* 	} */

/* 	td.text-center { */
/* 	  text-align: center; */
/* 	} */

/* 	td.text-right { */
/* 	  text-align: right; */
/* 	} */


</style>

</head>
<body>
	<!-- 하위 모두 수정해야함 -->
	<section>
		<div align="center" class="top">

			<div class="table-title">
				<h2>소모임 정보</h2>
			</div>

			<div class="table-fill">
				<table>
						<thead>
							<tr>
								<th class="text-left">이미지</th>
								<th class="text-left">소모임이름</th>
								<th class="text-left">닉네임</th>
								<th class="text-left">카테고리</th>
								<th class="text-left">모임분류</th>
								<th class="text-left">광역시</th>
								<th class="text-left">지역구</th>
							</tr>
						</thead>
					<c:forEach items="${clubMadeList}" var="List">
						<tbody class="table-hover" >

							<tr data-clubNumber="${List.clubNumber }"
								data-clubName="${List.clubName }"
								data-clubImg="${List.clubImg }"
								data-clubImgPath="${List.clubImgPath }"
								data-profileNickname="${List.profileNickname }"
								data-clubCategory="${List.clubCategory }"
								data-clubType="${List.clubType }"
								data-clubInfo="${List.clubInfo }"
								data-majorlocation="${List.majorLocation }"
								data-sublocation="${List.subLocation }"
								data-clubPublic="${List.clubPublic }"
								data-singupQuestion1="${List.singupQuestion1 }"
								data-singupQuestion2="${List.singupQuestion2 }"
								data-singupQuestion3="${List.singupQuestion3 }"
								class="open-modal">
								<td class="text-left"><img src="${List.clubImgPath}${List.clubImg}"></td>
								<td class="text-left">${List.clubName }</td>
								<td class="text-left">${List.profileNickname }</td>
								<td class="text-left">${List.clubCategory }</td>
								<td class="text-left">${List.clubType }</td>
								<td class="text-left">${List.majorLocation }</td>
								<td class="text-left">${List.subLocation }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>

			<form action="clubUpdate" method="post" id="join_form">
				<div id="club-modal" class="club-modal">
					<div class="modal-body">
					<div align="center" class="update-top">
						<h2>소모임 수정</h2>					
					</div>
					
					<div>
						<input type="hidden" name="clubNumber" class="clubNumber" id="">
						<input type="hidden" name="profileNickname" class="ProfileNickname" id="">
					</div>
					
					<div>
						<label>모임이름</label>
						<input type="text" class="club_input" name="clubName"><br>
						<span class="club_input_re1">사용 가능한 모임 이름입니다.</span>
						<span class="club_input_re2">모임 이름이 이미 존재합니다. </span>
						<span class="final_club_ck">모임 이름을 정해주세요</span>
					</div>
					
					<div>
						<label>모임카테고리</label>
						<select class="club_category" name="clubCategory">
							<c:forEach items="${C}" var="category">
								<option value="${category.subcode }">${category.literal}</option>
							</c:forEach>
						</select>
					</div>
	
					<div>
						<label>소모임 분류</label>
						<c:forEach items="${D}" var="type">
							<input type="radio" name="clubType" value="${type.subcode}" checked="checked">${type.literal}
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
						<input type="radio" name="clubPublic" checked="checked" readonly />공개
					</div>
					
					<div>
						<label>질문1</label>
						<input type="text" name="singupQuestion1" ><br>
						<label>질문2</label>
						<input type="text" name="singupQuestion2" ><br>
						<label>질문3</label>
						<input type="text" name="singupQuestion3" ><br>
					</div>
					
					<span class="close">&times;</span>
					<div>
						<button type="submit" class="update-button">수정하기</button>
					</div>
					<input type="text" value=${clubNumber }>
					<div id="preview"></div>
						<input name="uploadFile" type="file" value="clubImg" onchange="readURL(this);">
						<button type="button" id="uploadBtn">upload</button>
					</div>
					
					
					
				</div>
			</form>
		</div> 
	</section>

</body>

<script>

	//클릭한 모임 단건조회
	function showModalWithData(row){
        // 클릭한 행의 데이터 가져오기
        var clubNumber = $(row).data('clubNumber');
        var clubName = $(row).data('clubName');
       	var clubImg = $(row).data('clubImg');
       	var clubImgPath = $(row).data('clubImgPath');
       	var profileNickname = $(row).data('profileNickname');
       	var clubCategory = $(row).data('clubCategory');
       	var clubType = $(row).data('clubType');
       	var clubInfo = $(row).data('clubInfo');
       	var majorLocation = $(row).data('majorLocation');
       	var subLocation = $(row).data('subLocation'); 
       	var clubPublic = $(row).data('clubPublic');
       	var singupQuestion1 = $(row).data('singupQuestion1');
       	var singupQuestion2 = $(row).data('singupQuestion2');
       	var singupQuestion3 = $(row).data('singupQuestion3');

        // 모달 창의 입력 필드에 데이터 설정
        $("#clubModal input[name='clubNumber']").val(clubNumber);
        $("#clubModal input[name='clubName']").val(clubName);
        $("#clubModal input[name='clubImg']").val(clubImg);
        $("#clubModal input[name='clubImgPath']").val(clubImgPath);
        $("#clubModal input[name='profileNickname']").val(profileNickname);
        $("#clubModal input[name='clubCategory']").val(clubCategory);
        $("#clubModal input[name='clubType']").val(clubType);
        $("#clubModal input[name='clubInfo']").val(clubInfo);
        $("#clubModal input[name='majorLocation']").val(majorLocation);
        $("#clubModal input[name='subLocation']").val(subLocation);
        $("#clubModal input[name='clubPublic']").val(clubPublic);
        $("#clubModal input[name='singupQuestion1']").val(singupQuestion1);
        $("#clubModal input[name='singupQuestion2']").val(singupQuestion2);
        $("#clubModal input[name='singupQuestion3']").val(singupQuestion3);

        // 모달 창 보여주기
        $("#clubModal").show();
    }
	

    $(document).ready(function() {
    	 // 테이블의 각 행을 클릭했을 때 showModalWithData 함수를 호출
        $("tbody tr").click(function() {
            showModalWithData(this);
        });
    });


	//modal창 닫기
	$(document).ready(function() {
	    $('.open-modal').click(function() {
	        $('.club-modal').show(); // 모달 창 보여주기
	    });
	    $('.close').click(function() {
	        $('.club-modal').hide(); // 모달 창 숨기기
	    });
	});
	
	

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
			url : "clubnameChk",
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
	            url: "selectCommsubList",
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
</html>