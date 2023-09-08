<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문 목록</title>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
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
                    <td>${order.amount}</td>
                    <td><button type="button" class="btn btn-danger cancelBtn" data-orderId="${order.orderId}">취소</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>





<button onclick="cancelPayment()">카카오페이 결제취소 테스트</button>


<script>
var IMP = window.IMP;
IMP.init("imp10078031");
	
// 결제 취소 함수
function cancelPayment() {
  $.ajax({
    url: "https://api.iamport.kr/payments/cancel?_token=7cfcf250b229b9de0775cd27931a5c68cf05f4d7",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify({
      imp_uid: "imp_100895842761",
      merchant_uid: "20230908135455651"
    }),
    dataType: "json",
    success: function(response) {
      if (response.success) {
        alert("결제가 취소되었습니다.");
      } else {
        alert("결제 취소 실패: " + response.error_msg);
      }
    },
    error: function() {
      alert("결제 취소 요청 실패");
    }
  });
}
</script>




<script>

$(document).ready(function() {
	
    // 주문 취소 버튼 클릭 이벤트 처리
    $(".cancelBtn").click(function() {
        var orderId = $(this).attr("data-orderId");  // 주문 번호 가져오기
        var $row = $(this).closest("tr"); 
        
        $.ajax({
            url: "getDelivery", 
            type: "post",
            dataType: "json", 
            data: { orderId: orderId },
            success: function(data) {
                var deliveryStatus = data.delivery; 
            
                if (deliveryStatus === "배송준비중") {
                    
                    $.ajax({
                        url: "cancelOrder", 
                        type: "post",
                        data: { orderId: orderId },
                        success: function(result) {
                            if (result === "success") {
                                $row.remove();
                                alert("주문이 취소되었습니다.");
                                console.log("주문 취소 성공");
                            } else {
                                console.log("주문 취소 실패");
                            }
                        },
                        error: function() {
                            console.log("주문 취소 요청 실패");
                        }
                    });
                } else {
                    alert("주문 상태가 배송 준비 중이 아닙니다.");
                    console.log(deliveryStatus);
                }
            },
            error: function() {
                console.log("주문 상태 조회 실패");
            }
        });
    });
});
</script>
</body>
</html>