<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 세부조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
/* 모달X 일반창  */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .info-section {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        ul li img {
            max-width: 100%;
            border-radius: 10px;
        }

        ul li strong {
            font-weight: bold;
        }

	/*모달창 */
    /* ... 기존 스타일 ... */
   .clubModal {
        display: none; /* 초기에 모달을 숨깁니다. */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5); /* 반투명한 검은색 배경 */
        z-index: 1; /* 다른 요소 위에 위치 */
    }

    .modal_body {
        width: 25%; /* 화면의 1/3 */
        height: 80%; /* 화면의 1/3 */
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
        right: 10px;
        top: 10px;
        cursor: pointer;
    }
</style>
</head>
<body>
<section>
	<!-- 소모임 가입 modal (시작)-->
	<form action="clubJoinProcess" method="POST">
	<div id="clubModal" class="clubModal">
		<div class="modal_body">
			<div>
		<button onclick="hreclubManage=clubNumber?${clubInfo.clubNumber}">관리</button>
			<!-- 모임 신청 질문 가져오기 -->
				<label>모임소개 : ${clubInfo.clubInfo}</label><br>
				<label>카테고리 : ${clubInfo.clubCategory}</label><br>
				<label>모임장 : ${clubInfo.profileNickname}</label><br>
				<label>모임유형 : ${clubInfo.clubType}</label><br>
				<label>모임지역 : ${clubInfo.majorLocation}</label><br>
				<label>모임인원 : count되게 작성해야함 50/50</label>
				<h3>가입 질문 답변</h3><br>
				<label>${clubInfo.singupQuestion1}</label><br>
				<input type="text" name="applyAnswer1"><br>
				<label>${clubInfo.singupQuestion2}</label><br>
				<input type="text" name="applyAnswer2"><br>
				<label>${clubInfo.singupQuestion3}</label><br>
				<input type="text" name="applyAnswer3"><br>
				<input type="hidden" value="H1" name="applyStatus">
				<input type="hidden" name="clubNumber" value="${clubInfo.clubNumber}">
				<input type="hidden" name="profileNickname" value="${profile.profileNickname}">
				<c:forEach items="${profile}" var="pro">
					<option value="${pro.profileNickname}">${pro.profileNickname}</option>
				</c:forEach>
			</div><br>
			<button type="submit">신청</button>
			<span class="close">&times;</span>
		</div>
	</div>
	</form>
	<!-- 소모임 가입 modal (끝)-->

    <div class="info-section">
        <h2>${clubInfo.clubName}</h2>
        <ul>
            <li><strong>카테고리:</strong> ${clubInfo.clubCategory}</li>
            <li><strong>모임장 닉네임:</strong> ${clubInfo.profileNickname}</li>
            <li><strong>모임 유형:</strong> ${clubInfo.clubType}</li>
            <li><strong>모임 정보:</strong> ${clubInfo.clubInfo}</li>
            <li><strong>대표 지역:</strong> ${clubInfo.majorLocation}</li>
            <li><strong>하위 지역:</strong> ${clubInfo.subLocation}</li>
            <li><img src="${clubInfo.clubImgPath}${clubInfo.clubImg}" alt="모임 이미지"></li>
        </ul>
	    <c:if test="${profile.profileNickName} eq ${clubInfo.profileNickname}">    
		    <div>
		    	<button type="button" onclick="location.href='clubManage?clubNumber=${clubInfo.clubNumber }'">소모임 가입 신청자 조회</button>
		    </div>
	    </c:if>
    </div>
    
     <div>
    	<button type="button" onclick="location.href='clubManage?clubNumber=${clubInfo.clubNumber}'">가입 신청한 회원</button>
    </div>
    
    <div>
    	<button type="button">삭제</button>
    </div>
    
    <div>
    	<button type="button" class="club-join" id="openModal">소모임 가입</button>
    </div>
</section>  
  
<script type="text/javascript">

//modal창 생성 닫기
	$(document).ready(function() {
	    $('#openModal').click(function() {
	        $('#clubModal').show(); // 모달 창 보여주기
	    });
	    $('.close').click(function() {
	        $('#clubModal').hide(); // 모달 창 숨기기
	    });
	});


	//club 삭제버튼 (모임장만 보이게 해야하며/정말 삭제하시겠습니까 경고창 필요)
	let msg = `${result}`;
	if(msg != null && msg !='') alert(msg);
	
	$('button[type="button"]').on('click', ajaxDeletClub);

	function ajaxDeletClub(e){
		let clubNumber = e.currentTarget.closet
	}
	

</script>

</body>
</html>
