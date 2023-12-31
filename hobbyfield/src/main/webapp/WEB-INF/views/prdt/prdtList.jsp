<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
body {
    color: #000;
}
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

.jumbotron{
   margin-top: 100px;
}

#box2{
   margin-top: -50px;
   margin-bottom: 50px;
}

</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
   <body>
   
   <div id="box2">
       <div class="row align-items-center min-vh-30 min-vh-md-30">
            <div class="col-12 text-center py-6">
               <h1 class="lh-sm fs-lg-6 fs-xxl-7">HOBBY SHOP</h1>
               <p class="text-700">취미 공유 통합 플랫폼</p>
            </div>
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
               <li class="list-group-item"><a href="${pageContext.request.contextPath}/CSboard/CSboardList"><img src="${pageContext.request.contextPath}/resources/svg/person.svg" alt="">  배송안내</a></li>
            </ul>
         </div>
         
         <!-- 상품 목록 영역 -->
         <div class="col-md-10">
            <div class="row" align="center">
               <c:forEach items="${prdtList}" var="prdt"> 
                  <div class="col-md-4">
                     <img onerror="this.onerror=null; this.src=${pageContext.request.contextPath}/resources/images/'dog.png';" src="${pageContext.request.contextPath}${prdt.prdtThumPath}${prdt.prdtThum}" style="width: 200px; height: 250px;">
                     <h3 class="lh-sm fs-lg-1 fs-xxl-2"><a href="prdtInfo?prdtId=${prdt.prdtId}">${prdt.prdtName}</a></h3>
                     <br>
                     <p class="text-600"><fmt:formatNumber type="number" value="${prdt.prdtPrice}" pattern="###,###,###원"/></p>
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
                        <li><a href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                    </c:if>
            
                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                        <c:choose>
                            <c:when test="${idx eq pageMaker.cri.page}">
                                <li class="active"><a href="#">${idx}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(idx)}">${idx}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
            
                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a href="${pageContext.request.contextPath }/prdt/prdtList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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

// 모델에 추가한 memberGrd 값을 가져와서 JavaScript 변수에 저장
var userPermission = "${memberGrd}";
console.log(userPermission);
var adminOrderListMenu = document.getElementById("deliveryMenu");
adminOrderListMenu.addEventListener("click", function () {
    if (userPermission !== "A2" && userPermission !== "A3") {
       Swal.fire(
              '판매자만 접근이 가능합니다.',
              '',
              'error'
            )
        event.preventDefault(); 
    }
});

var prdtInsertMenu = document.querySelector('a[href="prdtInsert"]');
prdtInsertMenu.addEventListener("click", function (event) {
    if (userPermission !== "A2" && userPermission !== "A3") {
       Swal.fire(
                '판매자만 접근이 가능합니다.',
                '',
                'error'
              )
        event.preventDefault(); 
    }
});
</script>
</body>
</html>