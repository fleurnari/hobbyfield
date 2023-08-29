<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">나의 아이템</h1>
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
							<th align="center" width="150">아이템 이름</th>
							<th align="center" width="150">아이템 유형</th>
							<th align="center" width="150">구매 일자</th>
							<th align="center" width="150">사용 기간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myitemList}" var="myitem">
							<tr>
								<td><img src="${myitem.pointImgPath}${myitem.pointImgName}"></td>
								<td>${myitem.pointName}</td>
								<td>${myitem.pointItemType}</td>
								<td><fmt:formatDate value="${myitem.myitemPurcdt}" pattern="yyyy-MM-dd"/></td>
								<c:choose>
								<c:when test="${myitem.myitemUseterm ne 0}">
									<td>${myitem.myitemUseterm} 일</td>
								</c:when>
								<c:otherwise>
									<td> 영구 </td>
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