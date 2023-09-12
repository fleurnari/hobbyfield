j<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor--editable {
	height: 60vh;
}

#emptyBoard {
	width: 800px;
	height: 500px;
	background-color: #ffffff;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
	padding: 15px;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
	cursor: pointer;
	margin-top: 50px;
	
	
}

#emptyBoard img {
	width: 75px;
	height: 75px;
	opacity: 0.8;
}

body {
	background-color: #f4f4f4;
	font-family: Arial, sans-serif;
}

.board-content img {
	max-width: 200px;
	max-height: 200px;
}

#emptyBoard:nth-child(1) {
	font-weight: bold;
}

#emptyBoard:nth-child(2) {
	opacity: 0.5;
}
/* 제일 상단 소모임명 표시 */
</style>
</head>
<body>
	<div align="center" style="margin-top: 10px; margin-bottom: 600px;">
		<!-- 검색창 구현 : 사용자이름, 글내용으로 검색 : ajax 처리를 통해 검색된 내용만 다시 불러오도록.-->
		<!-- 검색창 -->
		
		<div class="search-div">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/club/searchBoard"
				method="get">
				<input type="hidden" name="searchNum" id="searchNum"
					value="${club.clubNumber}" /> <input class="search-text"
					type="text" id="searchText" name="searchText" placeholder="검색어 입력"
					value=""> <img class="search-img" id="search-img"
					name="search-img"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

			</form>
		</div>
		
		
		<c:choose>
		<c:when test="${profile ne null}">
			<div id="headBoxBoard" class="boardMain"
				style="width: 800px; height: 100px; text-align: left; padding-top: px; border-radius: 5px;">
				<p>새로운 소식을 남겨보세요</p>
				<p>소모임에 소속된 멤버라면 누구나 작성 가능합니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<div id="headBoxJoin" class="boardMain"
			style="width: 800px; height: 100px; text-align: left; padding-top: px; border-radius: 5px;">
			<p>새로운 소식을 남겨보세요</p>
			<p>소모임에 소속된 멤버라면 누구나 작성 가능합니다.</p>
		</div>
		</c:otherwise>
		</c:choose>

		<!-- 차단한 유저는 나오지 않도록 추가 조건문 구현하기 -->
		<!-- 게시글 리스트 -->
		<c:if test="${boardList ne null}">
			<div id="boardList">
				<c:forEach items="${boardList}" var="board">
					<div class="boardMain"
						onclick="location.href='${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=${board.boardNumber}'">
						<div class="board-head">
							<div class="writer-img">
								<img
									src="${pageContext.request.contextPath}${board.profileImgPath}${board.profileImg}">
							</div>
							<div class="writer-info">
								<p>${board.clubBoardWriter}</p>
								<p class="write-day">
									작성일 :
									<fmt:formatDate value="${board.clubBoardWdate}"
										dateStyle="full" />
								</p>
							</div>
						</div>
						<div class="board-list-content">
							<div>${board.clubBoardContent}</div>
							<p class="club-view">
								<span></span>${board.clubBoardViews}</p>
							<c:if test="${board.scheduleDate} ne null">
								<p>
									<fmt:formatDate value="${board.scheduleDate}" dateStyle="full" />
								</p>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		
		<c:if test="${(fn:length(borardList) eq 0) || (boardList eq null) }">
			<div id="emptyBoard">
				<img style="margin-top: 180px;"
					src="${pageContext.request.contextPath}/resources/images/postcard.png">
				<p style="margin-top: 30px;">그룹 페이지</p>
				<p>새 게시물을 작성해 주세요</p>
			</div>
		</c:if>

		<!-- 사이드바1(왼) 소모임정보 : 소모임 이름, 멤버수, 초대버튼,  소모임 설정버튼(모임장만 보이도록)-->


		<div class="left-side">
			<div class="club-img">
				<img
					src="${pageContext.request.contextPath}${club.clubImgPath}${club.clubImg}">
			</div>
			<div class="club">
				<h3>${club.clubName}</h3>
				<p>모임장 : ${club.profileNickname}</p>
				<p>모임설명 : ${club.clubInfo}</p>
				<p>지역 : ${club.majorLocation} ${club.subLocation}</p>
			</div>
			<!-- 글쓰기버튼 구현 : modal로 글쓰기 창이 나오도록 -->

			<div class="button-group">
				<c:choose>
					<c:when test="${profile ne null}">
						<button type="button" class="modal-open-btn"
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

		<!-- 사이드바2(오) 최근 사진, 글쓰기 버튼 -->





	</div>
	<div class="rigth-side">
		<div></div>
	</div>

	<!-- modal 모음 -->
	<!-- 글쓰기 modal -->
	<!-- 게시글 등록 modal-->
	<div id="boardMainModal" class="main-modal">
		<div id="boardContentModal" class="content-modal">
			<span id="closeBoardModal" class="close">&times;</span>
			<form id="insertForm" name="insertForm" action="clubBoardInsert"
				method="post" enctype="multipart/form-data">
				<div class="board-modal-head">
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
<!-- 				<div id="voteValue"></div> -->
<!-- 				<div id="option button"> -->
<!-- 					<button type="button" id="openVoteModal" class="modal-open-btn">투표생성</button> -->
<!-- 				</div> -->
				<!-- 공지 설정은 모임장일 경우에만 보이도록 선택되지않을경우 자동으로 N으로-->
				<div>
<%-- 					<c:if test="${profile.profileNickname eq club.profileNickname}"> --%>
<!-- 						<input type="checkbox" id="" name="clubBoardType">공지사항등록 -->
<%-- 					</c:if> --%>
				</div>
				<div>
					<!-- from으로 보내기 위한 데이터 추후 hidden으로 -->
					<input type="text" id="clubBoardType" name="clubBoardType"
						value="N"> <input type="hidden" id="clubNumber"
						name="clubNumber" value="${club.clubNumber}">
				</div>

				<div id="boardBtn">
					<button type="button" id="boardSubmitBtn" class="submit-btn">등록</button>
					<button type="button" id="boardResetBtn" class="reset-btn">취소</button>
				</div>

			</form>
		</div>
	</div>

	<!-- 소모임 가입 modal (시작)-->
	<div id="joinMainModal" class="main-modal">
		<div id="joinContentModal" class="content-modal">
			<span id="closeJoinModal" class="close">&times;</span>
			<form action="clubJoinProcess" method="POST" id="clubJoinForms"
				name="clubJoinForms">
				<p class="club-name">${club.clubName}</p>
				<p class="join-head">가입질문에 대답해주세요</p>
				<div class="profile-list">
					<label>프로필</label>
					<c:if test="${profileList ne null}">
						<select name="profileNickname">
							<c:forEach items="${profileList}" var="pro">
								<option value="${pro.profileNickname}">${pro.profileNickname}</option>
							</c:forEach>
						</select>
					</c:if>
					<c:if test="${fn:length(profileList) < 3 }">
						<button type="button" id="profileModalBtn" class="modal-open-btn">
							프로필 생성</button>
					</c:if>
				</div>
				<div class="join-question">
					<h3>가입 질문 답변</h3>
					<br> <label>${club.singupQuestion1}</label><br> <input
						type="text" name="applyAnswer1"><br> <label>${club.singupQuestion2}</label><br>
					<input type="text" name="applyAnswer2"><br> <label>${club.singupQuestion3}</label><br>
					<input type="text" name="applyAnswer3"><br>
					<!-- hidden data -->
					<input type="hidden" value="H1" name="applyStatus"> <input
						type="hidden" name="clubNumber" value="${club.clubNumber}">
				</div>
				<div>
					<button type="button" id="joinSubmit" class="submit-btn">신청</button>
					<button type="button" id="joinReset" class="reset-btn">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 소모임 가입 modal (끝) -->

	<!-- 투표 modal : -->
	<div id="voteMainModal" class="main-modal">
		<div id="voteContentModal" class="content-modal">
			<form action="" method="post" id="voteForm">
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
					<button type="button" id="voteReset" class="reset-btn">첨부하기</button>
				</div>
			</form>
		</div>
	</div>

	<div id="memberModal" class="main-modal">
		<div id="memberContentModal" class="content-modal">
			<span class="close" id="closeVoteModal">&times;</span>
			<div class="">
				<input type="text" id="memberSearch" placeholder="멤버 검색">
				<ul>
					<c:forEach items="${members}" var="member">
						<li><img class="member-profile" src="">
							<p class="member-nickname"></p></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 프로필 생성 modal -->
	<div id="profileMianModal" class="main-modal">
		<div id="profileContentModal" class="content-modal">
			<span id="closeProfileModal" class="close">&times;</span>
			<form action="profileInsert" method="post" id="join-form"
				name="join-form">
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
					<input type="hidden" id="memberEmail" name="memberEmail"
						value="${member.memberEmail}">
				</div>


				<!-- 				<div class="profileSection"> -->
				<!-- 					<label>첨부이미지</label> -->
				<!-- 					<div id="preview"></div> -->
				<!-- 					<input name="uploadFile" type="file" value="profileImg" -->
				<!-- 						id="profileImg" onchange="readURL(this);"> -->
				<!-- 					<button type="button" id="uploadBtn">upload</button> -->
				<!-- 				</div> -->

				<div class="profileSection input-group mb-3">

					<label class="input-group-text" for="inputGroupFile01">Upload</label>
					<input type="file" class="form-control" id="uploadBtn"
						onchange="readURL(this);">
					<div id="preview"></div>
				</div>

				<div class="join-button-wrap">
					<button type="button" id="profileSubmit" class="submit-btn">등록하기</button>
					<button type="button" id="profileReset" class="reset-btn">취소</button>
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
    	  if(event.target == document.getElementById("joinModalBtn")) {
    		  $("#joinMainModal").fadeIn();
          }
    	  if(event.target == document.getElementById("profileModalBtn")) {
    		  $("#profileMianModal").fadeIn();
          }
    	  if(event.target == document.getElementById("boardModalBtn")) {
    		  $("#boardMainModal").fadeIn();
          }
    	  if(event.target == document.getElementById("voteModalBtn")) {
    		  $("#voteMainModal").fadeIn();
          }
          
       });
     // 닫기버튼
     $(".close").on("click", function(event) {      
        if (event.target == document.getElementById("closeJoinModal")) {
             $("#joinMainModal").fadeOut();
        }
        if(event.target == document.getElementById("closeProfileModal")){
            $("#profileMianModal").fadeOut();
        }
        if(event.target == document.getElementById("closeBoardModal")){
            $("#boardMainModal").fadeOut();
        }
      });
     
	 $("#headBoxBoard").on("click", function(e){   
    	  $("#boardMainModal").fadeIn();
	 });  
	 $("#headBoxJoin").on("click", function(e){
    	 $("#joinMainModal").fadeIn(); 
	 });
		
	 
	 $("#emptyBoard").on("click", function(e){
		 $("#boardMainModal").fadeIn();
	 });
	 
     $(document).mouseup(function (e) {
          if (event.target == document.getElementById("boardInsertModal")) {
              $("#boardInsertModal").fadeOut();
          }
          if(event.target == document.getElementById("boardInsertModal")){
             $("#boardInsertModal").fadeOut();
          }
          if(event.target == document.getElementById("boardInsertModal")){
             $("#boardInsertModal").fadeOut();
          }
      });
       
      $("#emptyBoard").on("click",function(e){
    	  if(sessionStorage.getItem("profile") != null){
    		    $("#boardMainModal").fadeIn();
    		}else if(sessionStorage.getItem("profile") != null){
    		    $("#joinMainModal").fadeIn();
    		}
      })
       
       $("#search-img").on("click", function(e){
         var search = $("#searchText").val();
         if(search == ""){
        	 alert("검색어를 입력해주세요.")
        	 return false;
         }
         $("#searchForm").submit();
         
      });
       
       // submit
       $(".submit-btn").on("click", function(e){
           if(event.target == document.getElementById("joinSubmit")){
  	   			$("form[name='clubJoinForms']").submit();        	   
           }
           if(event.target == document.getElementById("boardSubmitBtn")){
        	    $("form[name='insertForm']").submit();
           }
       });
       
       // reset 
       $(".reset-btn").on("click", function(e){
    	   if(event.target == document.getElementById("joinReset")){
    		   $("#joinMainModal").fadeOut();
 	   			$("form[name='clubJoinForms']").reset();        	   
          }
       });
       
       // isnertbar onclick
       $(".insert-bar").on("click", function(e){
    	   if(sessionStorage.getItem("profile") != null){
    		  $("#joinMainModal").faedIn();
    	   }else{
    		  $("#boardMainModal").faedIn();
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
      $("#profileSubmit").on("click", function(e) {  
    	  e.preventDefault();
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
//                     	   var form = $("#join-form");
//                     	   var formData = new FormData(form);
//                     	   $.ajax({
//                     		   type: "POST",
//                     		   url: "${pageContext.request.contextPath}/club/profileOnPage",
//                     		   data : formData,
//                     		   success: function(reuslt){
//                     			   if(reuslt == "성공"){
//                     				   alert("프로필 등록 성공");
//                     				   $("#profileMianModal").fadeOut();
//                     			   }else{
//                     				   alert("프로필 등록 실패");
//                     			   }
                    				 
//                     		   }
                    		   
//                     	   });
                          
                           
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
                    	 $('#emptyBoard').empty();
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
		if(event.target == document.getElementById("profileImg")){
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="profileImg" value="\${list[i].UUID}">
				           <input type="hidden" name="profileImgPath" value="\${list[i].url}">`
				$("#join-form").append(tag);
			}
		}
	}
	
	// insert bar 클릭용 
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
    
  	//닉네임 중복체크
  	$('.nick-input').on("propertychange change keyup paste input", function(){
  	      
  	   var profileNickname = $('.nick-input').val();  //.nick-input 입력될값
  	   var data = {profileNickname : profileNickname} //컨트롤에 넘길 데이터 이름 : 데이터(.nick-input에 입력되는 값)
  	   
  	   $.ajax({
  	      type : "post",
  	      url : "${pageContext.request.contextPath}/club/nickChk",
  	      data : data,
  	      success : function(result) {
  	         /* console.log("성공" + result); */
  	         if(result != 'fail'){
  	            $('.nick-input-re1').css("display", "inline-block");
  	            $('.nick-input-re2').css("display", "none");
  	            nickchCheck = true;
  	         }else{
  	            $('.nick-input-re2').css("display", "inline-block");
  	            $('.nick-input-re1').css("display", "none");
  	            nickchCheck = false;
  	         }
  	      }// success 종료
  	   }); // ajax 종료
  	}); // function 종료
    
   
   

</script>
</body>
</html>