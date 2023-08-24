<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Product List</h1>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach items="${prdtList}" var="product">
            <tr>
                <td><a href="prdtInfo?prdtId=${product.prdtId}">${product.prdtName}</a></td>
                <td>${product.prdtPrice}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>