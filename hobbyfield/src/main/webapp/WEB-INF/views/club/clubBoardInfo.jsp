<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>소모임 게시글 상세보기</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

<style>
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;
}

/* 댓글 에디터 */
#editor2{ 
 	width: 80%;
	max-width: 800px;
 }

/* 이모티콘 모달 */
.emojiModal {
	width: 100px;
}
 
</style>


</head>
<body>
	<div align="center" style="margin-top: 100px;">
		<div>
			<form method="post">
				<!-- 이름, 작성일 이미지  -->
				<div>
					<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
					<img alt="프로필이미지" src="download/img/common.png"
						style="width: 50px; height: 50px;"> <input type="text"
						id="clubBoardWriter" name="clubBoardWriter"
						value="${board.clubBoardWriter}"> <input type="text" id=""
						name="clubBoardWdate" value="${board.clubBoardWdate}">
				</div>
				<div id="editor">${board.clubBoardContent}</div>
			</form>
		</div>

		<form>
			<input type="hidden" id="boardNumber" name="boardNumber"
				value="${board.boardNumber}">
			<c:forEach items="${commentList}" var="comment">
				<c:choose>
					<c:when
						test="${(comment.clubCommentSecret eq 'L2') || (comment.clubCommentSecret eq 'L1' && profile.profileNickname eq board.clubBoardWriter || member.memberGrd eq 'A3'
									|| profile.profileNickname eq club.profileNickname || profile.profileNickname eq comment.parentWriter)}">
						<div>
							<c:if test="${comment.clubCommentLevel eq 'M2'}">
								&nbsp;&nbsp;&nbsp;&nbsp;<p>Re:</p>
							</c:if>
							<p>${comment.profileNickname}</p>
							<p>${comment.clubCommentContent}</p>
							<p>
								<fmt:formatDate value="${comment.clubCommentDate}"
									pattern="yyyy-MM-dd" />
							</p>
							<c:if test="${comment.clubCommentLevel eq 'M1'}">
								<button type="button">대댓</button>
							</c:if>
							<c:if
								test="${profile.profileNickname eq comment.profileNickname}">
								<button type="button">수정</button>
							</c:if>
							<c:if
								test="${profile.profileNickname eq comment.profileNickname || member.memberGrd eq 'A3' || profile.profileNickname eq club.profileNickname}">
								<button type="button">삭제</button>
							</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<p>비밀 댓글은 게시글, 댓글 작성자와 관리자만 볼 수 있습니다.</p>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</form>


		<!-- 댓글 작성용 1.댓글작성, 2. 사진포함 댓글작성 -->
		<div>
			<form id="commentInsertForm">
				<input type="hidden" id="boardNumber" name="boardNumber"
					value="${board.boardNumber}"> <label for="profileNickname">댓글
					작성자 : </label> <input type="text" id="profileNickname"
					name="profileNickname" value="${profile.profileNickname}" readonly>
				<label for="clubCommentContent">댓글 내용 : </label>
				<div  id="editor2" name="clubCommentContent" required="required"></div>
				<label for="clubCommentSecret">비밀 댓글 : </label> <input type="hidden"
					id="commentSecret" name="commentSecret"> <input
					type="checkbox" id="clubCommentSecret" name="clubCommentSecret">
				<!-- 댓글 작성시 작성자의 프로필 내용 사용 -->
				<input type="text" id="" name=""> <input> <img
					alt="" src="">
				<button id="commentInsert">댓글 작성</button>
			</form>
		</div>
	</div>

	<!-- 이모티콘 모달 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#emojiModal">😊</button>

	<div class="modal fade" id="emojiModal" tabindex="-1"
		aria-labelledby="emojiModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<!-- 이모티콘 탭 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title" id="emojiModalLabel">이모티콘</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="container">
					<!-- 이모티콘 모달 탭 -->
					<!-- 이모티콘 헤더 -->
					<ul class="nav nav-tabs" id="emojiTab" role="tablist">
						<c:forEach items="${point}" var="point" varStatus="status">
							<li class="nav-item" role="presentation">
								<a class="nav-link ${status.index == 0 ? 'active' : ''}" id="emojiTabs-${status.index}" data-toggle="tab" href="#emoji-content-${status.index}"
								data-pointid="${point.pointId}" role="tab" aria-controls="emoji-content-${status.index}" aria-selected="${status.index == 0 ? 'true' : 'false'}"> 	
								${point.pointId}${point.pointName} </a>
							</li>
						</c:forEach>
					</ul>

					<!-- 이모티콘 그룹 -->
					<div class="tab-content" id="emojis">
						<c:if test="${not empty emojis }">
							<c:forEach items="${emojis}" var="emoji" varStatus="status">
								<img
									src="${pageContext.request.contextPath}${emoji.emojiImgPath}${emoji.emojiImgName}"
									alt="이모티콘 이미지" style="width: 150px;">
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
ClassicEditor
.create( document.querySelector( '#editor' ), {
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
 
 var replyEditor;
// 댓글 에디터
ClassicEditor
.create( document.querySelector( '#editor2' ), {
	 toolbar: [], 
} )
.then( editor => {
	replyEditor = editor
// 	replyEditor.execute( 'insertImage', { source: '/app/download/img/' } );
// 	editor.execute( 'insertImage', { source: 'http://url.to.the/image' } );
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
  
	// 이모티콘 선택 (이모지 선택해서 툴 헤더 없는 editor에 넣을 수 있도록 하기) 코드 완성하면 이모티콘 가장 아래로 이동
	$('#emojis img').click(function(e){
	   
	   	  // 클릭한 이미지 정보를 insert?
		 //<input type="text" id="" name=""> <input> <img alt="" src="">
		//editor에  toolbar: []를 없애면 된다!
	   // insert인지 select 인지?
	   
});
  
$(document).ready(function() {

    // 탭 클릭 이벤트 핸들러
    $("#emojiTab a").click(function(e) {
        e.preventDefault(); // 기본 동작(페이지 이동) 방지

        // 클릭한 탭의 인덱스 가져오기
        var tabIndex = $(this).parent().index();
       let pointId = $(event.target).data('pointid')
        // 탭 변경 함수 호출
        showTab(tabIndex, pointId);
    });
})  

	// 탭 보이기/감추기 함수
    function showTab(tabIndex, pointId) {
        // 모든 탭 이미지를 감춥니다.
        $("#emojis .tab-content").hide();

        // 선택한 탭 이미지만 보이게 합니다.
        $("#emojis .tab-content:eq(" + tabIndex + ")").show();
 
	   $.ajax({
		   url 	  : 'clubBoardInfo-sub',
		   method : "GET",
		   data	  : {pointId : pointId}
	   })
	   
	   .done(datas => {
		 if(datas){
			 console.log("성공")
			 //내용을 다 지우고
			 $('#emojis').empty();
			 //탭 선택시 탭에 맞는 내용이 보이도록
			 for(emoji of datas){ 
	 			let img =  `<img src="${pageContext.request.contextPath}\${emoji.emojiImgPath}\${emoji.emojiImgName}" 
	 						alt="이모티콘 이미지" style="width: 150px;">`
	      		$('#emojis').append(img)
			 }
		 }else {
			 console.log("실패")
		 }
	   })
	   .fail(reject => console.log(reject));
	   
	   return false;
   };
   

   
   
   
   
$(document).ready(function() {

	$("#commentInsert").on("click", function() {
	
		var form = document.getElementById("commentInsertForm");
		var boardNumber = form.boardNumber.value;
		var profileNickname = form.profileNickname.value;
		var clubCommentContent = form.clubCommentContent.value;
		var clubCommentSecretCheckbox = form.clubCommentSecret;
		var commentSecret = clubCommentSecretCheckbox.checked ? "on" : "";
		
		$.ajax({
			url : 'clubCommentInsert',
			data : {
				"boardNumber" : boardNumber,
				"profileNickname" : profileNickname,
				"clubCommentContent" : clubCommentContent,
				"clubCommentSecret" : commentSecret
			},
			type : "post",
			success : function(result) {
				if (result == 1) {
					alert("댓글 등록에 성공 했습니다.");
				}
			}
		})
		
	});
	
});

</script>
</body>
</html>