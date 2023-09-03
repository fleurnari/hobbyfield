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
			<form>
				<!-- 이름, 작성일 이미지  -->
				<div>
				<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
				<c:choose>
					<c:when test="${boardInfo.profileImg ne null}">
						<img alt="프로필이미지" src="${pageContext.request.contextPath}/${boardInfo.profileImgPath}${boardInfo.profileImg}" 
						style="width: 50px; height: 50px;">
					</c:when>
					<c:otherwise>
						<img alt="기본이미지" src="${pageContext.request.contextPath}/resources/img/profile.png" />
					</c:otherwise>
				</c:choose>
				
				<input type="text" id="clubBoardWriter" name="clubBoardWriter" readonly="readonly" value="${board.clubBoardWriter}" >
				
				</div>
				<div id="editor">
					${board.clubBoardContent}
				</div>
			
			</form>
			<button>수정하기</button>
			<button>삭제하기</button>
			<button>삭제하기</button>
			<button>삭제하기</button>
			<button type="button" id="boardList" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${club.clubNumber}'">글 목록</button>
			
		</div>
		
		<!-- 댓글 작성용 1.댓글작성, 2. 사진포함 댓글작성 -->
		
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
$(document).ready(function() {
	// 글 목록 
	$('#boardList').on('click',function(e){
		e.preventDefault();
		
	}))
	
	
	ClassicEditor
	.create( document.querySelector( '#editor' ), {
		 toolbar: []
	})
	.then( editor => {
		editor.isReadOnly = true;
	})
	.catch( error => {
	    console.log( error );
	});
});
   
   
   
   
</script>
	
</body>
</html>