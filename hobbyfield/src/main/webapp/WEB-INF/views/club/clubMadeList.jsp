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

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

	body {
	  background-color: #3e94ec;
	  font-family: "Roboto", helvetica, arial, sans-serif;
	  font-size: 16px;
	  font-weight: 400;
	  text-rendering: optimizeLegibility;
	}

	div.table-title {
	   display: block;
	  margin: auto;
	  max-width: 600px;
	  padding:5px;
	  width: 100%;
	}

	.table-title h3 {
	   color: #fafafa;
	   font-size: 30px;
	   font-weight: 400;
	   font-style:normal;
	   font-family: "Roboto", helvetica, arial, sans-serif;
	   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	   text-transform:uppercase;
	}


	/*** Table Styles **/

	.table-fill {
	  background: white;
	  border-radius:3px;
	  border-collapse: collapse;
	  height: 320px;
	  margin: auto;
	  max-width: 600px;
	  padding:5px;
	  width: 100%;
	  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	  animation: float 5s infinite;
	}
	 
	th {
	  color:#D5DDE5;;
	  background:#1b1e24;
	  border-bottom:4px solid #9ea7af;
	  border-right: 1px solid #343a45;
	  font-size:23px;
	  font-weight: 100;
	  padding:24px;
	  text-align:left;
	  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	  vertical-align:middle;
	}

	th:first-child {
	  border-top-left-radius:3px;
	}
	 
	th:last-child {
	  border-top-right-radius:3px;
	  border-right:none;
	}
	  
	tr {
	  border-top: 1px solid #C1C3D1;
	  border-bottom-: 1px solid #C1C3D1;
	  color:#666B85;
	  font-size:16px;
	  font-weight:normal;
	  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
	}
	 
	tr:hover td {
	  background:#4E5066;
	  color:#FFFFFF;
	  border-top: 1px solid #22262e;
	}
	 
	tr:first-child {
	  border-top:none;
	}

	tr:last-child {
	  border-bottom:none;
	}
	 
	tr:nth-child(odd) td {
	  background:#EBEBEB;
	}
	 
	tr:nth-child(odd):hover td {
	  background:#4E5066;
	}

	tr:last-child td:first-child {
	  border-bottom-left-radius:3px;
	}
	 
	tr:last-child td:last-child {
	  border-bottom-right-radius:3px;
	}
	 
	td {
	  background:#FFFFFF;
	  padding:20px;
	  text-align:left;
	  vertical-align:middle;
	  font-weight:300;
	  font-size:18px;
	  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	  border-right: 1px solid #C1C3D1;
	}

	td:last-child {
	  border-right: 0px;
	}

	th.text-left {
	  text-align: left;
	}

	th.text-center {
	  text-align: center;
	}

	th.text-right {
	  text-align: right;
	}

	td.text-left {
	  text-align: left;
	}

	td.text-center {
	  text-align: center;
	}

	td.text-right {
	  text-align: right;
	}
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
					<c:forEach items="${clubMadeList}" var="List">
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
						<tbody class="table-hover">

							<tr>
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
				<div id="clubModal" class="club-modal">
					<div class="modal-body">
					<div align="center" class="update-top">
						<h2>소모임 수정</h2>					
					</div>
					
					<div>
						<input type="hidden" name="clubNumber" class="clubNumber" value="${clubMadeList.clubNumber }">
						<input type="hidden" name="clubProfile" class="clubProfile" value="${clubMadeList.clubProfile }">
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
						<input type="radio" name="clubPublic" value="${clubMadeList.clubPublic }" readonly />공개
					</div>
					
					<div>
						<label>질문1</label>
						<input type="text" name="singupQuestion1" value="${clubMadeList.singupQuestion1 }"><br>
						<label>질문2</label>
						<input type="text" name="singupQuestion2" value="${clubMadeList.singupQuestion2 }"><br>
						<label>질문3</label>
						<input type="text" name="singupQuestion3" value="${clubMadeList.singupQuestion3 }"><br>
					</div>
					
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

	//modal창 생성 닫기
	$(document).ready(function() {
	    $('#openModal').click(function() {
	        $('#clubModal').show(); // 모달 창 보여주기
	    });
	    $('.close').click(function() {
	        $('#clubModal').hide(); // 모달 창 숨기기
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

	function imgUploadHandler(list) {
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="clubImg" value="\${list[i].UUID}">
				           <input type="hidden" name="clubImgPath" value="\${list[i].url}">`
				$('#join_form').append(tag);
			}
		}
	
</script>
</html>