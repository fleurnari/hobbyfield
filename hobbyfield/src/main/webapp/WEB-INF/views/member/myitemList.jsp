<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 아이템 구매현황</title>
</head>
<body>
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
</body>

</html>