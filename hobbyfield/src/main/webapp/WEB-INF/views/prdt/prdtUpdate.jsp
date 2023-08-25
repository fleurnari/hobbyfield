<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
</head>

<body>
<br>
					<br>
					<br>
					<br>
					<br>
<div align="center">
	 <form action="prdtUpdate" method="post">
        <label for="prdtName">상품명</label>
        	<input type="text" id="prdtName" name="prdtName" value="${prdtInfo.prdtName }"><br>
        <label for="prdtCate">상품카테고리</label>
          <select id="prdtCate" name="prdtCate" value="${prdtInfo.prdtCate }">
            <option value="케이스">케이스</option>
            <option value="키링">키링</option>
            <option value="스트랩">스트랩</option>
        </select><br>
        <label for="prdtPrice">상품가격</label>
       	 <input type="number" id="prdtPrice" name="prdtPrice" value="${prdtInfo.prdtPrice }"><br>
        <label for="prdtCount">재고</label>
        	<input type="number" id="prdtCount" name="prdtCount" value="${prdtInfo.prdtCount }"><br>
        <label for="prdtContents">상품상세설명</label>
        	<textarea id="prdtContents" name="prdtContents" value="${prdtInfo.prdtContents}"></textarea><br>
        <label for="prdtThum">상품이미지</label>
       		 <input type="text" id="prdtThum" name="prdtThum"><br>
       	<label for="prdtSoldout">상품품절여부</label>	 
       		 <input type="text" id="prdtSoldout" name="prdtSoldout" value="${prdtInfo.prdtSoldout }">
        <div>
			<button type="submit" class="update_btn">수정하기</button>
			<button type="submit" class="cancel_btn">목록으로</button>
		</div>
    </form>
</div>
<script>
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "prdtList";
		})
	})
	
	$(".update_btn").on("click", function(){
			formObj.prop("action", "prdtUpdate");
			formObj.prop("method", "get");
			formObj.submit();				
	})
		
	</script>
</body>
</html>