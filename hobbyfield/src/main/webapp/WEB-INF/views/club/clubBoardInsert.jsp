<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>



<style>
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}
.ck-editor__editable {
	height: 80vh;
}
/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
    max-width: 600px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
	<div align="center" style="margin-top: 100px;">
		<form name="insertForm" action="clubBoardInsert" method="post" enctype="multipart/form-data">
			<div>
				<h3>게시글 작성</h3>
			</div>
			
			<div>
				<textarea id="editor" name="clubBoardContent"></textarea>
			</div>
			
			<div>
				<label>일정설정</label>
				<input type="date" id="scheduleDate" name="scheduleDate">
			</div>
			<!-- 작성자 값 추후 seesion을 통해 넣을 수 있도록 설정   -->
			<div>
			<input type="text" name="clubBoardWriter" value="test"> 
			</div>
			<div>
			<!-- 공지사항 여부 추후 모임장만 가능하도록 처리 -->
			공지사항등록 <input type="checkbox" id="typeCheckbox" name="typeCheckbox" value="공지사항 등록">
			<input type="hidden" name="clubBoardType" id="clubBoardType" value="">
			<div>
			<!-- 추후 넣을값 : club_number, club_board_type -> -->
			<div>
				<input type="text" id="clubNumber" name="clubNumber" value="1">
				<input type="text" id="clubBoardType" name="clubBoardType" value="N">
			</div>
			</div>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
			</div>
		</form>
	</div>
	<!-- 투표창 modal 출력 -->
	<br><br>
	<button type="button" id="voteRegisterBtn">투표등록</button>
	
    <!-- 투표 모달 -->
    
    <div id="voteModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>

            <h3>게시글 투표 등록</h3>
            <p>투표 항목을 등록하세요.</p>

            <form action="VoteServlet" method="post">
                <div id="optionContainer">
                    <label for="option1">투표 항목 1</label>
                    <input type="text" id="option1" name="voteOption" value="" placeholder="항목 입력">
                </div>
                <div id="optionContainer">
                    <label for="option2">투표 항목 2</label>
                    <input type="text" id="option2" name="voteOption" value="" placeholder="항목 입력">
                </div>
                <!-- 옵션 추가 버튼 -->
                <button type="button" id="addOptionBtn">옵션 추가</button>
                <button type="submit">등록하기</button>
            </form>
        </div>
	</div>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>	
	<script>
	// 모달 관련 스크립트
    var modal = document.getElementById('voteModal');
    var openModalBtn = document.getElementById('voteModal');
    var closeModalBtn = document.getElementsByClassName('close')[0];
    var addOptionBtn = document.getElementById('addOptionBtn');

    // 모달 열기
    openModalBtn.onclick = function() {
        modal.style.display = 'block';
    }

    // 모달 닫기
    closeModalBtn.onclick = function() {
        modal.style.display = 'none';
    }

    // 모달 영역 외 클릭 시 닫기
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    }

    // 옵션 추가 버튼 클릭 시 동작
    addOptionBtn.onclick = function() {
    	var optionCount = 1;

        function addOption() {
            if (optionCount < 4) {
                optionCount++;

                var newOption = document.createElement("div");
                newOption.innerHTML = `
                    <label for="option${optionCount}">투표 항목 ${optionCount}</label>
                    <input type="text" id="option${optionCount}" name="voteOption" 
                    value="" placeholder="항목입력">
                `;
                
                var optionContainer = document.getElementById("optionContainer");
                optionContainer.appendChild(newOption);
            }
        };
    }
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ckeditor/upload'
    	}
    })
    .catch( error => {
        console.error( error );
    });
	

	function readURL(input) {
  		if (input.files && input.files[0]) {
    		var reader = new FileReader();
    	reader.onload = function(e) {
      		document.getElementById('preview').src = e.target.result;
    	};
    		reader.readAsDataURL(input.files[0]);
  		} else {
    	document.getElementById('preview').src = "";
  		}
	}
	
	
	
	</script>
</body>
</html>