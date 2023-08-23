<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품 단건조회</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh;
	margin-top: 100px;
}

.product-img {
	float: left;
}

.jb-division-line {
	border-top: 1px solid #444444;
	margin: 30px;
}

.buttonGroup {
	margin-top: 100px;
}
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fff;
	margin: 10% auto;
	padding: 20px;
	width: 60%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	text-align: center;
	position: relative;
}

/* 모달 닫기 버튼 스타일 */
.close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="product-img">
		<img alt="" src="">
	</div>

	<div class="container">
		<div class="row">
			<h3>${point.pointName}</h3>
			<p>포인트 옵션</p>
			<p>${point.pointItemType}</p>
			<p>${point.pointState}</p>

			<p>
				판매종료 <font class="time" style="font-weight: bold;" size=5> <jsp:useBean
						id="now" class="java.util.Date" /> <fmt:parseNumber
						value="${now.time / (1000*60*60*24)}" integerOnly="true"
						var="nowfmtTime" scope="request" /> <fmt:parseDate
						value="${point.pointEndterm}" pattern="yyyy-MM-dd"
						var="endPlanDate" /> <fmt:parseNumber
						value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true"
						var="endDate" /> <c:choose>
						<c:when test="${endDate - nowfmtTime >= 1}">
            				${endDate - nowfmtTime + 1}
           					<span>일 남음</span>
						</c:when>
						<c:otherwise>
							<div>
								<span id="d-day-hour">00</span> <span class="col">:</span> <span
									id="d-day-min">00</span> <span class="col">:</span> <span
									id="d-day-sec">00</span>
							</div>
						</c:otherwise>
					</c:choose>
				</font>
			</p>
			<div class="purchase-button">
				<button type="button" onclick="location.href='wishList'">위시</button>
				<button type="button" id="openModalBtn">구입</button>
			</div>
			<!-- 모달 창 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" id="closeModalBtn">&times;</span>
					<div>
<%-- 						<input type="radio" ><span>${point.pointName }</span><span>${point.pointPrice}</span><span>일 이용</span><br>  --%>
<!-- 						<input type="radio" ><span>일 이용</span><br>  -->
<!-- 						<input type="radio" ><span>일 이용</span><br>  -->
<!-- 						<input type="radio" ><span>영구이용</span><br> -->
					</div>
					<button>구매 확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="jb-division-line"></div>
	<div>
		<p>${point.pointContent}</p>
	</div>

	<!-- 버튼 -->
	<div class="buttonGroup">
		<button type="submit"
			onclick="location.href='pointUpdate?pointId=${point.pointId}'">수정</button>
		<button type="button" id=""
			onclick="location.href='pointDelete?pointId=${point.pointId}'">삭제</button>
		<button type="button" onclick="location.href='pointList'">목록</button>
	</div>

	<script type="text/javascript">
	
	function remaindTime() {
		 
		let today = new Date();
		

		var now = new Date(); //현재시간을 구한다. 
		console.log(now);
		var open = Date.parse("${point.pointEndterm}");
		console.log(open);
		
		var nt = now.getTime(); // 현재의 시간만 가져온다
		
	  	
		if(nt<open){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.   
			sec = parseInt(open - nt) / 1000;
			hour = parseInt(sec/60/60);
			sec = (sec - (hour*60*60));
			min = parseInt(sec/60);
			sec = parseInt(sec-(min*60));
	  
	    if(hour<10){hour="0"+hour;}
	    if(min<10){min="0"+min;}
	    if(sec<10){sec="0"+sec;}
			$("#d-day-hour").html(hour);
			$("#d-day-min").html(min);
			$("#d-day-sec").html(sec);
	    }else{ //현재시간이 종료시간보다 크면
		    $("#d-day-hour").html('00');
		    $("#d-day-min").html('00');
		    $("#d-day-sec").html('00'); 	   
			
		   
	   }
	}
	 setInterval(remaindTime,1000); 
	
	 
	 
	// 모달 열기
	 function openModal() {
	   var modal = document.getElementById("myModal");
	   modal.style.display = "block";
	 }

	 // 모달 닫기
	 function closeModal() {
	   var modal = document.getElementById("myModal");
	   modal.style.display = "none";
	 }

	 // 구입 버튼 클릭 시 모달 열기
	 document.querySelector("button#구입").addEventListener("click", openModal);

	 // 모달 닫기 버튼 및 모달 외부를 클릭하여 모달 닫기
	 var modal = document.getElementById("myModal");
	 window.onclick = function (event) {
	   if (event.target == modal) {
	     modal.style.display = "none";
	   }
	 };

	 // 모달 내 닫기 버튼 클릭 시 모달 닫기
	 document.querySelector(".close").addEventListener("click", closeModal);

</script>
</body>
</html>
