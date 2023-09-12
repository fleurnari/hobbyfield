<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.allCheck{
	margin-right: 1000px;
}

.delBtn{
	margin-top: 30px;
	margin-right: 980px;
	margin-bottom: 20px;
}

.container{
	margin-bottom: 100px;
}

#box2{
	margin-top: -100px;
}
</style>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문 목록</title>
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
	</nav>
</div>
<div class="container">
    <h1>주문 내역</h1>
    <div class="delBtn" align="center">
		<button type="button" class="btn btn-danger" id="selectUpdate_btn">배송사항 변경</button>
	</div>
    <div class="allCheck" align="center">
		<input type="checkbox" name="allCheck" id="allCheck" /><label
			for="allCheck">모두 선택</label>
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
$(document).ready(function() {
    // 모두 선택 체크박스
    $("#allCheck").click(function() {
        var chk = $("#allCheck").prop("checked");
        if (chk) {
            $(".chBox").prop("checked", true);
        } else {
            $(".chBox").prop("checked", false);
        }
    });

    // 선택된 주문목록 배송 상태 변경
    $("#selectUpdate_btn").click(function() {
        // 컨펌 창 표시
        Swal.fire({
            title: "배송 상태 변경",
            text: "선택된 주문의 배송 상태를 변경하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "확인",
            cancelButtonText: "취소"
        }).then((result) => {
            if (result.isConfirmed) {
                var checkArr = [];

                $("input[class='chBox']:checked").each(function() {
                    checkArr.push($(this).attr("data-orderId"));
                });

                var dataToSend = {
                    orderIds: checkArr,
                    delivery: "배송중" // 변경하려는 배송 상태
                };

                // 알림창 표시
                Swal.fire({
                    title: "배송 상태 변경 중...",
                    icon: "info",
                    showConfirmButton: false,
                    allowOutsideClick: false
                });

                $.ajax({
                    url: "updateDelivery",
                    type: "post",
                    contentType: "application/json",
                    dataType: "json",
                    data: JSON.stringify(dataToSend),
                    success: function(result) {
                        if (result.success) {
                            // 성공 알림창 표시
                            Swal.fire({
                                title: "배송 상태가 변경되었습니다.",
                                icon: "success",
                                showConfirmButton: true
                            }).then(() => {
                                location.href = "adminOrderList";
                            });
                        } else {
                            // 실패 알림창 표시
                            Swal.fire({
                                title: "변경 실패",
                                text: "배송 상태 변경에 실패했습니다.",
                                icon: "error",
                                showConfirmButton: true
                            });
                        }
                    }
                });
            }
        });
    });
});
	 
	 
</script>
</body>
</html>
