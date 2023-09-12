<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.container{
	margin-bottom: 70px;
}

#box2{
	margin-top: -100px;
}

.col-md-2 {
    position: absolute;
    left: 0;
}
</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문 목록</title>
</head>
<body>

<div id="box2">
 <div class="row align-items-center min-vh-30 min-vh-md-30">
			<div class="col-12 text-center py-7">
				<h1 class="lh-sm fs-lg-6 fs-xxl-7">HOBBY SHOP</h1>
				<p class="text-700">취미 공유 통합 플랫폼</p>
			</div>
	</div>
	
</div>

  <div class="container">
  			<div>
	<nav class="class=" navbar bg-primary" data-bs-theme="dark"">
		<div class="container">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/prdtList">상품목록</a></li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath }/prdt/prdtInsert">상품등록</a></li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/cartList">장바구니</a>
				</li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/orderList">주문내역</a>
				</li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/CSboard/CsboardList">배송안내</a>
				</li>
						</div>
			</ul>
		</div>
	</nav>
</div>
	    <h1>주문 내역</h1>
	    <table class="table table-hover">
        <thead>
            <tr>
                <th>주문 번호</th>
                <th>상품명</th>
                <th>사이즈</th>
                <th>주문날짜</th>
                <th>결제금액</th>
                <th>주문취소</th>
            </tr>
        </thead>
        <tbody>
        
             <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.prdtName}</td>
                    <td>${order.prdtOption}</td>
                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
                    <td>${order.amount}<input type="hidden" value="${order.impUid}" id="impUid"></td> 
                    <td><button type="button" class="btn btn-danger cancelBtn" data-orderId="${order.orderId}" data-impUid="${order.impUid}">취소</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- <button onclick="getToken()">토큰 확인</button> -->
<script>

 function getToken() {
	  $.ajax({
	    url: "${pageContext.request.contextPath}/api/getToken", 
	    type: "GET", 
	    dataType: "json", 
	    success: function(response) {
	      if (response) {
	        console.log("토큰: " + response);
	        alert("토큰을 성공적으로 가져왔습니다.");
	      } else {
	        alert("토큰을 가져오는 데 실패했습니다.");
	      }
	    },
	    error: function() {
	      alert("서버와 통신 중 오류가 발생했습니다.");
	    }
	  });
	}
	
function testCancelOrder() {
	  var impUid = "imp_477713132414"; 

	  $.ajax({
	    url: "${pageContext.request.contextPath}/api/cancel", 
	    type: "POST",
	    contentType: "application/json",
	    data: JSON.stringify({
	      accessToken: "73a37af017b354e7492d8244946382cc2fc6fbb0",
	      impUid: impUid
	    }),
	    dataType: "json",
	    success: function(response) {
	      if (response.success) {
	        alert("주문이 취소되었습니다.");
	        console.log("주문 취소 성공");
	      } else {
	        alert("주문 취소 실패: " + response.error_msg);
	        console.log("주문 취소 실패");
	      }
	    },
	    error: function() {
	      alert("주문 취소 요청 실패");
	    }
	  });
	} 
</script>


<script>

$(document).ready(function() {
    // 주문 취소 버튼 클릭 이벤트 처리
    $(".cancelBtn").click(function() {
        var orderId = $(this).attr("data-orderId");  // 주문 번호 가져오기
        var impUid = $(this).attr("data-impUid");
        var $row = $(this).closest("tr"); 
        
        // SweetAlert2로 컨펌 대화 상자 표시
        Swal.fire({
            title: '주문 취소 확인',
            text: '주문을 취소하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '예, 취소합니다',
            cancelButtonText: '아니요, 취소하지 않습니다'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 확인을 클릭한 경우
                $.ajax({
                    url: "getDelivery", 
                    type: "post",
                    dataType: "json", 
                    data: { orderId: orderId },
                    success: function(data) {
                        var deliveryStatus = data.delivery; 
                    
                        if (deliveryStatus === "배송준비중") {
                            // 두 번째 AJAX 요청
                            $.ajax({
                                url: "cancelOrder", 
                                type: "post",
                                data: { orderId: orderId },
                                success: function(result) {
                                    if (result === "success") {
                                        // 두 번째 요청이 성공하면 세 번째 요청 실행
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/api/cancel", 
                                            type: "POST",
                                            contentType: "application/json",
                                            data: JSON.stringify({
                                                impUid: impUid 
                                            }),
                                            dataType: "json",
                                            success: function(response) {
                                                if (response.success) {
                                                    $row.remove();
                                                } else {
                                                    // 세 번째 요청 실패 처리
                                                }
                                            },
                                            error: function() {
                                            	Swal.fire(
                                            			  '주문이 취소되었습니다.',
                                            			  '',
                                            			  'success'
                                            			)
                                            }
                                        });
                                    } else {
                                        // 두 번째 요청 실패 처리
                                    }
                                },
                                error: function() {
                                    console.log("주문 취소 요청 실패");
                                }
                            });
                        } else {
                        	Swal.fire(
                        			  '배송이 이미 시작되어서 취소가 불가능합니다.',
                        			  '',
                        			  'error'
                        			)
                        }
                    },
                    error: function() {
                    }
                });
            }
        });
    });
});
</script>
</body>
</html>