<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>CS게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
 .custom-container {
        margin-top: 150px; /* 원하는 여백 크기(px) 설정 */
    }
   a {
    cursor: pointer; /* 포인터 모양의 커서로 변경 */
}
</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container custom-container">
        <nav>
                    <div>
                        <h5>
                            카테고리
                            <span>></span>
                            배송관련안내
                        </h5>
                    </div>
                </nav>
        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    <li class="list-group-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/svg/bars.svg" alt=""> 카테고리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/prdt/prdtInsert"><img src="${pageContext.request.contextPath}/resources/svg/tags.svg" alt=""> 상품등록</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/prdt/cartList"><img src="${pageContext.request.contextPath}/resources/svg/cart.svg" alt=""> 장바구니</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/prdt/orderList"><img src="${pageContext.request.contextPath}/resources/svg/card.svg" alt=""> 주문목록</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/prdt/adminOrderList" id="deliveryMenu"><img src="${pageContext.request.contextPath}/resources/svg/truck.svg" alt=""> 배송관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/CSboard/CSboardList"><img src="${pageContext.request.contextPath}/resources/svg/person.svg" alt="">  배송안내</a></li>
                </div>
            </div>
            <div class="col-md-9">
                <table class="table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th style="width: 50%;">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${CSboardList}" var="CSboard">
                            <tr onmouseover="this.style.cursor='pointer';" onclick="location.href='CSboardInfo?csNumber=${CSboard.csNumber}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'">
                                <td>${CSboard.csNumber}</td>
                                <td>${CSboard.csTitle}</td>
                                <td>${CSboard.csWriter}</td>
                                <td><fmt:formatDate value="${CSboard.csDate}" pattern="yyyy년MM월dd일" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-center">
                    <button type="button" class="btn btn-primary" onclick="location.href='CSboardInsert'">게시글 등록</button>
                </div>
                <div class="row">
                    <div class="col-md-12" style="margin-top: 20px;">
                        <form class="form-inline">
                            <div class="form-group">
                               <select class="form-control" name="searchType">
								    <option value="t" ${scri.searchType eq 't' ? 'selected' : ''}>제목</option>
								    <option value="c" ${scri.searchType eq 'c' ? 'selected' : ''}>내용</option>
								    <option value="w" ${scri.searchType eq 'w' ? 'selected' : ''}>작성자</option>
								    <option value="tc" ${scri.searchType eq 'tc' ? 'selected' : ''}>제목+내용</option>
								</select>
                            </div>
                            <div class="form-group mx-sm-3">
                                <input type="text" class="form-control" id="keywordInput" name="keyword" value="${scri.keyword}" placeholder="검색어 입력">
                            </div>
                            <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
                        </form>
                    </div>
                </div>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pageMaker.prev}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/CSboard/CSboardList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
                            </li>
                        </c:if>
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/CSboard/CSboardList${pageMaker.makeSearch(idx)}">${idx}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/CSboard/CSboardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        $(function() {
            $('#searchBtn').click(function() {
                self.location = "${pageContext.request.contextPath}/CSboard/CSboardList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
            });
        });
    </script>
</body>
</html>