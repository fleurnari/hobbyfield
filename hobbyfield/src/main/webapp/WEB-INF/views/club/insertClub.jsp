<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/insertclub.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>소모임 등록</title>

</head>

<body>
<!-- 카테고리, 지역 대분류, 소분류 미구현  -->
<form action="insertClub" method="post">
	<div align="center" class="top">
		<div class="club_create_sub">
			<h2>소모임 정보</h2>		
		</div>
		<div>
		
			<div>
				<div>
					<label class="nick_name">닉네임</label>
					<input type="text" class="nick_input" name="profileNickname"><br>
				</div>
				<span class="nick_input_re1">사용 가능한 닉네임 입니다.</span>
				<span class="nick_input_re2">닉네임이 이미 존재합니다.</span>
				<span class="final_name_ck">사용할 닉네임을 입력하세요.</span>
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
				<!-- 테이블에서 불러올 수 있을지 의문 -->
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
					<c:forEach items="${E}" var="major" >					
						<option value="${major.subcode }">${major.literal }</option>
					</c:forEach>
				</select>
				
				<select class="sublocation" name="subLocation" id="subLocation">
					<c:forEach items="${F}" var="sub">
						<option value="${sub.subcode}">${sub.literal}</option>
					</c:forEach>
					
				</select><br>
			</div>
			
			<div>
				<label>공개여부 : </label>
				<input type="radio" name="clubPublic" value="P" checked="checked"/>공개
				<input type="radio" name="clubPublic" value="S" />비공개
			</div>
			
			<div>
				<label>질문1</label>
				<input type="text" name="singupQuestion1"><br>
				<label>질문2</label>
				<input type="text" name="singupQuestion2"><br>
				<label>질문3</label>
				<input type="text" name="singupQuestion3"><br>
			</div>
			
			<!-- 소모임 정원 default값 필요 -->
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="등록하기" >
			</div>
		</div>
	</div>
</form>


</body>

<script>

	// 유효성 검사 통과 유무 변수 
	var nickCheck = false; //닉네임 
	var nickchCheck = false; //닉네임 중복체크
	var clubName = false; //모임이름 
	var clubnameCheck = false; //모임이름 중복체크
	
$(document).ready(function(){
	//모임생성 버튼(모임생성 기능 작동)
	$(".join_button").on("click", function() {
		
		//입력값 변수
		var nick = $('.nick_input').val(); //닉네임 입력란
		var club = $('.club_input').val(); //소모임 이름 입력란 
		
		/* 닉네임 유효성검사 */
		if(nick == ""){
			$('.final_name_ck').css('display', 'block');
			nickCheck = false;
		}else{
			$('.final_name_ck').css('display', 'none');
			nickCheck = true;
		}
		
		/* 모임이름 유효성 검사*/
		if(clubName == ""){
			$('.final_club_ck').css('display', 'block');
			clubnameChk = false;
		}else{
			$('.final_club_ck').css('display', 'none');	
			clubnameChk = true;
		}
		
		/* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
		if(nickCheck&&nickchCheck&&clubName&&clubnameCheck){
		
		/* $("#join_form").attr("action", "/club/insetClub"); attr삭제해야 하는 이유? */
		/* $("#join_form").prop("action", "/club/insetClub"); */
        $("#join_form").submit();
			
		}
		
		return false;
	});
});	
	
	
	
//닉네임 중복체크
$('.nick_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트"); */
		
	var profileNickname = $('.nick_input').val();  //.nick_input 입력될값
	var data = {profileNickname : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick_input에 입력되는 값)
	
	$.ajax({
		type : "post",
		url : "nickChk",
		data : data,
		success : function(result) {
			/* console.log("성공" + result); */
			if(result != 'fail'){
				$('.nick_input_re1').css("display", "inline-block");
				$('.nick_input_re2').css("display", "none");
				nickchCheck = true;
			}else{
				$('.nick_input_re2').css("display", "inline-block");
				$('.nick_input_re1').css("display", "none");
				nickchCheck = false;
			}
		}// success 종료
	}); // ajax 종료
}); // function 종료


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
	            type: "POST",
	            url: "/", //  실제 URL로 변경.
	            data: { majorLocation: selectedMajor },
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
	
	
	

	/* 지역 대분류 소분류 카테고리 반응형 -> 공통코드 사용으로 인해 사용중지*/
	
	/* var subOptions = {
		    f1: ['종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구',
		    	'성북구', '강북구', '도봉구','노원구', '은평구', '서대문구', '마포구',
		    	'양천구', '강서구', '구로구', '금천구', '영등포구', '동작구', '관악구',
		    	'서초구', '강남구', '송파구', '강동구'],
		    		
		    f2: ['중구', '동구', '미추홀구', '연수구', '남동구', '부평구', '계양구',
		    	'서구', '강화군', '옹진군'],
		    		
		    f3: ['중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구',
		    	'해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'],
		    		
		    f4: ['중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군', '군위군'],
		    	
		    f5: ['동구', '서구', '남구', '북구', '광산구'],
		    
		    f6: ['동구', '중구', '서구', '유성구', '대덕구'],
		    
		    f7: ['중구', '남구', '동구', '북구', '울주군'],
		    
		    f8: [''],
		    
		    f9: ['수원시', '고양시', '용인시', '성남시', '부천시', '화성시', '안산시',
		    	'남양주시', '안양시', '평택시', '시흥시', '파주시', '의정부시', '김포시',
		    	'광주시', '광명시', '군포시', '하남시', '오산시', '양주시', '이천시', '구리시',
		    	'안성시', '포천시', '의왕시', '여주시', '동두천시',	'과천시'],
		    	
		    f10: ['춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시'],
		    
		    f11: ['청주시', '충주시', '제천시'],
		    
		    f12: ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시'],
		    
		    f13: ['전주시', '군산시', '익산시', '정읍시', '남원시', '김제시'],
		    
		    f14: ['목포시', '여수시', '순천시', '나주시', '광양시'],
		    
		    f15: ['포항시', '경주시', '김천시', '안동시', '구미시', '영주시', '영천시', '상주시', '문경시', '경산시'],
		    
		    f16: ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시'],
		    
		    f17: ['제주시', '서귀포시']
		    
		}
	
	 $(document).ready(function() {
	        $('.majorlocation').change(function() {
	            var selectedMajor = $(this).val();
	            updateSubLocationOptions(selectedMajor);
	        });
	    });

        function updateSubLocationOptions(major) {
            var subLocations = subOptions[major] || [];
            var subLocationSelect = $('.sublocation');
            
            subLocationSelect.empty(); // 기존 옵션 제거

            // 새로운 지역구 옵션 추가
            $.each(subLocations, function(index, item) {
                subLocationSelect.append('<option value="' + item + '">' + item + '</option>');
            });
        } */


	
</script>
</html>