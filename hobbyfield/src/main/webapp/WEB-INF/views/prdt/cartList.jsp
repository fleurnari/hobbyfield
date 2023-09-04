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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
            <th>금액</th>
        </tr>
        <c:set var="sum" value="0" />
        <c:forEach items="${cartList}" var="cart">
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
			  <h2>총 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h2>
			 </div>
			 <div class="orderOpne">
			  <button type="button" class="btn btn-success" id="orderOpne_bnt">주문 정보 입력</button>
			 </div>
		</div>
        <a href="<c:url value="prdtList" />" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
    </div>
    
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
    
   <div class="orderInfo">
    
   	<form method="post" action="orderInfo">
      
    <input type="hidden" name="amount" value="${sum}" />
    <input type="hidden" id="selectedPrdtName" name="prdtName" value="" />
    
    <div class="inputArea">
     <label for="memberEmail">수령인</label>
     <input type="text" name="memberEmail" id="memberEmail" required="required"  value="${member.memberEmail}"/>
    </div>
    
    <div class="inputArea">
     <label for="orderPhone">수령인 연락처</label>
     <input type="text" name="orderPhone" id="orderPhone" required="required" placeholder="-빼고 입력해주세요"/>
    </div>
    
    <div class="inputArea">
     <label for="memberZip">우편번호</label>
     <input type="text" name="memberZip" id="memberZip" required="required" value="${member.memberZip}"/>
    </div>
    
    <div class="inputArea">
     <label for="memberBaseaddr">기본 주소</label>
     <input type="text" name="memberBaseaddr" id="memberBaseaddr" required="required" value="${member.memberBaseaddr}" />
    </div>
    
    <div class="inputArea">
     <label for="memberDetaaddr">상세 주소</label>
     <input type="text" name="memberDetaaddr" id="memberDetaaddr" required="required" value="${member.memberDetaaddr}"/>
    </div>
    
    <div class="inputArea">
    <label for="deliveryRequest">배송 시 요청사항</label>
    <select name="orderMemo" id="orderMemo">
        <option value="없음">요청사항 없음</option>
        <option value="경비실">부재 시 경비실에 맡겨주세요</option>
        <option value="문앞에">문 앞에 놔주세요</option>
    </select>
	</div>
    <div class="inputArea">
     <button type="button" class="order_btn">주문</button>
     <button type="button" class="cancel_btn">취소</button>   
    </div>
    
   </form>   
</div>
</div>
<!-- <script>
        var IMP = window.IMP; 
        IMP.init("imp10078031"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : $("#memberEmail").val(),
                buyer_name : '테스트임 ㅋ',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
</script> -->

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
	 


$(document).ready(function() {
    $(".order_btn").click(function() {
        var selectedPrdtName = []; // 선택한 상품 담을 배열

        $(".chBox:checked").each(function() {
            var prdtName = $(this).closest("tr").find("td:eq(1)").text();
            selectedPrdtName.push(prdtName); // 배열에 상품명 추가
        });
        
        // 현재 시간을 기반으로 고유한 merchant_uid 생성
        function generateUniqueMerchantUid() {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var day = now.getDate();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            var milliseconds = now.getMilliseconds();

            var merchantUid = year.toString() +
                (month < 10 ? '0' : '') + month.toString() +
                (day < 10 ? '0' : '') + day.toString() +
                (hours < 10 ? '0' : '') + hours.toString() +
                (minutes < 10 ? '0' : '') + minutes.toString() +
                (seconds < 10 ? '0' : '') + seconds.toString() +
                milliseconds.toString();

            return merchantUid;
        }

        // 주문 정보를 아임포트 결제 요청에 포함
        
        var orderData = {
            memberEmail: $("#memberEmail").val(),
            orderPhone: $("#orderPhone").val(),
            memberZip: $("#memberZip").val(),
            memberBaseaddr: $("#memberBaseaddr").val(),
            memberDetaaddr: $("#memberDetaaddr").val(),
            orderMemo: $("#orderMemo").val(),
            prdtName: selectedPrdtName.join(','),
            amount: ${sum}
        };

        // 아임포트 API 초기화
        var IMP = window.IMP;
        IMP.init("imp10078031");

        // 결제 정보 생성
        var merchantUid = generateUniqueMerchantUid();
        var paymentData = {
            pg: 'kakaopay', 
            merchant_uid: 'merchantUid', // 고유한 주문 ID( 중복 결제 방지)
            name: 'orderData.prdtName',
            amount: orderData.amount, // 결제 금액
            buyer_email: orderData.memberEmail,
            buyer_name: orderData.memberEmail,
            buyer_tel: orderData.orderPhone,
            buyer_addr: orderData.memberBaseaddr + ' ' + orderData.memberDetaaddr,
            buyer_postcode: orderData.memberZip,
            custom_data: JSON.stringify(orderData) // 주문 정보를 결제 요청에 추가
        };

        // 결제 요청
        IMP.request_pay(paymentData, function(response) {
            if (response.success) {
                console.log("결제 성공");
                console.log(response);

                // 결제 성공 시 서버로 결제 정보를 전송
                $.ajax({
                    url: "orderInfo",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(orderData),
                    success: function(result) {
                        if (result === "success") {
                            console.log("주문 정보 전송 성공");
                            location.href = "orderList";
                        } else {
                            console.log("주문 정보 전송 실패");
                        }
                    }
                });
            } else {
                console.log("결제 실패");
                console.log(response);

                // 결제 실패 시 사용자에게 알림을 표시하거나 실패 처리를 수행
            }
        });
    });
});
</script>
</body>
</html>