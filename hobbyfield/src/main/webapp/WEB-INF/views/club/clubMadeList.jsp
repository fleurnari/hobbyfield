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
						<input type="hidden" name="clubNumber" class="clubNumber" value="${clubNumber }">
						<input type="hidden" name="profileNickname" class="ProfileNickname" value="${profileNickname }">
					</div>
					
					<div>
						<label>모임이름</label>
						<input type="text" class="club_input" name="clubName" value="${clubName}"><br>
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
							 <option value="${major.literal }">선택</option>
						</select><br>
					</div>
					
					<div>
						<label>공개여부 : </label>
						<input type="radio" name="clubPublic" checked="checked" value="G1" ${clubPublic == 'G1' ? 'checked' : ''} readonly />공개
					</div>
					
					<div>
						<label>질문1</label>
						<input type="text" name="singupQuestion1" value="${singupQuestion1 }"><br>
						<label>질문2</label>
						<input type="text" name="singupQuestion2" value="${singupQuestion2 }"><br>
						<label>질문3</label>
						<input type="text" name="singupQuestion3" value="${singupQuestion3 }"><br>
					</div>
					
					<div id="preview"></div>
						<input name="uploadFile" type="file" value="clubImg" onchange="readURL(this);">
						<button type="button" id="uploadBtn">upload</button>
					</div>
		
					<span class="close">&times;</span>
					<div>
						<button type="submit" class="update-button">수정하기</button>
					</div>
					
					
				</div>
			</form>
		</div> 
	</section>

</body>

<script>


	function fetchClubData(profileNickname) {
	$.ajax({
	    url: "${pageContext.request.contextPath}/club/selectMadeClub",
	    type: "GET",
	    data: { 'profileNickname': profileNickname },
	    success: function(data) {
	        if (data) {
	        	console.log(data);
	            // 모달 창의 입력 필드에 데이터 설정
	            $("#club-modal input[name='clubNumber']").val(data.clubNumber);
	            $("#join_form input[name='clubNumber']").val(data.clubNumber);
	            $("#club-modal input[name='clubName']").val(data.clubName);
	            $("#club-modal input[name='clubImg']").val(data.clubImg);
	            $("#club-modal input[name='clubImgPath']").val(data.clubImgPath);
	            $("#club-modal input[name='profileNickname']").val(data.profileNickname);
	            $("#join_form input[name='profileNickname']").val(data.profileNickname);
	            $("#club-modal select[name='clubCategory']").val(data.clubCategory);
	            $("#club-modal input[name='clubType'][value='" + data.clubType + "']").prop('checked', true);
	            $("#club-modal input[name='clubInfo']").val(data.clubInfo);
	            $("#club-modal select[name='majorLocation']").val(data.majorLocation);
	            $("#club-modal select[name='subLocation']").val(data.subLocation);
	            if(data.clubPublic === "공개") {
	                $("#club-modal input[name='clubPublic']").prop('checked', true);
	            }
	            $("#club-modal input[name='singupQuestion1']").val(data.singupQuestion1);
	            $("#club-modal input[name='singupQuestion2']").val(data.singupQuestion2);
	            $("#club-modal input[name='singupQuestion3']").val(data.singupQuestion3);
	            
	            // 모달 창 보여주기
	            $('.club-modal').show();
	            
	        }
	    },
	    error: function(error) {
	        console.log("클럽 데이터 오류:", error);
	    }
	});
	}
	
	function showModalWithData(row) {
	    var profileNickname = $(row).data('profilenickname');
	    
	    console.log(profileNickname);
	    fetchClubData(profileNickname);
	}



	
	
	$(document).ready(function(e) {
	    // 테이블의 행을 클릭했을 때 showModalWithData 함수를 호출하여 모달열기
	    $("tbody tr").click(function() {
	        showModalWithData(this);
	        console.log(e);
	    });
	    
	 // .open-modal 클래스를 가진 엘리먼트를 클릭했을 때 모달열기
	    $('.open-modal').click(function() {
	        $('.club-modal').css("visibility", "visible"); // 모달 창 보여주기
	    });
	        
	    // .close 클래스를 가진 엘리먼트를 클릭했을 때 모달닫기
	    $('.close').click(function() {
	        $('.club-modal').css("visibility", "hidden"); // 모달 창 숨기기
	    });
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
	
	//데이터전달 확인용
	$(".update-button").on("click", function() {
		console.log($("#join_form").serialize()); // 폼 데이터 출력
		
		// 모든 로직이 성공적으로 수행된 후에만 폼 제출
	    // $("#join_form").submit();
		
	});
	
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
</html>