<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<body>
    <nav class="navbar navbar-expand  navbar-dark bg-dark">  
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./home">Home</a>
            </div>
        </div>
    </nav> 
    <div class="jumbotron">
        <div class="container" align="center">
            <h1 class="display-3">상품 목록</h1>
        </div>
    </div>
    <div class="container">
		<div class="row">
			<!-- 좌측 영역 -->
			<div class="col-md-2">
				<ul class="list-group">
					<li class="list-group-item"><a href="prdtInsert">상품등록</a></li>
					<li class="list-group-item"><a href="cartList">장바구니</a></li>
					<li class="list-group-item"><a href="orderList">주문목록</a></li>
					<li class="list-group-item"><a href="adminOrderList">배송관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/CSboard/CSboardList">공지사항</a></li>
				</ul>
			</div>
			<!-- 상품 목록 영역 -->
			<div class="col-md-10">
				<div class="row" align="center">
					<c:forEach items="${prdtList}" var="prdt"> 
						<div class="col-md-4">
							<h3><a href="prdtInfo?prdtId=${prdt.prdtId}">${prdt.prdtName}</a></h3>
							<br>
							<p>${prdt.prdtPrice}원</p>
						</div>
					</c:forEach> 
				</div>
				<div class="search">
					<!-- 검색 폼 등의 코드 ... -->
				</div>
				<div>
					<!-- 페이지 네이션 등의 코드 ... -->
				</div>
			</div>
		</div>
	</div>
	<script>
		// 검색 버튼 클릭 시 동작하는 자바스크립트 코드
		$(function() {
			$('#searchBtn').click(function() {
				self.location = "${pageContext.request.contextPath }/prdt/prdtList"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput').val());
			});
		});
	</script>
</body>
</html>