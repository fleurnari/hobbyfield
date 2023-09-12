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

#box2{
	margin-top: -100px;
}

.delBtn{
	margin-right: 980px;
	margin-bottom: 10px;
}
.allCheck{
	margin-right: 980px;
	margin-bottom: -50px;
}

#orderOpne_bnt{
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="box2">
 <div class="row align-items-center min-vh-30 min-vh-md-30">
			<div class="col-12 text-center py-7">
				<h1 class="lh-sm fs-lg-6 fs-xxl-7">HOBBY SHOP</h1>
				<p class="text-700">취미 공유 통합 플랫폼</p>
			</div>
	</div>
</div>

<div>
	<nav class="class=" navbar bg-primary" data-bs-theme="dark"">
		<div class="container">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/prdtList">상품목록</a></li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath }/prdt/prdtInsert">상품등록</a></li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/cartList">장바구니</a>
				</li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/prdt/orderList">주문내역</a>
				</li>
				<li class="nav-item"><a class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/CSboard/CsboardList">배송안내</a>
				</li>
						</div>
			</ul>
		</div>
	<div class="delBtn" align="center">
		<button type="button" class="btn btn-danger" id="selectDelete_btn">선택 삭제</button>
	</div>
	<div class="allCheck" align="center">
		<input type="checkbox" name="allCheck" id="allCheck" /><label
			for="allCheck">모두 선택</label>
	</div>

	
	<div class="container" >
    <div style="padding-top: 50px">
        <table class="table table-hover">
        <tr>
            <th>선택</th>
            <th>상품번호</th>
            <th>상품명</th>
            <th>가격</th>
            <th>사이즈</th>
            <th>수량</th>
            <th>합계</th>
        </tr>
        <c:set var="sum" value="0" />
        <c:forEach items="${cartList}" var="cart">
        <tr>
            <td><input type="checkbox" name="chBox" class="chBox" data-cartId="${cart.cartId }"/></td>
            <td>${cart.prdtId}</td>
            <td>${cart.prdtName}</td>
            <td><fmt:formatNumber type="number" value="${cart.prdtPrice}" pattern="###,###,###원"/></td>
            <td>${cart.prdtOption}</td>
            <td>${cart.cartStock}</td>
            <td><fmt:formatNumber type="number" value="${cart.prdtPrice * cart.cartStock}" pattern="###,###,###원"/></td>
        </tr>
    
      
        <c:set var="sum" value="${sum + (cart.prdtPrice * cart.cartStock)}" />
        </c:forEach>
        </table>
         <div class="listResult">
			 <div class="sum">
			  <h2 id="totalAmount">총 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h2>
			 </div>
			 <div class="orderOpne">
			  <button type="button" class="btn btn-success" id="orderOpne_bnt">장바구니 결제하기</button>
			 </div>
		</div>
        <a href="<c:url value="prdtList" />" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
    </div>
    
    
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
<script>
function calculateTotalAmount() {
    var sum = 0;
    $(".chBox:checked").each(function () {
        var row = $(this).closest("tr");
        var prdtPrice = parseFloat(row.find("td:eq(3)").text().replace(/[^0-9.-]+/g, "")); // 가격 값을 추출하고 파싱
        var cartStock = parseInt(row.find("td:eq(5)").text()); // 수량 값을 추출하고 파싱
        sum += prdtPrice * cartStock;
    });
    return sum;
}

// 체크박스가 클릭될 때마다 합계를 업데이트
$(".chBox").click(function () {
    var totalAmount = calculateTotalAmount();
    $("#totalAmount").text("총 결제금액 : " + totalAmount.toLocaleString() + "원");
});

// 페이지 로드 시 합계를 초기화
$(document).ready(function () {
    var totalAmount = calculateTotalAmount();
    $("#totalAmount").text("총 결제금액 : " + totalAmount.toLocaleString() + "원");
});





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
$("#selectDelete_btn").click(function () {
    Swal.fire({
        title: "정말 삭제하시겠습니까?",
        text: "한 번 삭제하면 되돌릴 수 없습니다.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "예, 삭제합니다",
        cancelButtonText: "아니요, 취소합니다"
    }).then((result) => {
        if (result.isConfirmed) {
            var checkArr = new Array();

            $("input[class='chBox']:checked").each(function () {
                checkArr.push($(this).attr("data-cartId"));
            });

            $.ajax({
                url: "deleteCart",
                type: "post",
                data: { chbox: checkArr },
                success: function (result) {
                    if (result == 1) {
                        location.href = "cartList";
                    } else {
                        Swal.fire("삭제 실패", "문제가 발생했습니다.", "error");
                    }
                }
            });
        }
    });
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
        var selectedPrdtOption = [];
        var selectedPrdtId = []; 
        $(".chBox:checked").each(function() {
        	 var prdtName = $(this).closest("tr").find("td:eq(2)").text(); // 상품명 가져오기
             var prdtOption = $(this).closest("tr").find("td:eq(4)").text(); // 사이즈 가져오기
             var prdtId = $(this).closest("tr").find("td:eq(1)").text(); // 상품번호 가져오기
            selectedPrdtName.push(prdtName); // 배열에 상품명 추가
            selectedPrdtOption.push(prdtOption);
            selectedPrdtId.push(prdtId);
        });

        // 주문 정보를 아임포트 결제 요청에 포함
        var orderData = {
            memberEmail: $("#memberEmail").val(),
            orderPhone: $("#orderPhone").val(),
            memberZip: $("#memberZip").val(),
            memberBaseaddr: $("#memberBaseaddr").val(),
            memberDetaaddr: $("#memberDetaaddr").val(),
            orderMemo: $("#orderMemo").val(),
            prdtName: selectedPrdtName.join(','),
            prdtOption: selectedPrdtOption.join(','), 
            amount: calculateTotalAmount(),
            iamUid: generateUniqueMerchantUid(),
            prdtId: selectedPrdtId.join(',') 
        };
		

        // 아임포트 API 초기화
        var IMP = window.IMP;
        IMP.init("imp10078031");

        // 결제 정보 생성
        var paymentData = {
            pg: 'kakaopay',
            merchant_uid: orderData.iamUid, // iam_uid를 사용하여 결제 고유 ID 설정
            name: orderData.prdtName,
            amount: orderData.amount, // 결제 금액
            buyer_email: orderData.memberEmail,
            buyer_name: orderData.memberEmail,
            buyer_tel: orderData.orderPhone,
            buyer_addr: orderData.memberBaseaddr + ' ' + orderData.memberDetaaddr,
            buyer_postcode: orderData.memberZip,
            custom_data: JSON.stringify(orderData) // 주문 정보를 결제 요청에 추가
        };

        
        
        //결제ID생성
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

        // 결제 요청
        IMP.request_pay(paymentData, function(response) {
            if (response.success) {
                console.log("결제 성공");
                console.log(response);

                // response.imp_uid 값을 orderData에 추가
                orderData.impUid = response.imp_uid;

                // 결제 성공 시 서버로 결제 정보를 전송
                $.ajax({
                    url: "orderInfo",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(orderData),
                    success: function(result) {
                        if (result === "success") {
                            console.log("주문 정보 전송 성공");
                            console.log(orderData);
                            location.href = "orderList";
                        } else {
                            console.log("주문 정보 전송 실패");
                        }
                    }
                });
            } else {
                console.log("결제 실패");
                console.log(response);
            }
        });
    });
});
</script>
</body>
</html>