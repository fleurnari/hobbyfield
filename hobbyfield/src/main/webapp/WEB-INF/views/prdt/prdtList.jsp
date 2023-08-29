<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<body>
    <nav class="navbar navbar-expand  navbar-dark bg-dark">  
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./home">Home</a>
            </div>
        </div>
    </nav> 
    <div class="jumbotron">
        <div class="container" align="center">
            <h1 class="display-3">상품 목록</h1>
        </div>
    </div>
    <div class="container">
        <div class="row" align="center">
            <c:forEach items="${prdtList}" var="prdt"> 
                <div class="col-md-4">
                    <h3><a href="prdtInfo?prdtId=${prdt.prdtId}">${prdt.prdtName}</a></h3>
                        <br>
                    <p>${prdt.prdtPrice}원
                </div>
            </c:forEach> 
        </div>
</body>
</html>