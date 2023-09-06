<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
    <div class="allCheck" align="center">
		<input type="checkbox" name="allCheck" id="allCheck" /><label
			for="allCheck">모두 선택</label>
	</div>
	<div class="delBtn" align="center">
		<button type="button" class="btn btn-danger" id="selectUpdate_btn">배송사항 변경</button>
	</div>
    
    <table class="table table-hover">
        <thead>
            <tr>
                <th>선택</th>
                <th>주문 번호</th>
                <th>상품명</th>
                <th>주문날짜</th>
                <th>결제금액</th>
                <th>배송상태</th>
                <th>배송시 요청사항</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${adminOrderList}">
                <tr>
                    <td><input type="checkbox" class="chBox" data-orderId="${order.orderId}" /></td>
                    <td>${order.orderId}</td>
                    <td>${order.prdtName}</td>
                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
                    <td><fmt:formatNumber type="number" value="${order.amount}" pattern="###,###,###원"/></td>
                    <td>${order.delivery}</td>
                    <td>${order.orderMemo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>

//모두선택
$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	});
	
	
	
//선택된 주문목록 배송 상태 변경
$("#selectUpdate_btn").click(function(){
    var confirm_val = confirm("배송 상태를 변경하시겠습니까?");
    
    if(confirm_val) {
        var checkArr = [];
       
        $("input[class='chBox']:checked").each(function(){
            checkArr.push($(this).attr("data-orderId"));
        });
        
        var dataToSend = {
            orderIds: checkArr,
            delivery: "배송중" // 변경하려는 배송 상태
        };
        
        $.ajax({
            url: "updateDelivery",
            type: "post",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(dataToSend),
            success: function(result){
                if(result.success){
                    location.href = "adminOrderList";
                } else {
                    alert("변경 실패ㅠ");
                }
            }
        });
    } 
});
	 
	 
</script>
</body>
</html>
