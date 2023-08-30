<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  /* 스타일 시트 */
</style>
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
                <th>선택</th>
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
                    <td><input type="checkbox" class="chBox" data-orderId="${order.orderId}" /></td>
                    <td>${order.orderId}</td>
                    <td>${order.prdtName}</td>
                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
                    <td>${order.amount}메소</td>
                    <td><button type="button" class="btn btn-danger deleteBtn" data-orderId="${order.orderId}">취소</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
</script>
</body>
</html>