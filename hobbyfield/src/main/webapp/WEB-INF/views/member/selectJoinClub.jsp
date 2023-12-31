<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  /* Reset some default margin and padding */
  body, h1 {
    margin: 0;
    padding: 0;
  }

  /* Add some spacing and background color to the section */
  .bg-100 {
    background-color: #f5f5f5;
    padding: 30px 0;
  }

  /* Center align the h1 */
  .text-center {
    text-align: center;
  }

  /* Add some spacing and border to the table */
  table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
    border: 1px solid #ddd;
  }

  /* Add some padding and border to table cells */
  th, td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
    text-align: left;
  }

  /* Style the header cells */
  th {
    background-color: #f2f2f2;
  }

  /* Style alternating rows with different background colors */
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  /* Add pointer cursor on hover for clickable rows */
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
</style>
</head>
<body>
		<section class="bg-100 py-7" id="packages">
       <div class="container-lg">
         <div class="row justify-content-center">
           <div class="col-12">
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">나의 소모임</h1>
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
							<th align="center" width="150">이미지</th>
							<th align="center" width="150">소모임 이름</th>
							<th align="center" width="150">카테고리</th>
							<th align="center" width="150">모임 분류</th>
							<th align="center" width="150">공개 여부</th>
							<th align="center" width="150">회원 구분</th>
							<th align="center" width="150">소모임 정원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${clubList}" var="club">
							<tr onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${club.clubNumber}'">
								<td><img src="${pageContext.request.contextPath}${club.clubImgPath}${club.clubImg}"></td>
								<td>${club.clubName}</td>
								<td>${club.clubCategory}</td>
								<td>${club.clubType}</td>
								<td>${club.clubPublic}</td>
								<c:choose>
									<c:when test="${club.clubManager eq club.profileNickname}">
										<td>모임장</td>
									</c:when>
									<c:otherwise>
										<td>모임회원</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${club.clubTotal == 0}">
										<td>제한 없음</td>
									</c:when>
									<c:otherwise>
										<td> ${club.clubTotal} 명 </td>
									</c:otherwise>
								</c:choose>
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