<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
       #clubContainer {
           display: flex;
           flex-wrap: wrap;
           justify-content: space-around;
       }
	
       .clubItem {
           width: 23%; /* 4개씩 나열될 수 있도록 너비 설정 */
           margin: 10px;
           border: 1px solid #ccc;
           border-radius: 10px; /* 굴곡진 모서리 */
           overflow: hidden; /* 이미지가 박스를 벗어나지 않도록 함 */
           transition: transform 0.2s; /* 부드러운 hover 효과 */
           position: relative; /* 하위 요소의 위치 지정을 위해 */
       }

       .clubItem:hover {
           transform: scale(1.05); /* 이미지를 클릭할 때 크기를 약간 확대 */
       }

       .clubItem img {
           width: 100%;
           height: 350px;
           object-fit: cover; /* 이미지가 박스 내에 꽉 차도록 */
       }

       .clubInfo {
           display: none; /* 기본적으로 정보는 숨김 */
           position: absolute;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           background: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
           color: white;
           padding: 10px;
           box-sizing: border-box;
       }

       .clubItem:hover .clubInfo {
           display: block; /* 마우스를 올리면 정보 표시 */
       }
       .ck.ck-editor {
	width: 30%;
	max-width: 50px;
	margin: 0 auto;
	}
	.ck-editor__editable {
		height: 80vh;
	}
</style>
</head>
<body>
	<section>
	<div align="center">
		
		
			
		
		 <h3>
		 	club 상위 리스트
	          <div>
	          <a href="${pageContext.request.contextPath}/clubList">소모임 조회페이지</a>
	          </div><br>
	          <div>
	          <a class="btn btn-success" href="${pageContext.request.contextPath}/profileInsert">프로필 생성</a>
	          </div>
		 </h3> 
		 <!-- 소모임 표시 -->    
	     <div id="clubContainer"> 
	            <c:forEach items="${clubList}" var="club">
	                <div class="clubItem" onclick="location.href='clubInfo?clubNumber=${club.clubNumber}&profileNickname=${club.profileNickname}'">
	                    <img src="${club.clubImgPath}${club.clubImg}">
	                    <div class="clubInfo">
	                        <p>모임리더: ${club.profileNickname}</p>
	                        <p>모임이름: ${club.clubName}</p>
	                        <p>카테고리: ${club.clubCategory}</p>
	                        <p>분류: ${club.clubType}</p>
	                        <p>소개글: ${club.clubInfo}</p>
	                        <p>광역시: ${club.majorLocation}</p>
	                        <p>구: ${club.subLocation}</p>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>	
	
	<h3>최신 게시글</h3>

	    <div>
	        <div id="clubContainer">
	            <c:forEach items="${board}" var="board">
	                <div id="clubBoard">
	                    <div class="">
	                        <p>게시글번호: ${board.boardNumber}</p>
	                        <p>소모임번호: ${board.clubNumber}</p>
	                        <p>게시글작성자: ${board.clubBoardWriter}</p>
	                        <p>게시글내용: </p><div id="editor">${board.clubBoardContent}</div>
	                        <p>작성일: ${board.clubBoardWdate}</p>	                 
	                        <p>일정날짜 : <fmt:formatDate value="${board.scheduleDate}" pattern="yyyy-MM-dd" /></p>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </div>
    </div>
	</section>
    		
<script type="text/javascript">
	$('#clubLink').on("click",function(e){
		.stopPropagation();
		var email = $('#checkClub').
		// ajax로 해당 소모임에 사용자가 가입되어있는지 확인, 
		// 가입되어있을시 해당 페이지로 이동, 아닐시 가입페이지로 이동
		
		// ajax로 통해 보내야할 데이터는 Session의 member.memberEmail
		$.ajax({
			url : 'checkClubApply',
			data : email,
			type : 'POST',
			success : function(result) {
					console.log("ajax 호출, Session의 email : " + email);	
					if(result == ture){
						// 해당 소모임 메인페이지 이동 호출 
					}esle{
						alert("해당 소모임 가입페이지로 이동합니다.")
					}
				}
			
			}
		})

		
	});

	$('#clubContainer').on('click',function(e){
		var linkta
	});
	
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	toolbar: []
    })
    .then(editor => {
        

        editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
    })
    .catch( error => {
        console.error( error );
    });

      editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
   })
   .catch( error => {
      console.error( error );
   });
	bootstrap modal ex

	
</script>	
	
	
</body>
</html>