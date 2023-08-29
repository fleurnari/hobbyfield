<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>나의 아이템 구매현황</title>
=======
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
>>>>>>> branch 'nari' of https://github.com/fleurnari/hobbyfield.git
</head>
<body>
<<<<<<< HEAD
	<section>
		<table>
			<c:forEach items="${myitemList}" var="myitem">
				<tr>
					<td>${myitem.pointId}</td>
					<td>${myitem.pointOptId}</td>
					<td>${myitem.myitemId}</td>

					<td>${myitem.pointPrice}</td>
					<td>${myitem.pointName}</td>
					<td>${myitem.pointItemType}</td>
					<td>${myitem.pointImgPath}</td>
					<td>${myitem.pointImgName}</td>
					<td>${myitem.myitemUseterm}</td>
					<td>${myitem.myitemPurcdt}</td>
					<td>${myitem.memberEmail}</td>
				</tr>
			</c:forEach>
		</table>


		<!-- 나리언니꺼에 붙이려고 대충 여기다 한거임 -->
		<!-- 		<form action="clubTotalProcess" method="post"> -->
		<!-- 			<div class="form-choice"> -->

		<!-- 				<label for="clubName">나의 소모임</label> <select id="clubName" -->
		<!-- 					name="clubName" required> -->
		<!-- 					<option value="" disabled selected>적용할 소모임 선택</option> -->
		<%-- 					<c:forEach items="${clubList}" var="clubItem"> --%>
		<%-- 						<option value="${clubItem.clubId}">${clubItem.clubName}</option> --%>
		<%-- 					</c:forEach> --%>
		<!-- 				</select> -->
		<!-- 				</div> -->
		<!-- 		</form> -->
		
		
		<form action="clubTotalProcess" method="post">
			<div class="form-choice">
				<label for="clubNumber">나의 소모임</label> <select id="clubNumber"
					name="clubNumber" required>
					<option value="" disabled selected>적용할 소모임 선택</option>
					<c:forEach items="${club}" var="clubItem">
						<option value="${clubItem.clubNumber}">${clubItem.clubName}</option>
					</c:forEach>
				</select>
				<button type="submit" >증원권 적용</button>
			</div>
			
			
		</form>





	</section>
=======
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
>>>>>>> branch 'nari' of https://github.com/fleurnari/hobbyfield.git
</body>

</html>