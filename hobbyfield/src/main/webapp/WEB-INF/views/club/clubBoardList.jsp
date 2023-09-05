<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글</title>

<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ckediotr.css">
 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/club/clubboard.css">
<!-- 임시 style 추후 삭제후 link를 통하여 사용 -->
<style type="text/css">
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;

}

	
	
	/* 모임신청 모달창 */
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
	<div align="center" style="margin-top: 150px;">
		<!-- 검색창 구현 : 사용자이름, 글내용으로 검색 : ajax 처리를 통해 검색된 내용만 다시 불러오도록.-->
		
			<!-- 검색창 -->
			<div class="search-div">
				<form id="searchForm" action="${pageContext.request.contextPath}/club/searchBoard"
					method="get">
					<input type="hidden" name="searchNum" id="searchNum" value="${club.clubNumber}" />
					<div>
						<input class="search-text" type="text" id="searchText"
							name="searchText" placeholder="검색어 입력"> 
						<img class="search-img" id="search-img" name="search-img"
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
					</div>
				</form>
			</div>


		<h1>게시글 목록</h1>
		<button type="button" onclick="location.href='clubInfo?clubNumber=${club.clubNumber}'">모임상세정보</button>
		<!-- Session 확인용 : 추후 삭제 -->
		<div>
			<div>email : ${member.memberEmail}</div>
			<div>닉네임 : ${profile.profileNickname}</div>
			<div>
				<img
					src="${pageContext.request.contextPath}/${profile.profileImgPath}${profile.profileImg}"
					style="width: 50px; height: 50px;">
			</div>
		</div>









		<!-- 게시물, 댓글을 묶는 div -->
		<!-- 차단한 유저는 나오지 않도록 추가 조건문 구현하기 -->
		<div id="clubBoardList">
			<!-- 게시글 -->
			<c:forEach items="${boardList}" var="board">
				<h3>게시글</h3>
				<div class="drop-button">
					<button></button>
				</div>
				<div id="boardMain"

					onclick="location.href='${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=${board.boardNumber}'">
					<p>글 번호 : ${board.boardNumber}</p>
					<p>작성자 : ${board.clubBoardWriter}</p>
					<div>${board.clubBoardContent}</div>
					<p id="writeDay">
						작성일 :
						<fmt:formatDate value="${board.clubBoardWdate}"
							pattern="yyyy-MM-dd" />
					</p>
					<p>${board.clubBoardViews}</p>
					<p>${board.clubBoardType}</p>
					<c:if test="${board.scheduleDate} ne null">
						<p>
							<fmt:parseDate value="${board.scheduleDate}" var="dateFmt"
								pattern="yyyyMMdd" />
							<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" />
						</p>
					</c:if>
					<!-- 블라인드는 추후 숨기고 가릴 경우 나오지않도록 구현 -->
					<p>블라인드 : ${board.clubBoardBlind}</p>
				</div>
			</c:forEach>

		</div>


		<!-- 사이드바1(왼) 소모임정보 : 소모임 이름, 멤버수, 초대버튼,  소모임 설정버튼(모임장만 보이도록)-->
		<div id="club-info">
			<div id="club-img">
				<img
					src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}"
					style="max-height: 300px; max-width: 300px;">
			</div>
			<div id="info">
				<p>모임 이름 : ${club.clubName}</p>
				<p>모임장 : ${club.profileNickname}</p>
				<p>모임설명 : ${club.clubInfo}</p>
				<p>지역 : ${club.majorLocation} ${club.subLocation}</p>
			</div>
			<!-- 글쓰기버튼 구현 : modal로 글쓰기 창이 나오도록 -->
			
			<div class="button-group">
				<c:choose>
					<c:when test="${profile ne null}">
						<div class="insert-Btn">
							<button id="openModalBtn">글쓰기</button>
							<button id="clubInfo">소모임 정보</button>
						</div>
					</c:when>
					<c:when test="${profile eq null}">
						<div class="join-Btn">
							<button id="joinClubBtn">가입신청하기</button>
						</div>
					</c:when>
				</c:choose>
			</div>
			</div>
		<!-- 사이드바2(오) 최근 사진, 글쓰기 버튼 -->
		<div>
		
		</div>
	</div>

	<!-- modal 모음 -->

	<!-- 글쓰기 modal -->
	<!-- 게시글 등록 modal-->
	<div id="boardInsertModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeModalBtn">&times;</span>
			<form name="insertForm" action="clubBoardInsert" method="post"
				enctype="multipart/form-data">
				<div>
					<h3>게시글 작성</h3>
				</div>

				<div>
					<textarea id="editorInsert" name="clubBoardContent"></textarea>
				</div>

				<div>
					<label>일정설정</label> <input type="date" id="insertScheduleDate"
						name="scheduleDate" value="">
				</div>
				
				<div>
					<input type="text" name="clubBoardWriter"
						value="${profile.profileNickname}">
				</div>
				<!-- 투표 등록시 투표 값이 들어올 div(투표 modal로 이동하는 창과 input hidden값 -->
				<div></div>
				<div>
					<button type="button" id="openVoteModal">투표생성</button>
				</div>
				<div>
					<!-- 추후 넣을값 : club_number, club_board_type -> -->
				</div>
				<div>
					<input type="text" id="clubNumber" name="clubNumber"
						value="${club.clubNumber}"> <input type="text"
						id="clubBoardType" name="clubBoardType" value="N">
				</div>
				<button type="button" id="insertBtn">등록</button>
				<button type="reset">취소</button>

			</form>
		</div>
	</div>

	<!-- 가입신청 modal -->
	<div id=applyModal class="modal">
		
		<form id="clubApply" action="clubApply" >
			
		</form>
	</div>
	
	<!-- 투표 modal -->
	<div id="voteModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeVoteModal">&times;</span>
			<h2>투표</h2>
			<input type="text" id="voteSubject" name="voteSubject"
				required="required" placeholder="투표제목">
			<div id="input-container">
				<!-- 초기에 2개의 input 태그 생성 -->
				<input type="text" name="voteOption1" required="required" placeholder="투표 옵션 1"> 
				<input type="text" name="voteOption2" required="required" placeholder="투표 옵션 2">
			</div>
			<button type="button" id="addInput">옵션 추가</button>
			<div id="tpye-checkbox">
				<input type="checkbox" id="voteMulti" value="">복수 투표
				<input type="checkbox" id="voteSecret" value="">무기명 투표
			</div>
			<div>
				<button id="inserVoteBtn" type="button">첨부하기</button>
			</div>
		</div>
	</div>

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
					<option value="${pro.profilNickname}">${pro.profileNickname}</option>
				</c:forEach>
			</div><br>
			<button type="submit">신청</button>
			<span class="close">&times;</span>
		</div>
	</div>
	</form>
		
		
		
		
		
</div>


<script type="text/javascript">
  $(document).ready(function(){
       // 글쓰기 작성시 날짜 기본값 오늘날짜로 
       $("#insertScheduleDate").val(new Date().toISOString().substring(0, 10));
       $("#openModalBtn").on("click", function(e) {
    	   
           $("#boardInsertModal").css("display", "block");
       });

       $("#closeModalBtn, #closeModal").on("click", function(e) {
           $("#boardInsertModal").css("display", "none");
       });
       
       $(window).on("click", function(event) {
    	  
           if (event.target === document.getElementById("boardInsertModal")) {
               $("#boardInsertModal").css("display", "none");
           }
       });
       
       $("#clubInfo").on("click",function(e){
    	   e.preventDefault();
       })
       
       
       $("#search-img").on("click", function(e){
			var search = $("searchText").val();
			var clubNum = ${club.clubNumber};
			$("#searchForm").submit();
			
		});
       
       
       $("#insertBtn").on("click", function(e){
        	$("form[name='insertForm']").submit();
       });
       
       
       
       var inputCount = 2;

       $("#addInput").on("click", function(e) {
    	   e.preventDefault();
           if (inputCount < 5) {
               inputCount++;
               var newInput = $('<input>').attr({
                   type: "text",
                   name: "voteOption" + inputCount,
                   required: "required",
                   placeholder: "투표 옵션 " + inputCount
               });
               $("#input-container").append(newInput);
           } else {
               alert("최대 5개까지 입력 가능합니다.");
           }
       });

      
       $("#openVoteModal").on("click", function(e) {
    	   e.preventDefault();
           $("#voteModal").css("display", "block");
       });

       $("#closeVoteModal").on("click", function(e) {
    	   e.preventDefault();
           $("#voteModal").css("display", "none");
       });  
       
       $(window).on("click", function (event) {
           if (event.target === document.getElementById("voteModal")) {
               $("#voteModal").css("display", "none");
           }
       });
       
       // 추가 투표 생성용 
       $("#insertVoteBtn").on("click", function (e) {
       		// 각 input값이 없으면 alert
        	$("#voteModal").css("display", "none");
    });

       
    // 에디터용
	

});	
	
   	ClassicEditor
   	.create( document.querySelector( '#editorInsert' ), {
   		language:"ko",
   		ckfinder: {
   			uploadUrl : '${pageContext.request.contextPath}/ckeditor/upload'
   		}
   	})
   	.then(editor => {
   	})
   	.catch( error => {
   	    console.error( error );
   	});
   	

	  
</script>
</body>
</html>