<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<br>
					<br>
					<br>
					<br>
					<br>
					
					
					
<div class="container">
    <form action="prdtInsert" method="post" class="form-horizontal">
        <fieldset>
            <legend>상품 등록</legend>
            <div class="form-group row">
                <label for="prdtName" class="col-sm-2 control-label">상품명</label>
                <div class="col-sm-3">
                    <input type="text" id="prdtName" name="prdtName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtCate" class="col-sm-2 control-label">상품카테고리</label>
                <div class="col-sm-3">
                    <select id="prdtCate" name="prdtCate" class="form-control">
                        <option value="케이스">케이스</option>
                        <option value="키링">키링</option>
                        <option value="스트랩">스트랩</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtPrice" class="col-sm-2 control-label">상품가격</label>
                <div class="col-sm-3">
                    <input type="number" id="prdtPrice" name="prdtPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtCount" class="col-sm-2 control-label">재고</label>
                <div class="col-sm-3">
                    <input type="number" id="prdtCount" name="prdtCount" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtContents" class="col-sm-2 control-label">상품상세설명</label>
                <div class="col-sm-5">
                    <textarea id="prdtContents" name="prdtContents" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtThum" class="col-sm-2 control-label">상품이미지</label>
                <div class="col-sm-3">
                    <input type="text" id="prdtThum" name="prdtThum" class="form-control">
                </div>
            </div>
            <br>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">상품등록</button>
                    <input type="hidden" id="prdtSoldout" name="prdtSoldout" value="sales">
                </div>
            </div>
        </fieldset>
    </form>
</div>
    
    
</body>
<script>

</script>
</html>