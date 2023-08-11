<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/club/insertclub.css?v=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>소모임 등록</title>
</head>

<body>
<!-- 카테고리, 지역 대분류, 소분류 미구현  -->
<form action="insertClub" method="post">
	<div align="center">
		<div>
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
				<span class="club input_re2">모임 이름이 이미 존재합니다. </span>
				<span class="final_club_ck">모임 이름을 정해주세요</span>
			</div>
			
			<div>
			<!-- 임시 -->
				<select>
					<option>가족</option>
					<option>스터디</option>
					<option>취미(동호회)</option>
					<option>운동</option>
					<option>학교</option>
					<option>팬밴드</option>
					<option>회사</option>
					<option>게임</option>
					<option>음악</option>
				</select>
			
				<label>소모임 카테고리</label>
			
				<input type="text" name="clubCategory"><br>
			</div>
			
			<div>
				<label>소모임 분류</label>
				<input type="radio" name="clubType" value="N" checked="checked"/>일반
				<input type="radio" name="clubType" value="C" />챌린지<br>
			</div>
			
			<div>
				<label>소모임 소개</label>
				<input type="text" name="clubInfo"><br>
			</div>
			
			<div>
				<label>광역지역</label>
				<select class="majorlocation" name="majorLocation">
					<option value="f1">서울</option>
					<option value="f2">인천</option>
					<option value="f3">부산</option>
					<option value="f4">대구</option>
					<option value="f5">광주</option>
					<option value="f6">대전</option>
					<option value="f7">울산</option>
					<option value="f8">세종</option>
					<option value="f9">경기도</option>
					<option value="f10">강원도</option>
					<option value="f11">충북</option>
					<option value="f12">충남</option>
					<option value="f13">전북</option>
					<option value="f14">전남</option>
					<option value="f15">경북</option>
					<option value="f16">경남</option>
					<option value="f17">제주도</option>
				</select>
				
				<select class="sublocation" name="subLocation">
					<option value="e1">강남구</option>
				</select><br>
			</div>
			
			<div>
				<label>공개여부</label>
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
	$(".join_button").click(function() {
		
		//입력값 변수
		var nick = $('.nick_input').val(); //닉네임 입력란
		console.log(nick);
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
		
		/* 최종 유효성 검사를 진행하고 form에 말아서 전달 */
		if(nickCheck&&nickchCheck&&clubName&&clubnameCheck){
		
		$("#join_form").attr("action", "/club/insetClub");
        $("#join_form").submit();
			
		}
		
		return false;
	});
});	
	
//닉네임 중복체크
$('.nick_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트"); */
		
	var profileNickname = '둘리'/* $('.nick_input').val(); */ //.nick_input 입력될값
	console.log(profileNickname);
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
			}else {
				$('.nick_input_re2').css("display", "inline-block");
				$('.nick_input_re1').css("display", "none");
				nickchCheck = false;
			}
		}// success 종료
	}); // ajax 종료
}); // function 종료

	
	
	
	
	
	
	
	
	
	/* 지역 대분류 소분류 카테고리 미완-진행중 */
	
	 var majorLocation = document.querySelector('.major-location');
	
	majorLocation.onchange = function() {
		var subLocation = document.querySelector('.sub-location');
		var mainOption = majorLocation.option[majorLocation.selectedIndex].value;
	}
	
	var subOptions = {
		    f1: ['종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구',
		    	'성북구', '강북구', '도봉구','노원구', '은평구', '서대문구', '마포구',
		    	'양천구', '강서구', '구로구', '금천구', '영등포구', '동작구', '관악구',
		    	'서초구', '강남구', '송파구', '강동구'],
		    		
		    f2: ['중구', '동구', '미추홀구', '연수구', '남동구', '부평구', '계양구',
		    	'서구', '강화군', '옹진군'],
		    		
		    f3: ['중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구',
		    	'해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'],
		    		
		    f4: ['중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군', '군위군'],
		    	
		    f5: ['동구'/ '서구'/ '남구'/ '북구'	/ '광산구'],
		    
		    f6: ['동구', '중구', '서구', '유성구', '대덕구'],
		    
		    f7: ['중구'/ '남구'/ '동구'/ '북구'	/ '울주군'],
		    
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

		switch (mainOption) {
		    case '서울':
		        var subOption = subOptions.f1;
		        break;
		    case '인천':
		        var subOption = subOptions.f2;
		        break;
		    case '부산':
		        var subOption = subOptions.f3;
		        break;
		    case '대구':
		        var subOption = subOptions.f4;
		        break;
		    case '광주':
		        var subOption = subOptions.f5;
		        break;
		    case '대전':
		        var subOption = subOptions.f6;
		        break;
		    case '울산':
		        var subOption = subOptions.f7;
		        break;
		    case '세종':
		        var subOption = subOptions.f8;
		        break;
		    case '경기도':
		        var subOption = subOptions.f9;
		        break;
		    case '강원도':
		        var subOption = subOptions.f10;
		        break;
		    case '충북':
		        var subOption = subOptions.f11;
		        break;
		    case '충남':
		        var subOption = subOptions.f12;
		        break;
		    case '전북':
		        var subOption = subOptions.f13;
		        break;
		    case '전남':
		        var subOption = subOptions.f14;
		        break;
		    case '경북':
		        var subOption = subOptions.f15;
		        break;
		    case '경남':
		        var subOption = subOptions.f16;
		        break;
		    case '제주도':
		        var subOption = subOptions.f17;
		        break;
		}
	
	subLocation.option.length = 0;
	
	for(var i = 0; i < subOption.length; i++ ){
		var option = document.createElement('option');
		option.value = subOption[i];
		subLocation.appen(option);
	} 
</script>
</html>