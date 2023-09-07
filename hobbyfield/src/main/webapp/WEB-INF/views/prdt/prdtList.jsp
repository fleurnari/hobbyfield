<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.search {
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    margin-top: 20px; /* 위쪽으로 20px만큼 이동 */
    margin-bottom: 20px; /* 아래쪽으로 20px만큼 이동 */
    position: relative; /* 상대적 위치 설정 */
    left: 200px; /* 오른쪽으로 20px 이동 */
}

.search select, .search input[type="text"] {
    height: 40px;
    padding: 5px;
    border: 1px solid #ddd; 
    outline: none;
    font-size: 16px;
    margin-right: 10px;
}


#searchBtn {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}


#searchBtn:hover {
    background-color: #0056b3;
}

/* Pagination CSS */
.pagination {
    margin: 20px 0;
    display: flex;
    justify-content: center;
}

.pagination ul {
    list-style: none;
    padding: 0;
    display: flex;
    align-items: center;
}

.pagination li {
    margin-right: 10px;
    border: 1px solid #ddd;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 20%; 
}

.pagination li a {
    text-decoration: none;
    color: #333;
}

.pagination li.active {
    background-color: #007bff;
    border: 1px solid #007bff;
}

.pagination li.active a {
    color: #fff;
}

.pagination li:hover {
    background-color: #ccc;
}

/* Previous and Next buttons */
.pagination .prev,
.pagination .next {
    margin: 0 10px;
    border: 1px solid #007bff;
    color: #007bff;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 50%; /* 더 둥글게 설정 */
}

.pagination .prev a,
.pagination .next a {
    text-decoration: none;
    color: #007bff;
}

.pagination .prev:hover,
.pagination .next:hover {
    background-color: #ccc;
}



</style>
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
					<li class="list-group-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/svg/bars.svg" alt=""> 카테고리</a></li>
					<li class="list-group-item"><a href="prdtInsert"><img src="${pageContext.request.contextPath}/resources/svg/tags.svg" alt=""> 상품등록</a></li>
					<li class="list-group-item"><a href="cartList"><img src="${pageContext.request.contextPath}/resources/svg/cart.svg" alt=""> 장바구니</a></li>
					<li class="list-group-item"><a href="orderList"><img src="${pageContext.request.contextPath}/resources/svg/card.svg" alt=""> 주문목록</a></li>
					<li class="list-group-item"><a href="adminOrderList" id="deliveryMenu"><img src="${pageContext.request.contextPath}/resources/svg/truck.svg" alt=""> 배송관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/CSboard/CSboardList"><img src="${pageContext.request.contextPath}/resources/svg/person.svg" alt="">  공지사항</a></li>
				</ul>
			</div>
			<!-- 상품 목록 영역 -->
			<div class="col-md-10">
				<div class="row" align="center">
					<c:forEach items="${prdtList}" var="prdt"> 
						<div class="col-md-4">
							<h3><a href="prdtInfo?prdtId=${prdt.prdtId}">${prdt.prdtName}</a></h3>
							<br>
							<p><fmt:formatNumber type="number" value="${prdt.prdtPrice}" pattern="###,###,###원"/></p>
						</div>
					</c:forEach> 
				</div>
			<div class = "search1">	
				<div class="search">
							<select name="searchType">
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"
									<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"
									<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}" />

							<button id="searchBtn" type="button">검색</button>
				</div>
			</div>	
				<div class="pagination">
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
	
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a
								href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
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
	
<script>
    // 서버에서 세션을 통해 가져온 사용자 권한을 JavaScript 변수에 저장
    var userPermission = "<%= session.getAttribute("memberGrd") %>";

    // 배송관리 메뉴 클릭 이벤트 처리
    var adminOrderListMenu = document.getElementById("deliveryMenu");
    adminOrderListMenu.addEventListener("click", function () {
        if ((userPermission !== "A2" && userPermission !== "A3") {
            alert("판매자만 접근이 가능합니다.");
            event.preventDefault(); // 링크 클릭 이벤트를 취소하여 페이지 이동을 막습니다.
        }
    });
</script>
</body>
</html>