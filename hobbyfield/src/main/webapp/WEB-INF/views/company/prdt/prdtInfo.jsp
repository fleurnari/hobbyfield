<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>상품ID</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>재고</th>
						<th>상품분류</th>
						<th>상품정보</th>
						<th>상품 등록일</th>
						<th>최종 수정일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${prdtInfo.prdtId}</td>
						<td>${prdtInfo.prdtName}</td>
						<td>${prdtInfo.prdtPrice}</td>
						<td>${prdtInfo.prdtStock}</td>
						<td>${prdtInfo.prdtDist}</td>
						<td>${prdtInfo.prdtInfo}</td>
						<td><fmt:formatDate value="${prdtInfo.prdtRegDate}" type="date" pattern="yyyy-MM-dd"/> </td>
						<td><fmt:formatDate value="${prdtInfo.prdtUpdate}" type="date" pattern="yyyy-MM-dd"/></td>
					</tr>

				</tbody>
			</table>
		</div>
		<!-- class = row -->
	</div>
</body>
</html>