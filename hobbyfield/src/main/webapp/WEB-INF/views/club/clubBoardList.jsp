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
</style>
</head>
<body>
	<div align="center" style="margin-top: 150px;">
		<!-- 검색창 구현 : 사용자이름, 글내용으로 검색 : ajax 처리를 통해 검색된 내용만 다시 불러오도록.-->
		<div>
			<!-- 검색창 -->
			<div class="search-div">
				<form id="searchForm" action="${pageContext.request.contextPath}/club/searchBoard"
					method="get">
					<input class="search-text" type="text" id="searchText"
						name="searchText" placeholder="검색어 입력"> <img
						class="search-img" id="search-img" name="search-img"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</form>
			</div>
		</div>

		<h1>게시글 목록</h1>
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

			<!-- 해당 게시물 댓글 댓글 -->
			<c:forEach items="${commentList}" var="comment">
				<div id="commentMain">
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
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
				<!-- 작성자 값 추후 seesion을 통해 넣을 수 있도록 설정   -->
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


	<!-- 투표 modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeVoteModal">&times;</span>
			<h2>투표</h2>
			<input type="text" id="voteSubject" name="voteSubject"
				placeholder="투표제목">
			<div id="input-container">
				<!-- 초기에 3개의 input 태그 생성 -->
				<input type="text" name="option1" placeholder="투표 옵션 1"> <input
					type="text" name="option2" placeholder="투표 옵션 2"> <input
					type="text" name="option3" placeholder="투표 옵션 3">
			</div>
			<button type="button" id="addInput">옵션 추가</button>
			<div id="tpye-button">
				<button>복수 투표</button>
				<button>무기명 투표</button>
				<button></button>
			</div>
			<div>
				<button id="inserBoardtBtn" type="submit">첨부하기</button>
			</div>
		</div>
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
       
       
       
       var inputCount = 0;

       $("#addInput").on("click", function(e) {
    	   e.preventDefault();
           if (inputCount < 5) {
               inputCount++;
               var newInput = $('<input>').attr({
                   type: "text",
                   name: "option" + inputCount,
                   placeholder: "투표 옵션 " + inputCount
               });
               $("#input-container").append(newInput);
           } else {
               alert("최대 5개까지 입력 가능합니다.");
           }
       });

      
       $("#openVoteModal").on("click", function(e) {
    	   e.preventDefault();
           $("#myModal").css("display", "block");
       });

       $("#closeVoteModal").on("click", function(e) {
    	   e.preventDefault();
           $("#myModal").css("display", "none");
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