<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/club/clubboard.css">

<style type="text/css">
.ck.ck-editor {
	width: 50%;
	max-width: 500px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;
}

/* 페이지 배경 스타일 */
body {
	background-color: #f4f4f4;
	font-family: Arial, sans-serif;
}

.writer-img {
	display: inline-block;
	width: 50px;
	height: 50px;
	width: 50px;
}

/* 더 많은 스타일을 원하는 대로 추가하세요. */
</style>
</head>
<body>
	<div align="center" style="margin-top: 150px;">
		<!-- 검색창 구현 : 사용자이름, 글내용으로 검색 : ajax 처리를 통해 검색된 내용만 다시 불러오도록.-->
		<!-- 검색창 -->
		<div class="search-div">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/club/searchBoard"
				method="get">
				<input type="hidden" name="searchNum" id="searchNum"
					value="${club.clubNumber}" />
				<div>
					<input class="search-text" type="text" id="searchText"
						name="searchText" placeholder="검색어 입력"> <img
						class="search-img" id="search-img" name="search-img"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</form>
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




		<!-- 차단한 유저는 나오지 않도록 추가 조건문 구현하기 -->
		<!-- 게시글 리스트 -->
		<div id="boardList">
			<c:forEach items="${boardList}" var="board">
				<div class="boardMain" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=${board.boardNumber}'">
					<div class="board-head">
						<h3>게시글</h3>
					</div>
					<div class="board-writer">
						<img class="writer-img"
							src="${pageContext.request.contextPath}/${board.profileImgPath}${board.profileImg}">
						<p>작성자 : ${board.clubBoardWriter}</p>
						<p class="write-day">
							작성일 :
							<fmt:formatDate value="${board.clubBoardWdate}" dateStyle="full" />
						</p>
					</div>
					<div class="board-main">
						<div class="board-content-list">${board.clubBoardContent}</div>
						<p class="club-view">${board.clubBoardViews}</p>
						<c:if test="${board.scheduleDate} ne null">
							<p>
								<fmt:formatDate value="${board.scheduleDate}" dateStyle="full" />
							</p>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 사이드바1(왼) 소모임정보 : 소모임 이름, 멤버수, 초대버튼,  소모임 설정버튼(모임장만 보이도록)-->
	<div class="left-side">
		<div id="club-info">
			<div id="club-img">
				<img
					src="${pageContext.request.contextPath}${club.clubImgPath}/${club.clubImg}"
					style="height: 300px; width: 300px;">
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
						<button
							onclick="location.href='${pageContext.request.contextPath}/club/clubManage?clubNumber=${club.clubNumber}'">관리</button>
						<button type="button" id="boardModalBtn" class="modal-open-btn">글
							쓰기</button>
					</c:when>
					<c:when test="${profile eq null}">
						<div class="guest-btn">
							<button type="button" id="joinModalBtn" class="modal-open-btn">가입
								신청</button>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- 사이드바2(오) 최근 사진, 글쓰기 버튼 -->
	<div class="rigth-side">
		<div></div>
	</div>

	<!-- modal 모음 -->
	<!-- 글쓰기 modal -->
	<!-- 게시글 등록 modal-->
	<div id="boardMainModal" class="main-modal">
		<div id="boardContentModal" class="content-modal">
			<span id="closeBoardModal" class="close">&times;</span>
			<form name="insertForm" action="clubBoardInsert" method="post"
				enctype="multipart/form-data">
				<div class="board-head">
					<h3>게시글 작성</h3>
				</div>

				<div class="board-content">
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
					<button type="button" id="openVoteModal" class="modal-open-btn">투표생성</button>
				</div>
				<div>
					<!-- 추후 넣을값 : club_number, club_board_type -> -->
				</div>
				<div>
					<!-- from으로 보내기 위한 데이터 추후 hidden으로 -->
					<input type="text" id="clubNumber" name="clubNumber"
						value="${club.clubNumber}"> <input type="text"
						id="clubBoardType" name="clubBoardType" value="N">
				</div>
				<button type="button" id="insertSubmitBtn">등록</button>
				<button type="reset">취소</button>

			</form>
		</div>
	</div>

	<!-- 소모임 가입 modal (시작)-->
	<div id="joinMainModal" class="main-modal">
		<div id="joinContentModal" class="content-modal">
			<span id="closeJoinModal" class="close">&times;</span>
			<form action="clubJoinProcess" method="POST" id="clubJoinForms">
				<p class="club-name">${club.clubName}</p>
				<p class="join-head">가입질문에 대답해주세요</p>
					<div class="profile-list">
						<label>프로필</label>
						<c:forEach items="${profiles}" var="pro">
							<select name="profileNickname">
									<option value="${pro.profileNickname}">${pro.profileNickname}</option>
							</select>
						</c:forEach>
						<c:if test="${fn:length(profiles) > 3 }">
							<button type="button" id="profileModalBtn" class="modal-open-btn">
							프로필 생성</button>
						</c:if>
					</div>
				<div class="join-question">
					<h3>가입 질문 답변</h3><br> 
					<label>${club.singupQuestion1}</label><br> 
					<input type="text" name="applyAnswer1"><br> 
					<label>${club.singupQuestion2}</label><br>
					<input type="text" name="applyAnswer2"><br> 
					<label>${club.singupQuestion3}</label><br>
					<input type="text" name="applyAnswer3"><br> 
					<!-- hidden data -->
					<input type="hidden" value="H1" name="applyStatus"> 
					<input type="hidden" name="clubNumber" value="${club.clubNumber}">
				</div>
				<div>
					<button type="button" id="joinSubmit" class="submit-btn">신청</button>
					<button>취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 소모임 가입 modal (끝) -->

	<!-- 투표 modal -->
	<div id="voteMainModal" class="main-modal">
		<div id="voteContentModal" class="content-modal">
			<span class="close" id="closeVoteModal">&times;</span>
			<h2>투표</h2>
			<input type="text" id="voteSubject" name="voteSubject"
				required="required" placeholder="투표제목">
			<div id="input-container">
				<!-- 초기에 2개의 input 태그 생성 -->
				<input type="text" name="voteOption1" required="required"
					placeholder="투표 옵션 1"> <input type="text"
					name="voteOption2" required="required" placeholder="투표 옵션 2">
			</div>
			<button type="button" id="addInput">옵션 추가</button>
			<div id="tpye-checkbox">
				<input type="checkbox" id="voteMulti" value="">복수 투표 <input
					type="checkbox" id="voteSecret" value="">무기명 투표
			</div>
			<div>
				<button type="button" id="voteSubmit" class="submit-btn">첨부하기</button>
			</div>
		</div>
	</div>





	<!-- 프로필 생성 modal -->
	<div id="profileMianModal" class="main-modal">
		<div id="profileContentModal" class="content-modal">
			<span id="closeProfileModal" class="close">&times;</span>
			<form action="profileInsert" method="post" id="join-form">
				<div class="profile-info">
					<h2>프로필 정보</h2>
					<br>
				</div>

				<div>
					<div>
						<label class="nick-name">닉네임</label> <input type="text"
							class="nick-input" name="profileNickname"><br>
					</div>
					<span class="nick-input-re1">사용 가능한 닉네임 입니다.</span> <span
						class="nick-input-re2">닉네임이 이미 존재합니다.</span> <span
						class="final-name-ck">사용할 닉네임을 입력하세요.</span>
					<c:if test="${not empty errorMessage}">
						<div class="error">${errorMessage}</div>
					</c:if>

				</div>


				<div class="profileSection">
					<label>첨부이미지</label>
					<div id="preview"></div>
					<input name="uploadFile" type="file" value="profileImg"
						id="profileImg" onchange="readURL(this);">
					<button type="button" id="uploadBtn">upload</button>
				</div>

				<div class="join-button-wrap">
					<button type="button" id="profileSubmitBtn" class="submit-btn">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">

   var currentPage = 2;  // 현재 페이지 번호 초기화
   var pageSize = 10;    // 페이지 크기 초기화
   var isLoading = false; // 중복 요청을 확인

   $(document).ready(function(){
     //Modal 생성  

      $(".modal-open-btn").on("click", function(event) {
    	  if(event.target === document.getElementById("joinModalBtn")) {
    		  $("#joinMainModal").css("display", "block");
          }
    	  if(event.target === document.getElementById("profileModalBtn")) {
    		  $("#profileMianModal").css("display", "block");
          }
    	  if(event.target === document.getElementById("boardModalBtn")) {
    		  $("#boardMainModal").css("display", "block");
          }
    	  if(event.target === document.getElementById("voteModalBtn")) {
    		  $("#voteMainModal").css("display", "block");
          }
          
       });
     // 닫기버튼
     $(".close").on("click", function(event) {      
        if (event.target === document.getElementById("closeJoinModal")) {
             $("#joinMainModal").css("display", "none");
        }
        if(event.target === document.getElementById("closeProfileModal")){
            $("#profileMianModal").css("display", "none");
        }
        if(event.target === document.getElementById("closeBoardModal")){
            $("#boardMainModal").css("display", "none");
        }
      });
     $(document).click(function() {
    	    var container = $("#container");
    	    if (!container.is(event.target) && !container.has(event.target).length) {
    	        container.hide();
    	    }
    	});
     
     
     $(document).mouseup(function (e) {
          if (event.target === document.getElementById("boardInsertModal")) {
              $("#boardInsertModal").css("display", "none");
          }
          if(event.target === document.getElementById("boardInsertModal")){
             $("#boardInsertModal").css("display", "none");
          }
          if(event.target === document.getElementById("boardInsertModal")){
             $("#boardInsertModal").css("display", "none");
          }
      });
       
      $("#clubInfo").on("click",function(e){
         e.preventDefault();
      })
      
       
       $("#search-img").on("click", function(e){
         var search = $("searchText").val();
         //var clubNum = ${club.clubNumber};
         $("#searchForm").submit();
         
      });
       
       // submit
       $(".submit-btn").on("click", function(e){
           if(event.target === document.getElementById("boardInsertModal")){
       	   		$("form[name='insertForm']").submit();        	   
           }
           
       });
       
       
       
       
       // 날짜 자동지정
       $("#insertScheduleDate").val(new Date().toISOString().substring(0, 10));
       // 투표 옵션 추가
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
       
     });
      

       
       
     

       
        //프로필 등록 버튼
      $(".join-button").on("click", function() {  
         //입력값 변수
         var nick = $('.nick-input').val(); //닉네임 입력란
         
         /* 닉네임 유효성검사 */
         if(nick == ""){
            $('.final-name-ck').css('display', 'block');
            nickCheck = false;
         }else{
            $('.final-name-ck').css('display', 'none');
            nickCheck = true;
         }
         
      
         $.ajax({
               type: "POST",
               url: "${pageContext.request.contextPath}/club/profileCount",
               data: { email: "${member.memberEmail}" },
               success: function(count) {
                   if(count >= 3) {
                       alert("프로필은 최대 3개까지만 생성할 수 있습니다.");
                       return false;
                   } else {
                       // 모든 검사를 통과한 경우 form 제출
                       if(nickCheck && nickchCheck) {
                           $("#join-form").submit();
                       }
                   }
               }
           });
         
         return false;
      });
  
    // 페이징
    $(window).off('scroll').on('scroll', function() {
         if (!isLoading && $(window).scrollTop() + $(window).height() == $(document).height()) {
             isLoading = true; // 요청 시작 전 플래그 설정

             $.ajax({
                 url: "${pageContext.request.contextPath}/club/clubBoardScroll",
                 data: {
                     startPage: (currentPage - 1) * pageSize + 1, 
                      endPage: currentPage * pageSize
      
                 },
                 type: 'GET',
                 dataType: 'json',
                 success: function(boards) {
                    console.log("현재페이지:", currentPage);  // 현재 페이지 번호 출력
                     console.log("반횐된 데이터:", boards);     // 반환된 소모임 데이터 출력
                 
                     if (boards.length > 0) {
                         $.each(boards, function(index, board) {
                             $('#boardList').append(`
                                   
                            		 <div class="boardMain">
                            	      <h3>게시글</h3>
                            	      <div class="drop-button">
                            	        <img src="${pageContext.request.contextPath}/resources/images/vertical.svg">
                            	      </div>
                            	      <div onclick="location.href='${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=${board.boardNumber}'">
                            	        <p>글 번호: \${board.boardNumber}</p>
                            	        <p>작성자: \${board.clubBoardWriter}</p>
                            	        <div>\${board.clubBoardContent}</div>
                            	        <p class="writeDay">
                            	          작성일:
                            	          <fmt:formatDate value="${board.clubBoardWdate}" pattern="yyyy-MM-dd" />
                            	        </p>
                            	        <p>\${board.clubBoardViews}</p>
                            	        <p>\${board.clubBoardType}</p>
                            	        <c:if test="${board.scheduleDate ne null}">
                            	          <p>
                            	            <fmt:parseDate value="${board.scheduleDate}" var="dateFmt" pattern="yyyyMMdd" />
                            	            <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" />
                            	          </p>
                            	        </c:if>
                            	      </div>
                            	    </div>
                             `);
                         });
                         
                         currentPage++; 
                     }
                     isLoading = false; 
                 },
                 error: function(error) {
                    console.error("무한 스크롤 에러", error);
                     showError("데이터 로딩 중 오류가 발생했습니다. 다시 시도해 주세요.");
                     isLoading = false; 
                 }
             });
         }
     });   

   function showError(message) {
       let errorDiv = $("#errorDiv");
       if (!errorDiv.length) {
           $("body").prepend('<div id="errorDiv" style="background-color: red; color: white; text-align: center; padding: 10px; position: fixed; top: 0; left: 0; right: 0;">' + message + '</div>');
           setTimeout(function() {
               $("#errorDiv").fadeOut().remove();
           }, 3000); // 3초 후 에러 메시지 제거
       }
   }
   
	// imgUploadHandler
	function imgUploadHandler(list) {
		if(event.target === document.getElementById("profileImg")){
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="profileImg" value="\${list[i].UUID}">
				           <input type="hidden" name="profileImgPath" value="\${list[i].url}">`
				$('#join_form').append(tag);
			}
		}
	}
   //에디터용
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