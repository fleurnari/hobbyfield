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
	<div class="allCheck" align="center">
		<input type="checkbox" name="allCheck" id="allCheck" /><label
			for="allCheck">모두 선택</label>
	</div>

	<div class="delBtn" align="center">
		<button type="button" class="btn btn-danger" id="selectDelete_btn">선택 삭제</button>
	</div>
	<div class="container" >
    <div style="padding-top: 50px">
        <table class="table table-hover">
        <tr>
            <th>선택</th>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>총액</th>
        </tr>
        <c:set var="sum" value="0" />
        <c:forEach items="${cartList}" var="cart">
        	<div class="checkBox">
        		
        	</div>
        <tr>
            <td><input type="checkbox" name="chBox" class="chBox" data-cartId="${cart.cartId }"/></td>
            <td>${cart.prdtName}</td>
            <td>${cart.prdtPrice}</td>
            <td>${cart.cartStock}</td>
            <td>${cart.prdtPrice * cart.cartStock} </td>
        </tr>
        
        <c:set var="sum" value="${sum + (cart.prdtPrice * cart.cartStock)}" />
        </c:forEach>
        </table>
         <div class="listResult">
			 <div class="sum">
			  <h2>총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h2>
			 </div>
			 <div class="orderOpne">
			  <button type="button" class="btn btn-success" id="orderOpne_bnt">주문 정보 입력</button>
			 </div>
		</div>
        <a href="<c:url value="prdtList" />" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
    </div>
    <div class="orderInfo">
   <form method="post" autocomplete="off">
      
    <input type="hidden" name="amount" value="${sum}" />
      
    <div class="inputArea">
     <label for="">수령인</label>
     <input type="text" name="orderRec" id="orderRec" required="required" />
    </div>
    
    <div class="inputArea">
     <label for="orderPhone">수령인 연락처</label>
     <input type="text" name="orderPhone" id="orderPhone" required="required" />
    </div>
    
    <div class="inputArea">
     <label for="userAddr1">우편번호</label>
     <input type="text" name="memberZip" id="memberZip" required="required" />
    </div>
    
    <div class="inputArea">
     <label for="userAddr2">기본 주소</label>
     <input type="text" name="memberBaseaddr" id="memberBaseaddr" required="required" />
    </div>
    
    <div class="inputArea">
     <label for="userAddr3">2차 주소</label>
     <input type="text" name="memberDetaaddr" id="memberDetaaddr" required="required" />
    </div>
    
    <div class="inputArea">
     <button type="submit" class="order_btn">주문</button>
     <button type="button" class="cancel_btn">취소</button>   
    </div>
    
   </form>   
</div>
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
	
//모두선택의 체크박스 체크시 다른 체크박스들도 체크
$(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
	 
	 
//장바구니에서 삭제
$("#selectDelete_btn").click(function(){
	  var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("data-cartId"));
	   });
	    
	   $.ajax({
	    url : "deleteCart",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	    	
	   		if(result ==1){
	   		   location.href = "cartList";
	   		} else{
	   			alert("삭제 실패")
	   		}
	     }
	  });
	} 
 });


//주문정보 입력시 주문정보 입력할 수 있게
$("#orderOpne_bnt").click(function(){
	  $(".orderInfo").slideDown();
	  $(".orderOpne_bnt").slideUp();
	 });   
	 
//주문취소 버튼 클릭시 다시 입력폼 닫기 
$(".cancel_btn").click(function(){
	 $(".orderInfo").slideUp();
	 $(".orderOpne_bnt").slideDown();
	});      
	 




</script>
</body>
</html>