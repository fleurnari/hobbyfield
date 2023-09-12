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
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/club/clubBoardInfo.css">
<style type="text/css">
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor--editable {
	height: 60vh;
}
</style>
</head>
<body>
	<div class="total-css" align="center">
		<!-- 게시글 + 댓글 전체 -->
		<div class="board-comment-list">
			<!--  게시글 -->
			<div class="board-info">
				<form id="boardUpdate" method="post" name="boardUpdate">
					<!-- 이름, 작성일 이미지  -->
					<div class="writer-info">
						<!-- 이미지 추후 db에서 경로 가져와서 출력 -->
						<img alt="프로필이미지"
							src="${pageContext.request.contextPath}/${board.profileImgPath}${board.profileImg}">
						<input type="hidden" id="clubBoardWriter" name="clubBoardWriter"
							value="${board.clubBoardWriter}">
						<p class="board-wdate">${board.clubBoardWriter}</p>
						<fmt:formatDate value="${board.clubBoardWdate}" dateStyle="full" />
						<p class="board-views">${board.clubBoardViews}</p>
					</div>
					<div id="editor1">
						<div class="board-content" id="editor">${board.clubBoardContent}</div>
					</div>
					<p>좋아요 : ${boardLike} 개</p>
					<c:if
						test="${(profile.profileNickname ne board.clubBoardWriter) && (profile ne null)}">
						<button type="button" id="boardLike">좋아요</button>
					</c:if>
				</form>
			</div>
			<!-- 댓글 리스트 -->
			<div class="comment-list">
				<form id="" name="">
					<input type="hidden" id="boardNumber" name="boardNumber"
						value="${board.boardNumber}"> <input type="hidden"
						id="commentNumber" name="commentNumber">

					<c:forEach items="${commentList}" var="comment">
						<div class="comment-info">
							<c:choose>
								<c:when
									test="${(comment.clubCommentSecret eq 'L2') || (comment.clubCommentSecret eq 'L1' && profile.profileNickname eq board.clubBoardWriter || member.memberGrd eq 'A3'
                           || profile.profileNickname eq club.profileNickname || profile.profileNickname eq comment.profileNickname || profile.profileNickname eq comment.parentWriter)}">
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
											<button type="button"
												onclick="recommentInsert('${comment.boardNumber}', '${comment.commentNumber}')">대댓</button>
										</c:if>

										<c:if
											test="${profile.profileNickname eq comment.profileNickname}">
											<button type="button"
												onclick="commentUpdate(${comment.commentNumber})">수정</button>
										</c:if>
										<c:if
											test="${profile.profileNickname eq comment.profileNickname || member.memberGrd eq 'A3' || profile.profileNickname eq club.profileNickname}">
											<button type="button"
												onclick="commentDelete(${comment.commentNumber})">삭제</button>
										</c:if>
									</div>
								</c:when>
								<c:otherwise>
									<p>비밀 댓글은 게시글, 댓글 작성자와 관리자만 볼 수 있습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</form>
			</div>

			<!-- 댓글 작성용 1.댓글작성, 2. 사진포함 댓글작성 -->
			<div class="comment-insert">
				<c:if test="${profile ne null}">
					<form id="commentInsertForm">
						<input type="hidden" id="boardNumber" name="boardNumber"
							value="${board.boardNumber}"> <label
							for="profileNickname">댓글작성자 :</label> <input type="text"
							id="profileNickname" name="profileNickname"
							value="${profile.profileNickname}" readonly > <label
							for="clubCommentContent">댓글 내용 : </label>

						<div id="editor2"></div>

						<label for="clubCommentSecret">비밀 댓글 : </label> <input
							type="checkbox" id="clubCommentSecret" name="clubCommentSecret"
							value="">
						<button type="button" id="commentInsert">댓글 작성</button>
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#emojiModal">😊</button>
					</form>
				</c:if>
			</div>

		</div>

		<!-- 글 목록, 수정, 삭제, 이전, 다음글 -->
		<div id="btnList">
			<!-- 
			<button type="button" id="boardNext">다음글</button>
		 -->
			<button type="button" id="boardList"
				onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${board.clubNumber}'">목록</button>
			<c:if test="${profile.profileNickname eq board.clubBoardWriter}">
				<button type="button" id="boardEdit">수정</button>
				<button type="button" id="boardDel">삭제</button>
			</c:if>
		</div>


	</div>


	<!-- 모달 시작 -->
	<!-- 이모티콘 모달 -->
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
							<li class="nav-item" role="presentation"><a
								class="nav-link ${status.index == 0 ? 'active' : ''}"
								id="emojiTabs-${status.index}" data-toggle="tab"
								href="#emoji-content-${status.index}"
								data-pointid="${point.pointId}" role="tab"
								aria-controls="emoji-content-${status.index}"
								aria-selected="${status.index == 0 ? 'true' : 'false'}">
									${point.pointId}${point.pointName} </a></li>
						</c:forEach>
					</ul>

					<!-- 이모티콘 그룹 -->
					<div class="tab-content" id="emojis">
						<c:if test="${not empty emojis}">
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

	<!-- 댓글 수정 모달 -->
	<div class="modal updateModal">
		<div class="modal_content">
			<div class="m_head">
				<div class="modal_title">
					<h3>댓글</h3>
				</div>
				<div class="close_btn" id="close_btn">X</div>
			</div>
			<div class="m_body">
				<form id="clubCommentUpdate">
					<input type="hidden" id="updateCommentNumber" name="commentNumber" />
					<div>
						<label for="profileNickname">댓글 작성자 :
							${profile.profileNickname} </label> <br> <label
							for="updateClubCommentContent">댓글 내용</label>
						<textarea rows="1" cols="100" id="updateClubCommentContent"
							name="clubCommentContent"></textarea>
						<br> <label for="updateClubCommentSecret">비밀 댓글 <input
							type="checkbox" id="updateClubCommentSecret"
							name="clubCommentSecret" value=""></label>
					</div>
					<div></div>
				</form>
			</div>
			<div class="m_footer">
				<button type="button" id="commentUpdate"
					class="btn btn-primary btn-outline btn-lg update_btn">댓글
					수정</button>
				&nbsp;&nbsp;
				<button type="button"
					class="btn btn-primary btn-outline btn-lg close_btn">취소</button>
				&nbsp;&nbsp;
			</div>
		</div>
	</div>

	<!-- 대댓 작성 모달 -->
	<div id="recommentModal" class="main-modal">
		<form id="clubRecommentInsert">
			<input type="hidden" id="recommentBoardNumber" name="boardNumber" />
			<input type="hidden" id="recommentCommentNumber" name="commentNumber" />
			<div>
				<label for="profileNickname"> 댓글 작성자 </label><input type="text"
					id="recommentProfileNickname" name="profileNickname"
					value="${profile.profileNickname}" /> <br> <label
					for="recommentClubCommentContent">댓글 내용</label>
				<div id="editor3"></div>
				<br> <label for="recommentClubCommentSecret">비밀 댓글</label> <input
					type="checkbox" id="recommentClubCommentSecret"
					name="clubCommentSecret" value="">
			</div>
			<div>
				<button type="button" id="recommentInsertBtn"
					class="btn btn-primary btn-outline btn-lg">작성</button>
				&nbsp;&nbsp;
				<button type="button" onclick="closeModal()"
					class="btn btn-primary btn-outline btn-lg">취소</button>
				&nbsp;&nbsp;
			</div>
		</form>
	</div>


	<!-- 댓글 수정 모달 -->
	<div class="modal updateModal">
		<div class="modal_content">
			<div class="m_head">
				<div class="modal_title">
					<h3>댓글</h3>
				</div>
				<div class="close_btn" id="close_btn">X</div>
			</div>
			<div class="m_body">
				<form id="clubCommentUpdate">
					<input type="hidden" id="updateCommentNumber" name="commentNumber" />
					<div>
						<label for="profileNickname">댓글 작성자 :
							${profile.profileNickname} </label> <br> <label
							for="updateClubCommentContent">댓글 내용</label>
						<textarea rows="1" cols="100" id="updateClubCommentContent"
							name="clubCommentContent"></textarea>
						<br> <label for="updateClubCommentSecret">비밀 댓글 <input
							type="checkbox" id="updateClubCommentSecret"
							name="clubCommentSecret" value=""></label>
					</div>
					<div></div>
				</form>
			</div>
			<div class="m_footer">
				<button type="button" id="commentUpdate"
					class="btn btn-primary btn-outline btn-lg update_btn">댓글
					수정</button>
				&nbsp;&nbsp;
				<button type="button"
					class="btn btn-primary btn-outline btn-lg close_btn">취소</button>
				&nbsp;&nbsp;
			</div>
		</div>
	</div>

	<!-- 대댓 작성 모달 -->
	<div id="recommentModal" class="modal">
		<div class="modal_content">
			<div class="m_head">
				<div class="modal_title">
					<h3>댓글</h3>
				</div>
				<div class="close_btn" id="close_btn">X</div>
			</div>
			<form id="clubRecommentInsert">
				<input type="hidden" id="recommentBoardNumber" name="boardNumber" />
				<input type="hidden" id="recommentCommentNumber"
					name="commentNumber" />
				<div>
					<label for="profileNickname"> 댓글 작성자 </label><input type="text"
						id="recommentProfileNickname" name="profileNickname"
						value="${profile.profileNickname}" /> <br> <label
						for="recommentClubCommentContent">댓글 내용</label>
					<div id="editor2">1515</div>
					<br> <label for="recommentClubCommentSecret">비밀 댓글</label> <input
						type="checkbox" id="recommentClubCommentSecret"
						name="clubCommentSecret" value="">
				</div>
				<div>
					<button type="button" id="recommentInsertBtn"
						class="btn btn-primary btn-outline btn-lg">작성</button>
					&nbsp;&nbsp;
					<button type="button" onclick="closeModal()"
						class="btn btn-primary btn-outline btn-lg">취소</button>
					&nbsp;&nbsp;
				</div>
			</form>
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
//댓글 에디터
ClassicEditor
.create( document.querySelector( '#editor2' ), {
    toolbar: [], 
})
.then( editor => {
   replyEditor = editor;
})
.catch( error => {
    console.log( error );
});  

// 이모티콘 선택 (이모지 선택해서 툴 헤더 없는 editor에 넣을 수 있도록 하기) 코드 완성하면 이모티콘 가장 아래로 이동
$('#emojis').on("click","img",function(e){
       var selectedImageSrc = $(this).attr('src');
       replyEditor.execute( 'insertImage', { source: selectedImageSrc } );
  
    $("#emojiModal").modal("hide");
});
  

$(document).ready(function() {
   
   var userLike = '${userLike}';
   
    if (userLike == 1) {
       $('#boardLike').html("좋아요 취소");
    }
});

$(document).ready(function() {
   
   var userLike = '${userLike}';
   
    if (userLike == 1) {
       $('#boardLike').html("좋아요 취소");
    }
   //이모티콘
    // 탭 클릭 이벤트 핸들러
    $("#emojiTab a").click(function(e) {
        e.preventDefault(); // 기본 동작(페이지 이동) 방지

        // 클릭한 탭의 인덱스 가져오기
        var tabIndex = $(this).parent().index();
       let pointId = $(event.target).data('pointid')
        // 탭 변경 함수 호출
        showTab(tabIndex, pointId);
    });

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
         url      : 'clubBoardInfo-sub',
         method : "GET",
         data     : {pointId : pointId}
      })
      
      .done(datas => {
       if(datas){
          console.log("성공")
          //내용을 다 지우고
          $('#emojis').empty();
          //탭 선택시 탭에 맞는 내용이 보이도록
          for(emoji of datas){ 
             let img =  `<img src="${pageContext.request.contextPath}\${emoji.emojiImgPath}\${emoji.emojiImgName}" 
                      alt="이모티콘 이미지" style="width: 100px;">`
               $('#emojis').append(img)
          }
       }else {
          console.log("실패")
       }
      })
      .fail(reject => console.log(reject));
      
      return false;
   };
   
   
   // 글 목록, 수정, 삭제 
   // 이전, 다음글
   $("#boardNext").on("click", function(){

      
      
   })

   
   $("#commentInsert").on("click", function() {
   
      var form = document.getElementById("commentInsertForm");
      var boardNumber = form.boardNumber.value;
      var profileNickname = form.profileNickname.value;
      var clubCommentContent =  replyEditor.getData();
      var commentSecret = clubCommentSecret.checked ? "L1" : "L2";
      
      var clubBoardWriter = '${board.clubBoardWriter}';
      var writerEmail = '${board.memberEmail}';
      var clubName = '${club.clubName}';
      
      $.ajax({
         url : '${pageContext.request.contextPath}/club/clubCommentInsert',
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
            $('#clubCommentContent').val('');
            location.reload();
         },
         error : function() {
            alert("댓글 등록에 실패 했습니다.");
         }
      });
      
      if (profileNickname != clubBoardWriter) {
         $.ajax({
            url : '${pageContext.request.contextPath}/push/insertPush',
            type : 'post',
            data : {
                  'pushTarget' : writerEmail,
                  'pushTyp' : 'B2',
                  'pushCntn' : clubName + " 소모임의 " + boardNumber + '번 게시물에 새 댓글이 등록 되었습니다.',
                  'pushUrl' : '${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=' + boardNumber,
               },
            dataType : "json",
            success : function(result) {
               
            }
         });
      }
      
   });
   

   // 댓글 수정 모달창 띄우기
 
   function commentUpdate(commentNumber) {

       $.ajax({
           url: 'clubCommentUpdate',
           method: 'GET',
           data: { commentNumber: commentNumber },
           success: function (result) {

                   $('#updateClubCommentContent').val(result.clubCommentContent);
                   $('#updateCommentNumber').val(result.commentNumber);
                   
                  if (result.clubCommentSecret == 'L1') {
                      $('#updateClubCommentSecret').prop('checked', true);
                  } else {
                     $('#updateClubCommentSecret').prop('checked', false);

                  }

           }
       });
       $('.updateModal').fadeIn();
   }

//댓글 수정 모달창 닫기
$('.close_btn').on('click', function(){$('.updateModal').fadeOut();});

$('.update_btn').on('click', function(){
   let checkValue = confirm("정말 수정 하시겠습니까?");
   if(checkValue){
      
      var form = document.getElementById("clubCommentUpdate");
      
      var commentNumber = form.updateCommentNumber.value;
      var clubCommentContent = form.updateClubCommentContent.value;
      var commentSecret = updateClubCommentSecret.checked ? "L1" : "L2";
      
      $.ajax({
         url : 'clubCommentUpdate',
         data : {
            "clubCommentContent" : clubCommentContent,
            "clubCommentSecret" : commentSecret,
            "commentNumber" : commentNumber
         },
         type : "post",
         success : function(result) {
            if (result) {
               alert("댓글 수정에 성공 했습니다.");
            }
         }
      });
      
      $('.updateModal').fadeOut();
      location.reload();
   }
});


function commentDelete(commentNumber) {
   
      $.ajax({
           url : '${pageContext.request.contextPath}/club/clubCommentDelete',
           data : {
               'commentNumber' : commentNumber
         },
           type : 'POST',
         success : function(result) {
            if (result) {
               alert("댓글 삭제에 성공 했습니다.");
               location.reload();
            }
         },
         error : function() {
            alert("댓글 삭제에 실패 했습니다.");
         }
      });
      
     }
     
   // 대댓 작성 모달창 띄우기

   function recommentInsert(boardNumber, commentNumber) {
        
          $.ajax({
              url: 'clubRecommentInsert',
              method: 'GET',
              data: {    boardNumber : boardNumber,
                       commentNumber: commentNumber },
              success: function (result) {
                   $('#recommentBoardNumber').val(boardNumber);
                   $('#recommentCommentNumber').val(commentNumber);
              }
          });
          $('#recommentModal').fadeIn();
        
     }
   
   
   // 대댓 모달 닫기
   function closeModal() {
      $("#recommentModal").fadeOut();
   }
   
   // 대댓 작성
   $('#recommentInsertBtn').on('click', function(){
            
            var form = document.getElementById("clubRecommentInsert");
            
            var commentNumber = form.recommentCommentNumber.value;
           var boardNumber = form.recommentBoardNumber.value;
           var profileNickname = form.recommentProfileNickname.value;
            var clubCommentContent = replyEditor.getData();
            var commentSecret = recommentClubCommentSecret.checked ? "L1" : "L2";
            
            $.ajax({
               url : 'clubRecommentInsert',
               data : {
                  "commentNumber" : commentNumber,
                  "boardNumber" : boardNumber,
                  "profileNickname" : profileNickname,
                  "clubCommentContent" : clubCommentContent,
                  "clubCommentSecret" : commentSecret
               },
               type : "post",
               success : function(result) {
                  if (result) {
                     alert("대댓글을 작성 했습니다.");
                  }
               }
            });
            
            $('#recommentModal').fadeOut();
            location.reload();
      });



// 좋아요
$("#boardLike").on("click", function() {
   
   var boardNumber = '${board.boardNumber}'
   var profileNickname = '${profile.profileNickname}'
   
   $.ajax({
      url : 'boardLike',
      data : {
         'boardNumber' : boardNumber,
         'profileNickname' : profileNickname
      },
      type : 'POST',
      success : function(result) {
         if (result == 0) {
            alert("해당 게시글 좋아요에 성공 했습니다.");
            $('#boardLike').html("좋아요 취소");
         } else {
            alert("좋아요를 취소 했습니다.");
            $('#boardLike').html("좋아요");
         }
      }
   });
   
});




</script>
</body>
</html>