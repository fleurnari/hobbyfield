<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
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
                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
                    <td>${order.amount}</td>
                    <td><button type="button" class="btn btn-danger cancelBtn" data-orderId="${order.orderId}">취소</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
$(document).ready(function() {
    // 주문 취소 버튼 클릭 이벤트 처리
    $(".cancelBtn").click(function() {
    	var orderId = $(this).attr("data-orderId");  // 주문 번호 가져오기
        console.log(orderId);
        var $row = $(this).closest("tr"); // 현재 행 (tr) 찾기

        // 주문 취소 Ajax 요청
        $.ajax({
            url: "cancelOrder",
            type: "post",
            data: { orderId: orderId },
            success: function(result) {
                if (result === "success") {
                    $row.remove();
                    console.log("주문 취소 성공");
                } else {
                    console.log("주문 취소 실패");
                }
            },
            error: function() {
                console.log("주문 취소 요청 실패");
            }
        });
    });
});
</script>
</body>
</html>