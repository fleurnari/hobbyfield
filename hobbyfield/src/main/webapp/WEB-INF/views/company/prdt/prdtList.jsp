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
<div >
		<ul >
			<li ><a href="/company/prdt/orderedlist">주문 현황</a></li>
			<li ><a href="#">회원 관리</a></li>
			<li ><a href="/company/prdt/insert">상품 등록</a></li>
			<li ><a href="prdtList">상품 조회</a></li>
            <li ><a href="/company/prdt/prdtUpdate">상품 정보 수정</a></li>
			<li ><a href="/company/prdt/prdtDelete">상품 삭제</a></li>	
		</ul>
	</div>
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
					<c:forEach items="${prdtList}" var="prdt">
						<tr>
							<td><a href="prdtInfo/${prdt.prdtId }">${prdt.prdtId}</a></td>
							<td>${prdt.prdtName}</td>
							<td>${prdt.prdtPrice}</td>
							<td>${prdt.prdtStock}</td>
							<td>${prdt.prdtDist}</td>
							<td>${prdt.prdtInfo}</td>
							<td><fmt:formatDate value="${prdt.prdtRegDate}" type="date" pattern="yyyy-MM-dd"/> </td>
							<td><fmt:formatDate value="${prdt.prdtUpdate}" type="date" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>