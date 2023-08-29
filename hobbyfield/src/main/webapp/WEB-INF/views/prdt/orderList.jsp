<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.orderInfo {
  width: 300px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
  background-color: #fff;
  display:none;
}

.inputArea {
  margin-bottom: 10px;
}

.inputArea label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.inputArea input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.order_btn,
.cancel_btn {
  display: inline-block;
  padding: 10px 20px;
  margin-right: 10px;
  font-size: 14px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.order_btn {
  background-color: #337ab7;
  color: #fff;
}

.cancel_btn {
  background-color: #ccc;
  color: #333;
}

</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>
	<div class="container" >
    <div style="padding-top: 50px">
        <table class="table table-hover">
        <tr>
            <th>주문번호</th>
            <th>수령인</th>
            <th>주소</th>
            <th>가격</th>
            <th>배송상태</th>
        </tr>
        <c:forEach items="${orderList}" var="orderList">
        	<div class="checkBox">
        		
        	</div>
        <tr>
            <td>
            <p><a href="orderView?n=${orderList.orderId}">${orderList.orderId}</a></p></td>
            <td>${orderList.orderRec}</td>
            <td>(${orderList.memberZip}) ${orderList.memberBaseaddr } ${orderList.memberDetaaddr }</td>
            <td><fmt:formatNumber value="${orderList.amount}" pattern="###,###,###" /> 원</td>
            <td>${orderList.delivery}</td>
        </tr>
        </c:forEach>
        </table>
	</div>
</div>
<script>

</script>
</body>
</html>