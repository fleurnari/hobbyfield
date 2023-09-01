<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글</title>

<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ckediotr.css">
 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/club/clubboard.css"> 
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
	<div align="center" style="margin-top: 100px;" >
		<!-- 검색창 -->
		<div class="search-div">
		  <input class="search-text" type="text" id="search-text" name="" placeholder="검색어 입력">
		  <img class="search-img" id="search-img" name="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		</div>
		
		<h1>게시글 목록</h1>
		<!-- Session 확인용 : 추후 삭제 -->
		<div>
			<div>email : ${member.memberEmail}</div>
			<div>닉네임 : ${profile.profileNickname}</div>
			<div>
				<img src="${profile.profileImgPath}${profile.profileImg}"
					style="width: 50px; height: 50px;">
			</div>
		</div>
		<!-- modal 공통사항 : modal 호출마다 해당 값 초기화 잊지말것. -->
		<!-- 게시글 상세보기 modal-->
		<div id="boardInfoModal">
			<div>
				<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
				<img alt="프로필이미지" src="${board.PROFILE_IMG_PATH}${board.PROFILE.PROFILE_IMG}" style="width: 50px; height: 50px;">
				<input type="text" id="clubBoardWriter" name="clubBoardWriter" value="${board.clubBoardWriter}">
				<input type="text" id="clubBoardWdate" name="clubBoardWdate" value="${board.clubBoardWdate}">
				</div>
				<div id="editor">
					${board.clubBoardContent}
				</div>
		</div>
		
			
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
					<div>
						<!-- 공지사항 여부 추후 모임장만 가능하도록 처리 -->
						공지사항등록 <input type="checkbox" id="typeCheckbox"
							name="typeCheckbox" value="공지사항 등록"> <input type="hidden"
							name="clubBoardType" id="clubBoardType">
					</div>
					<div>
						<!-- 추후 넣을값 : club_number, club_board_type -> -->
					</div>
					<div>

						<input type="text" id="clubNumber" name="clubNumber"
							value="${clubNumber}"> <input type="text"
							id="clubBoardType" name="clubBoardType" value="N">
					</div>
					<button type="submit">등록</button>
					<button type="reset">취소</button>

				</form>
			</div>
		</div>





		<!-- 투표 생성 modal-->
		<div>
			<form>
			
			</form>
		</div>
		<!-- 글쓰기버튼 구현 : modal로 글쓰기 창이 나오도록 -->
		<div>
			<button id="openModalBtn">글쓰기</button>
		</div>

		<!-- 검색창 구현 : 사용자이름, 글내용으로 검색 : ajax 처리를 통해 검색된 내용만 다시 불러오도록.-->
		<div>
			
		</div>

		<!-- 게시물, 댓글을 묶는 div -->
		<!-- 차단한 유저는 나오지 않도록 추가 조건문 구현하기 -->
		<div id="clubBoardList">
			<!-- 게시글 -->
			<c:forEach items="${boardList}" var="board">
				<h3>게시글</h3>
				<div id="boardMain"
					onclick="boardInfo(this);">
					<p>글 번호 : ${board.boardNumber}</p>
					<p>작성자 : ${board.clubBoardWriter}</p> 
					<p id="writeDay">작성일 :
					<fmt:formatDate value="${board.clubBoardWdate}" pattern="yyyy-MM-dd"/></p>
					<p>${board.clubBoardViews}</p>
					<p>${board.clubBoardType}</p>
					<c:if test="${board.scheduleDate} ne null">
						<p><fmt:parseDate value="${board.scheduleDate}" var="dateFmt" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/></p>
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
			<!-- 댓글 입력창 -->
			<div>
				<img src="${profile.profileImgPath}${profile.profileImg}"
					style="width: 50px; height: 50px;">
				<p>닉네임 : ${profile.profileNickname}</p>
				<input type="text" id="" name="" value="">
			</div>
		</div>
		
		
		<!-- 사이드바1(왼) 소모임정보 : 소모임 이름, 멤버수, 초대버튼,  소모임 설정버튼(모임장만 보이도록)-->
		<div>
		
		</div>
		<!-- 사이드바2(오) 최근 사진, 글쓰기 버튼 -->
		<div>
	
		</div>
		
		
		
		
		
		
		
</div>



<script type="text/javascript">
	// modal script
	const openModalBtn = document.getElementById("openModalBtn");
	const closeModalBtn = document.getElementById("closeModalBtn");
	const boardInsertModal = document.getElementById("boardInsertModal");
	// 글쓰기 작성시 날짜 기본값 오늘날짜로 
	document.getElementById('insertScheduleDate').value = new Date().toISOString().substring(0, 10);
	
	
	
	openModalBtn.addEventListener("click", () => {
	  boardInsertModal.style.display = "block";
	});
	
	closeModalBtn.addEventListener("click", () => {
	  boardInsertModal.style.display = "none";
	});
	
	window.addEventListener("click", (event) => {
	  if (event.target === boardInsertModal) {
	    boardInsertModal.style.display = "none";
	  }
	});

	
	
	
	
	
	
	// 에디터용
	ClassicEditor
	.create( document.querySelector( '#editorInsert' ), {
		language:"ko",
		ckfinder: {
			uploadUrl : 'ckeditor/upload'
		}
	})
	.then(editor => {
	    // 에디터 인스턴스가 생성되면 호출되는 콜백 함수
	    editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
	})
	.catch( error => {
	    console.error( error );
	});
	ClassicEditor
	.create( document.querySelector( '#editorRead' ), {
	 toolbar: []
	} )
	.then( editor => {
	const toolbarElement = editor.ui.view.toolbar.element;
	editor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
	    if ( isReadOnly ) {
	        toolbarElement.style.display = 'none';
	    } else {
	        toolbarElement.style.display = 'flex';
	    }
	});
	})
	.catch( error => {
	console.log( error );
	});    
</script>
</body>
</html>