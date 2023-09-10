<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
/*모임생성, 프로필 생성 */
.top-buttons {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-bottom: 20px; /* 여백 추가 */
}

.custom-button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    color: #fff;
    text-decoration: none;
    margin-left: 10px; /* 버튼 사이의 간격 */
    transition: background-color 0.2s;
    display: flex;
    align-items: center; /* 아이콘과 텍스트 중앙으로 정렬 */
}

.button-icon {
    margin-right: 10px; /* 아이콘 텍스트 사이의 간격 */
    font-size: 1.2em; /* 아이콘 크기 */
}

.club-create .button-icon {
    content: "\002B"; /* 플러스 아이콘 */
}

.profile-create .button-icon {
    content: "\1F464"; /* 사람 아이콘 */
}

.btn-primary:hover {
    background-color: #28a745; /* 초록색 */
}

/* 퀵메뉴 css */
 div, ul, li { 
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box; 
    padding: 0; 
    margin: 0; 
 } 

 a { 
    text-decoration: none; 
 } 

 .quickmenu { 
    position: fixed; 
    width: 150px;
    top: 85%;
    margin-top: -50px;
    right: 10px; */
    background: #FFD3A5;; 
    z-index: 100; /* 다른 요소들 위에 표시되도록 z-index 설정 */
 } 

 .quickmenu ul { 
    position: relative;
    float: left; 
    width: 100%; 
    display: inline-block; 
    border: 1px solid #ddd; 
 } 

 .quickmenu ul li { 
    float: left; 
    width: 100%; 
    border-bottom: 1px solid #ddd;
    text-align: center; 
    display: inline-block; 
 } 

 .quickmenu ul li a {
    position: relative; 
    float: left;
    width: 100%; 
    height: 30px; 
    line-height: 30px;
    text-align: center;
    color: #999;
    font-size: 9.5pt;
 }

 .quickmenu ul li a:hover {
    color: #000; 
 } 

 .quickmenu ul li:last-child { 
    border-bottom: 0; 
 } 

 .content { 
    position: relative; 
    min-height: 1000px; 
 } 


/* 모임 css */
#mainContainer {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px; /* 각 아이템 간의 간격을 조정 */
}

.clubItem {
    width: 23%;
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.2s, box-shadow 0.2s;
    cursor: pointer; /* 마우스를 올렸을 때 커서 변경 */
    position: relative;
}

.clubItem img {
    width: 100%;
    height: 220px; /* 이미지의 높이를 조정 */
    object-fit: cover;
}

.clubItem:hover {
    transform: translateY(-10px); /* 소모임이 살짝 떠오르는 효과 */
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
}

.clubInfo {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 10px;
    height: 150px; /* 정보의 높이를 조정 */
    background-color: #fff;
}

.clubInfo p {
    margin-bottom: 5px;
    font-size: 14px;
}

.clubInfo p:nth-child(1) {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 10px;
}

.rounded-info {
    background-color: #eee;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    margin-right: 5px;
}

.ck.ck-editor {
   width: 30%;
   max-width: 50px;
   margin: 0 auto;
}

.ck-editor__editable {
   height: 80vh;
}

#clubContainer {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* 요소 사이의 간격을 조정합니다. */
}

.club-board {
    width: calc(33.33% - 10px); /* 각 요소의 폭을 조정하고 여백을 고려합니다. */
    margin-bottom: 20px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #f9f9f9;
}
.club-board:hover{
   transform: translateY(-5px);
   box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
}
.club-info {
    font-weight: bold;
    font-size: 18px;
    color: #333;
    border-bottom: 1px; solid; color:black;   
    background-color: gray;
}

.board-writer {
    font-style: italic;
    color: #666;
}

.board-content {
    margin-top: 10px;
}

.board-write-date {
    color: #888;
}

.writer-img {
    max-width: 45px;
    max-height: 45px;
    height: auto;
}
.board-content img{
   display: none;
}


</style>
</head>
<body>
      <div class="top-buttons">
          <a href="${pageContext.request.contextPath}/club/clubInsert" class="custom-button club-create btn btn-primary">
              <span class="button-icon">&#43;</span> <!-- 플러스 아이콘 -->
              소모임 생성
          </a>
          <a href="${pageContext.request.contextPath}/club/profileInsert" class="custom-button profile-create btn btn-primary">
              <span class="button-icon">&#128100;</span> <!-- 사람 아이콘 -->
              프로필 생성
          </a>
      </div>

   
      <div class="quickmenu">
         <ul>
            <li><a href="${pageContext.request.contextPath}/club/clubList">소모임 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/club/clubInsert">소모임 생성</a></li>
            <li><a href="${pageContext.request.contextPath}/club/profileInsert">프로필 생성</a></li>
         </ul>
      </div>
   
<!--       <div align="center" style="margin-top: 100px;"> -->
         <h3>인기 모임</h3>
<!--       </div> -->

      <!-- 소모임 표시 -->
      <div id="mainContainer">
   <c:forEach items="${clubList}" var="club">
      <div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${club.clubNumber}'">
         <img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
         <div class="clubInfo">
            <p>${club.clubName}</p>
            <p>${club.clubInfo}</p>
            <span class="rounded-info">${club.clubCategory}</span>
            <span class="rounded-info">${club.majorLocation} ${club.subLocation}</span>
         </div>
      </div>
   </c:forEach>
</div>
      
      <h3>최신 게시글</h3>
         
      <div>
         <div id="clubContainer">
            <c:forEach items="${board}" var="board">
               <div class="club-board" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${board.clubNumber}'">
                  <div class="club-info">
                     <p>${board.clubName}</p>
                  </div>
                  <div class="board-writer">
                     <p>게시글작성자: ${board.clubBoardWriter}</p>
                     <img alt="writerImg"
                        src="${pageContext.request.contextPath}/${board.profileImgPath}${board.profileImg}"
                        class="writer-img">
                  </div>
                  <div class="board-content">${board.clubBoardContent}</div>
                  <div class="board-write-date">
                     작성일:
                     <fmt:formatDate value="${board.scheduleDate}"
                        pattern="yyyy-MM-dd" />
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>

   
      

    
          <!-- 퀵메뉴 -->
      <div class="quickmenu">
         <ul>
            <li><a href="${pageContext.request.contextPath}/club/clubList">소모임 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/club/clubInsert">소모임 생성</a></li>
            <li><a href="${pageContext.request.contextPath}/club/profileInsert">프로필 생성</a></li>
         </ul>
      </div>

      


  
          
<script type="text/javascript">

   $('#clubLink').on("click",function(e){
      e.stopPropagation();
      var email = $('#checkClub').
      // ajax로 해당 소모임에 사용자가 가입되어있는지 확인, 
      // 가입되어있을시 해당 페이지로 이동, 아닐시 가입페이지로 이동
      
      // ajax로 통해 보내야할 데이터는 Session의 member.memberEmail
      $.ajax({
         url : 'club/checkClubApply',
         data : email,
         type : 'POST',
         success : function(result) {
               console.log("ajax 호출, Session의 email : " + email);   
               if(result == ture){
                  // 해당 소모임 메인페이지 이동 호출 
               }else{
                  alert("해당 소모임 가입페이지로 이동합니다.")
               }
            }
         
         })
      });

  </script>

</body>
</html>