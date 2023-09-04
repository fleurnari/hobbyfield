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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	.ck.ck-editor {
		width: 80%;
		max-width: 800px;
		margin: 0 auto;
	}
	.ck-editor__editable {
		height: 80vh;
	}
	
	.emojiModal{
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
					<img alt="프로필이미지" src="download/img/common.png" style="width: 50px; height: 50px;">
					<input type="text" id="clubboardwriter" name="clubboardwriter" value="${board.clubboardwriter}" >
					<input type="text" id="" name="clubboardwdate" value="${board.clubboardwdate}">
				</div>
				<div id="editor">
					${board.clubboardcontent}
				</div> 
			</form>
		</div>
		
		<!-- 댓글 작성용 1.댓글작성, 2. 사진포함 댓글작성 -->
		<div>
			<form>	
				<!-- 댓글 작성시 작성자의 프로필 내용 사용 -->
				<input type="text" id="" name="">
				<input>
				<img alt="" src="">
				<button></button>
			</form> 
		</div>
	</div>
	
	
	 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#emojiModal">😊</button>
	 
<div class="modal fade" id="emojiModal" tabindex="-1" aria-labelledby="emojiModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <!-- 이모티콘 탭 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="emojiModalLabel">이모티콘</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
             <div class="container">
                <!-- 이모티콘 탭 -->
                
                <!-- 이모티콘 헤더 -->
                <ul class="nav nav-tabs" id="emojiTab" role="tablist" onclick="showTab()"> 
                    <c:forEach items="${emoji}" var="emoji" varStatus="status">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${status.index == 0 ? 'active' : ''}" id="emojiTabs-${status.index}" data-toggle="tab" href="#emoji-content-${status.index}" 
                            role="tab" aria-controls="emoji-content-${status.index}" aria-selected="${status.index == 0 ? 'true' : 'false'}">${emoji.emojiId}
								<p>${point.pointName}</p>
							</a>
                        </li>
                    </c:forEach>
                </ul>
                
				<!-- 이모티콘 그룹 -->
                <div class="tab-content" id="emojiTabGroup">
                    <c:forEach items="${emojiList}" var="emoji" varStatus="status">
                        <div class="tab-pane fade ${status.index == 0 ? 'show active' : ''}" id="-${status.index}" 
                        role="tabpanel" aria-labelledby="emoji-tab-${status.index}">
                        	<img src="${pageContext.request.contextPath}/${emoji.emojiImgPath}${emoji.emojiImgName}" alt="이모티콘 이미지" style="width:150px;">
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
    // 페이지가 로드될 때 초기 탭 설정
    showTab(0);
    
    // 탭 클릭 이벤트 핸들러
    $("#emojiTab a").click(function(e) {
        e.preventDefault(); // 기본 동작(페이지 이동) 방지

        // 클릭한 탭의 인덱스 가져오기
        var tabIndex = $(this).parent().index();

        // 탭 변경 함수 호출
        showTab(tabIndex);
    });

    // 탭 보이기/감추기 함수
    function showTab(tabIndex) {
        // 모든 탭 이미지를 감춥니다.
        $("#emojiTabGroup .tab-pane").hide();

        // 선택한 탭 이미지만 보이게 합니다.
        $("#emojiTabGroup .tab-pane:eq(" + tabIndex + ")").show();
    }
});
   
   function showTab(){
	var tab = document.getElementById("emojiGroup");
   tab.addEventListener("click", function(e){
	   var pointId = `${point.pointId}`
	   $.ajax({
		   url 	  : 'clubBoardInfo-sub',
		   method : "GET",
		   data	  : {point : pointId}
	   })
	   
	   .done(data => {
		 if(data){
			 alert("yo something");
		 }else {
			 alert("yo suck")
		 }
	   })
	   .fail(reject => console.log(reject));
	   
	   return false;
   });
   
   
// 	function emojiGroup(e){
// 	var emojiTapGroup = documentById
// 	  }
   
}
    
    
    
    
    
    

   
   
</script>
	
</body>
</html>