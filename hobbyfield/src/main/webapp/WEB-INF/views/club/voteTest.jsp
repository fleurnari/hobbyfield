<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글</title>
    <title>투표 생성</title>
    <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 모달 숨김 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            text-align: center;
        }

        /* 모달 닫기 버튼 스타일 */
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
    <script>
        function addInput() {
            var inputContainer = document.getElementById("input-container");
            var inputCount = inputContainer.getElementsByTagName("input").length;

            if (inputCount < 5) {
                var newInput = document.createElement("input");
                newInput.type = "text";
                newInput.name = "option" + (inputCount + 1);
                newInput.placeholder = "투표 옵션 " + (inputCount + 1);
                inputContainer.appendChild(newInput);
            } else {
                alert("최대 5개까지 입력 가능합니다.");
            }
        }

        function openModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
    </script>
</head>
<body>
    
<div align="center" style="margin-top: 100px;">

    <button onclick="openModal()">투표생성</button>
</div>    

   

    <!-- 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>투표</h2>
            <input type="text" id="voteSubject" name="voteSubject" placeholder="투표제목">
          	 <div id="input-container">
		        <!-- 초기에 3개의 input 태그 생성 -->
		        <input type="text" name="option1" placeholder="투표 옵션 1">
		        <input type="text" name="option2" placeholder="투표 옵션 2">
		        <input type="text" name="option3" placeholder="투표 옵션 3">
		    </div>
          	<button onclick="addInput()">옵션 추가</button>
          	
          	<div id="tpye-button">
          		<button >복수 투표</button>
          		<button>무기명 투표</button>
          		<button></button>
          	</div>
          	<div>
          		<button type="button">첨부하기</button>
          	</div>
        </div>
    </div>
</body>
</html>
