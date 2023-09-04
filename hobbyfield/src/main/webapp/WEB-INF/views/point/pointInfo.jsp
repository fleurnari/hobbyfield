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

input {
	border: none;
}

.product-img {
	align-items: center;
}

.jb-division-line {
	border-top: 1px solid #444444;
	width: 90%;
	margin-top: 20px;
	margin-left: 5%;
}

.buttonGroup {
	margin-top: 20px;
	display: flex;
	gap: 10px;
}

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
	width: 40%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	text-align: center;
	position: relative;
}

.close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	cursor: pointer;
}

.purchase-button {
	gap: 10px;
}

.time {
	font-weight: bold;
	font-size: 1.2rem;
}

.product-img {
	
}

.product-img img {
	width: 100px;
	display: block;
	
}

.first-img {
	250px;
}

.first-img img {
	width: 400px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>


</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/myitemBuy"
			method="POST" name="myitemBuy">
			<div class="row">
				<div class="col">
					<div class="first-img">
						<img src="${pageContext.request.contextPath}${point.pointImgPath}${point.pointImgName}"
							alt="상품 이미지">
					</div>
				</div>

				<div class="col">
					<input type="hidden" value="${point.pointId }" name="pointId">
					<h3>
						<input type="text" value="${point.pointName }" name="pointName"
							readonly="readonly">
					</h3>
					<c:if test="${point.pointItemType eq 'W1'}">
						<c:forEach items="${pointOption}" var="pointOption">
							<p>옵션 :${pointOption.pointPeriod }</p>
							<span>${pointOption.pointPrice }</span>
							<span>포인트</span>
						</c:forEach>
					</c:if>
					<div>
						<c:if test="${point.pointItemType eq 'W2'}">
							<input type="hidden" name="myitemUseterm" value="1">
							<input type="hidden" value="${point.groupPrice}"
								name="groupPrice" readonly="readonly">
							<span>${point.groupPrice} 포인트</span>
						</c:if>
					</div>
					<p>
						<input type="hidden" value="${point.pointState}" name="pointState"
							readonly="readonly">${point.pointStateNm}</p>
					<input type="hidden" value="${point.pointItemType }"
						name="pointItemType" readonly="readonly"> <input
						type="hidden" value="${point.pointRegdate}" name="pointRegdate">

					<c:if test="${point.pointItemType eq 'W1'}">
						<p>
							판매종료 <font class="time" style="font-weight: bold;" size=5>
								<jsp:useBean id="now" class="java.util.Date" /> <fmt:parseNumber
									value="${now.time / (1000*60*60*24)}" integerOnly="true"
									var="nowfmtTime" scope="request" /> <fmt:parseDate
									value="${point.pointEndterm}" pattern="yyyy-MM-dd"
									var="endPlanDate" /> <fmt:parseNumber
									value="${endPlanDate.time / (1000*60*60*24)}"
									integerOnly="true" var="endDate" /> <c:choose>
									<c:when test="${endDate - nowfmtTime >= 1}">
	         				${endDate - nowfmtTime + 1}
	        					<span>일 남음</span>
									</c:when>
									<c:otherwise>
										<div>
											<span id="d-day-hour">00</span> <span class="col">:</span> 
											<span id="d-day-min">00</span> <span class="col">:</span> 
											<span id="d-day-sec">00</span>
										</div>
									</c:otherwise>
								</c:choose>
							</font>
						</p>
					</c:if>
					<div class="purchase-button">
						<button type="button" onclick="location.href='wishList'">위시</button>
						<button type="button" id="purchase" onclick="openModal()">구입</button>
					</div>
				</div>


			</div>


			<div class="jb-division-line"></div>

			<div>
				<div id="editor">
					${point.pointContent}
<%-- 					<p class="pointContent">${point.pointContent}</p> --%>
				</div>
				<div class="product-img">
					<c:forEach items="${point.emojiVO }" var="emoji">
						<img
							src="${pageContext.request.contextPath}${emoji.emojiImgPath}${emoji.emojiImgName}"
							alt="상세조회 이미지">
					</c:forEach>
				</div>
			</div>
			<!-- 		<input type="file" name="emojiName" multiple> -->
			<!-- 모달 창 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" id="closeModalBtn">&times;</span>
					<!-- close안됨 -->
					<div>
						<h5>${point.pointName}</h5>
						<br>
						<p>보유포인트 <span id="memberActpnt">${member.memberActpnt }</span></p>
						<c:if test="${point.pointItemType eq 'W2'}">
						<p>결제 포인트 <span id="groupPrice">${point.groupPrice }</span></p>
						<input type="hidden" value="${point.groupPrice }"	name="pointPrice">
						</c:if>
						<p>구입하시겠습니까?</p>
					</div>

					<c:if test="${point.pointItemType eq 'W1'}">
						<div>
							<label>7일<input type="radio" name="pointOptId"
								value="${point.pointOptionVO[0].pointOptId }" data-period="7"
								data-price="${point.pointOptionVO[0].pointPrice }" checked>${point.pointOptionVO[0].pointPrice }포인트</label>
							<label>14일<input type="radio" name="pointOptId"
								value="${point.pointOptionVO[1].pointOptId }" data-period="14"
								data-price="${point.pointOptionVO[1].pointPrice }">${point.pointOptionVO[1].pointPrice }포인트</label>
							<label>30일<input type="radio" name="pointOptId"
								value="${point.pointOptionVO[2].pointOptId }" data-period="30"
								data-price="${point.pointOptionVO[2].pointPrice }">${point.pointOptionVO[2].pointPrice }포인트</label>
							<label>영구<input type="radio" name="pointOptId"
								value="${point.pointOptionVO[3].pointOptId }" data-period="0"
								data-price="${point.pointOptionVO[3].pointPrice }">${point.pointOptionVO[3].pointPrice }포인트</label>
						</div>
						<!-- 각 value 값은 기본값을 표시하는 것 -->
						<input type="hidden" value="7" name="myitemUseterm">
						<input type="hidden" value="${point.pointOptionVO[0].pointPrice }"
							name="pointPrice">
					</c:if>


					<button type="submit" class="purchase-btn">구매확인</button>
				</div>
			</div>
		</form>

		<!-- 버튼 -->
		<div class="buttonGroup">
<%-- 			<c:if test="${member.memberGrd eq A3}"> --%>
				<button type="submit"
					onclick="location.href='pointUpdate?pointId=${point.pointId}'">수정</button>
				<button type="submit"
					onclick="location.href='pointDelete?pointId=${point.pointId}'">삭제</button>
<%-- 			</c:if> --%>
			<button type="button" onclick="location.href='pointList'">목록</button>
		</div> 
	</div>


	<script type="text/javascript">
	
	//editor
	ClassicEditor
	.create( document.querySelector( '#editor' ), {
		 toolbar: []
	} )
	.then( editor => {
	    const toolbarElement = editor.ui.view.toolbar.element;
	    editor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
	        if ( isReadOnly ) {
	            toolbarElement.style.display = 'none';
	        } else {
	            toolbarElement.style.display = 'flex';
	        }
	    });
	})
	
	 //줄바꿈
	function replaceBrTag(str) 
    {
        if (str == undefined || str == null)
        {
            return "";
        }

        str = str.replace(/\r\n/ig, '<br>');
        str = str.replace(/\n/ig, '<br>');
        str = str.replace(/\n/ig, '<br>');
        return str;
    }
	
	$('.pointContent').html( replaceBrTag($('.pointContent').text()) )
	
$('[name="pointOptId"]').click(function(e){
	$('[name="myitemUseterm"]').val(  $(e.target).data('period')  )
	$('[name="pointPrice"]').val( $(e.target).data('price'))
})

//판매마감된 상품페이지
window.onload = function () {
    var currentDate = new Date();
    if("${point.pointItemType}" == "W1"){
	    var pointEndterm = new Date("${point.pointEndterm}"); 
	    if (pointEndterm < currentDate) {
	        alert("판매완료된 아이템입니다.");
	        window.location.href = "pointList";
	    } 
	    setInterval(remaindTime,1000); 
    }
};

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


// 구매모달
 
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
 document.getElementById("purchase").addEventListener("click", openModal);


 // 모달 닫기 버튼 및 모달 외부를 클릭하여 모달 닫기
 var modal = document.getElementById("myModal");
 window.onclick = function (event) {
   if (event.target == modal) {
     modal.style.display = "none";
   }
 };

 // 모달 내 닫기 버튼 클릭 시 모달 닫기
 document.querySelector(".close").addEventListener("click", closeModal);


 
// 구매 버튼 클릭 시 모달 열기와 purchaseBtn 함수 실행
document.getElementById("purchase").addEventListener("click", function () {
    openModal(); // 모달 열기 함수 호출
});

// 모달 열기 함수
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

// 모달 닫기 함수
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

// 모달 닫기 버튼 클릭 시 모달 닫기
document.querySelector(".close").addEventListener("click", closeModal);

// 모달 외부 클릭 시 모달 닫기
window.onclick = function (event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
};



$('form').on('submit', function(e){
	e.preventDefault();
	//포인트 보유 확인
	let pnt = Number($('#memberActpnt').text())
	let groupPrice = Number($('#groupPrice').text())
	if(pnt < groupPrice){
		alert("보유 포인트가 부족합니다.");
		closeModal();
		return false;
	}
	
// 	$('memberActpnt')>=$('point.groupPrice')
	
	let objData = serializeObject();
	
	$.ajax({
		url : '${pageContext.request.contextPath}/member/myitemBuy',
		method : 'POST',
		data : objData
	})
	.done(data => {
		if (data){
			alert("아이템 구매가 완료 되었습니다.");
			window.location.href = '${pageContext.request.contextPath}/member/myitemList';
		} else {
			alert("아이템 구매에 실패 했습니다.");
			window.location.href = '${pageContext.request.contextPath}/member/myitemList';
			}
	})
	.fail(reject => console.log(reject));
	
	return false;
	});
	
	function serializeObject(){
		let formData = $('form').serializeArray();
		
		let formObject = {};
		$.each(formData, function(idx, obj){
			let field = obj.name;
			let val = obj.value;
			
			formObject[field] = val
		});
		
		return formObject;
	
}
	  
 
</script>
</body>
</html>
