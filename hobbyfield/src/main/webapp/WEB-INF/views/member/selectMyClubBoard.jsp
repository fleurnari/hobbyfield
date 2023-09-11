<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body, h1 {
    margin: 0;
    padding: 0;
  }

  .bg-100 {
    background-color: #f5f5f5;
    padding: 30px 0;
  }
  .text-center {
    text-align: center;
  }

  table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
    border: 1px solid #ddd;
  }

  th, td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
    text-align: left;
  }

  th {
    background-color: #f2f2f2;
  }

  tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  tr:hover {
    cursor: pointer;
  }

  /* Style the images */
  img {
    max-width: 100px;
    max-height: 100px;
  }
  
  /* 박스 스타일 */
	#box {
	  display: flex;
	  justify-content: center;
	  align-items: flex-start;
	}
	
	#box > div {
	  margin-right: 20px;
	}
.club-info{
	border: 1px solid #dddd;
	margin-top: 50px;
}
.profile-img{
	width: 65px;
	height: 65px;
	float: left;
}
.board-content img{
	display: none;
}
.profile-img{
	width: 65px;
	height: 65px;
	
}
</style>
</head>
<body>


	<h3>내가 쓴 글</h3>

	<section class="bg-100 py-7" id="packages">
       <div class="container-lg">
         <div class="row justify-content-center">
           <div class="col-12">
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">내가 쓴 글</h1>
           </div>
         </div>
         <div id="box">
         	<div>
         		<jsp:include page="myPageMenu.jsp"></jsp:include>
         	</div>
		 <div>
				<table>
					<thead>
						<tr>
							<th align="center" width="150">소모임 이름 </th>
							<th align="center" width="150">게시물 내용</th>
							<th align="center" width="150">작성 일자</th>
							<th align="center" width="150">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="board">
							<tr onclick="location.href='${pageContext.request.contextPath}/club/clubBoardInfo?boardNumber=${board.boardNumber}'">
								<td>${board.clubName}</td>
								<td class="board-content">${board.clubBoardContent}</td>
								<td><fmt:formatDate value="${board.clubBoardWdate}" dateStyle="full"/></td>
								<td>${board.clubBoardViews}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
       </div>
      </div>
     </section>
</body>
</html>