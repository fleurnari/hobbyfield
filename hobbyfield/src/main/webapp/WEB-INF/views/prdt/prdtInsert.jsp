<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<br>
					<br>
					<br>
					<br>
					<br>
<div align="center">
	 <form action="prdtInsert" method="post">
        <label for="prdtName">상품명</label>
        <input type="text" id="prdtName" name="prdtName"><br>
        <label for="prdtPrice">상품가격</label>
        <input type="number" id="prdtPrice" name="prdtPrice"><br>
        <label for="prdtCount">재고</label>
        <input type="number" id="prdtCount" name="prdtCount"><br>
        <label for="prdtContents">상품상세설명</label>
        <textarea id="prdtContents" name="prdtContents"></textarea><br>
        <label for="prdtThum">상품이미지</label>
        <input type="text" id="prdtThum" name="prdtThum"><br>
        <button type="submit">상품등록</button>
    </form>
</div>
</body>
</html>