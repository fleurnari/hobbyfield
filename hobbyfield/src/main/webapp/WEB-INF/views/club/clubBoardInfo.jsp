<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<body>
	<div align="center" style="margin-top: 100px;">
		<div>
			<form method="post">
				<!-- 이름, 작성일 이미지  -->
				<div>
				<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
				<img alt="프로필이미지" src="download/img/common.png" style="width: 50px; height: 50px;">
				<input type="text" id="clubBoardWriter" name="clubBoardWriter" value="${board.clubBoardWriter}" >
				<input type="text" id="" name="clubBoardWdate" value="${board.clubBoardWdate}">
				</div>
				<div id="editor">
					${board.clubBoardContent}
				</div>
				
			</form>
		</div>
		
		<form>
			<input type="hidden" id="boardNumber" name="boardNumber" value="${board.boardNumber}">
			<c:forEach items="${commentList}" var="comment">
				<c:choose>
					<c:when test="${(comment.clubCommentSecret eq 'L2') || (comment.clubCommentSecret eq 'L1' && profile.profileNickname eq board.clubBoardWriter || member.memberGrd eq 'A3'
									|| profile.profileNickname eq club.profileNickname || profile.profileNickname eq comment.parentWriter)}">
						<div>
							<c:if test="${comment.clubCommentLevel eq 'M2'}">
								&nbsp;&nbsp;&nbsp;&nbsp;<p>Re:</p>
							</c:if>
							<p>${comment.profileNickname}</p>
							<p>${comment.clubCommentContent}</p>
							<p><fmt:formatDate value="${comment.clubCommentDate}" pattern="yyyy-MM-dd"/></p>
							<c:if test="${comment.clubCommentLevel eq 'M1'}">
								<button type="button">대댓</button>
							</c:if>
							<c:if test="${profile.profileNickname eq comment.profileNickname}">
								<button type="button">수정</button>
							</c:if>
							<c:if test="${profile.profileNickname eq comment.profileNickname || member.memberGrd eq 'A3' || profile.profileNickname eq club.profileNickname}">
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
				<input type="hidden" id="boardNumber" name="boardNumber" value="${board.boardNumber}">
					<label for="profileNickname">댓글 작성자 : </label>
					<input type="text" id="profileNickname" name="profileNickname" value="${profile.profileNickname}" readonly>
					<label for="clubCommentContent">댓글 내용 : </label>
					<textarea rows="1" cols="100" id="clubCommentContent" name="clubCommentContent" required="required"></textarea>
					<label for="clubCommentSecret">비밀 댓글 : </label>
					<input type="hidden" id="commentSecret" name="commentSecret">
					<input type="checkbox" id="clubCommentSecret" name="clubCommentSecret">
				<!-- 댓글 작성시 작성자의 프로필 내용 사용 -->
				<input type="text" id="" name="">
				<input>
				<img alt="" src="">
				<button id="commentInsert">댓글 작성</button>
			</form>
			
			
		</div>
	</div>
	
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#emojiModal">😊</button>
	<div class="modal fade" id="emojiModal" tabindex="-1"
			aria-labelledby="emojiModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<!-- 이모티콘 탭 헤더 -->
					<div class="modal-header">
						<h5 class="modal-title" id="emojiModalLabel">이모티콘</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					 <div class="container">
				        <!-- 이모티콘 탭 -->
				        
				        <!-- 이모티콘 헤더 -->
				        <ul class="nav nav-tabs" id="emojiTabs" role="tablist">
				            <c:forEach items="${emoji}" var="emoji" varStatus="status">
				                <li class="nav-item" role="presentation">
				                    <a class="nav-link ${status.index == 0 ? 'active' : ''}" id="emoji-tab-${status.index}" data-bs-toggle="tab" href="#emoji-content-${status.index}" role="tab" aria-controls="emoji-content-${status.index}" aria-selected="${status.index == 0 ? 'true' : 'false'}">${emoji.emojiId}</a>
				                </li>
				            </c:forEach>
				        </ul>
				        
				        <!-- 이모티콘 그룹 -->
				        <div class="tab-content" id="emojiTabGroup">
				            <c:forEach items="${emoji}" var="emoji" varStatus="status">
				                <div class="tab-pane fade ${status.index == 0 ? 'show active' : ''}" id="emoji-content-${status.index}" role="tabpanel" aria-labelledby="emoji-tab-${status.index}">
				                    <img src="${emoji.emojiImgPath}" alt="${emoji.emojiImgName}">
				                </div>
				            </c:forEach>
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