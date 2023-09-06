<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0);
	opacity: 0;
	pointer-events: none; /* Prevent interactions with hidden modal */
	transition: background-color 0.3s ease, opacity 0.3s ease;
}

.modal.show {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 1;
	pointer-events: auto; /* Enable interactions with shown modal */
}

.modal_body {
	position: absolute;
	width: 800px;
	max-width: 90%;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	opacity: 0;
	transition: opacity 0.3s ease;
}

.modal.show .modal_body {
	opacity: 1;
}

/* Prevent scrolling on body when modal is open */
body.modal-open {
	overflow: hidden;
}

.popup-wrap {
	background-color: rgba(0, 0, 0, 0.5);
	/* 배경색과 투명도로 살짝 어둡지만 투명한 배경
  허공에 붕 떠있는 느낌을 주고 싶으면 안넣어도 무방 */
	justify-content: center; /* 수평 중앙정렬 */
	align-items: center; /* 수직 중앙정렬 */
	position: fixed; /* 포지션 픽스, 화면이 스크롤되더라도 고정되기 위함 */
	top: 0;
	left: 0;
	right: 0;
	bottom: 0; /* 모든 방향에 0을 주면 화면에 꽉차게 됩니다. */
	display: none;
	/* 이벤트가 발생할 때 띄우기 위해 숨김
  처음부터 보이게 하는 상황이라면 display:flex; */
	padding: 15px;
	/* 반응형의 경우 padding이 없으면 박스가 화면에 붙어서 안이뻐짐 */
}

.popup {
	width: 100%; /* 반응형 이기 때문에 가로값은 100% */
	max-width: 400px; /* 팝업의 최대 크기지정 */
	border-radius: 10px; /* 둥글둥글한 디자인을 위해 각을 없앱니다. */
	overflow: hidden; /* 각을 없앴을 때 내부 영역이 튀어나오는걸 방지 */
	background-color: #264db5; /* 배경색 */
	/* 팝업이 허공에 떠있는 듯한 느낌을 주기 위한 그림자 효과. */
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, 0.5);
}

.popup-head {
	width: 100%;
	/* 부모요소를 따라가기 때문에 굳이 가로값을 주지 않아도 되지만 일부 ie에서 인식 못하는 문제가 있음 */
	height: 50px; /* 헤드 영역 높이 */
	display: flex; /* 로고 이미지나 텍스트를 중앙 정렬하기 위한 flex 및 정렬 */
	align-items: center;
	justify-content: center;
}

.popup-body {
	width: 100%;
	background-color: #ffffff; /* 컨텐츠 영역의 배경색 */
}

.body-content { /* 몸통 내부 컨텐츠 영역 */
	width: 100%;
	padding: 30px; /* 좌우에 내용이 붙으면 보기 안좋기 때문에 간격 띄움 */
}

.body-titlebox { /* 컨텐츠 타이틀 영역 */
	text-align: center; /* 제목 중앙정렬 */
	width: 100%;
	height: 40px;
	margin-bottom: 10px; /* 내용과 간격 조정 */
}

.body-contentbox { /* 컨텐츠 내용 영역 */
	word-break: break-word; /* 단어가 짤리지 않음 */
	overflow-y: auto; /* 내부요소가 지정한 세로 값보다 클 경우 스크롤 생성 */
	min-height: 100px; /* 최소 높이 */
	max-height: 200px; /* 최대 높이 */
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn { /* 각각의 버튼  */
	display: inline-flex;
	/* 한줄로 나열하기 위한 inline속성과 flex속성 혼합 */
	width: 100%; /* 2개 버튼 각각 50% 영역 */
	height: 100%; /* 50px */
	justify-content: center; /* 수평정렬 */
	align-items: center; /* 수직정렬 */
	float: left; /* 좌측배치 */
	color: #ffffff; /* 글자색 */
	cursor: pointer; /* 마우스 포인터 효과 */
}

.product-option {
	display: flex;
	justify-content: space-around;
}

.option-box {
	width: 600px; /* 옵션창을 더 길게 만들기 */
	margin: 10px; /* 간격을 주기 위한 margin 추가 */
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 10px; /* 모서리 둥글게 설정 */
}

.option-box:hover {
	background-color: #f0f0f0;
}

.option-name {
	font-weight: bold;
	margin-top: 10px;
}

.option-description, .option-details {
	display: none;
	margin-top: 10px; /* 조금 더 큰 간격 */
}

.option-box.active .option-description, .option-box.active .option-details
	{
	display: block;
}

.quantity {
	margin-top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.decrement, .increment {
	padding: 5px 10px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px; /* 모서리 둥글게 설정 */
}

.decrement {
	margin-right: 5px; /* 간격 추가 */
}

.quantity-value {
	margin: 0 10px;
}

.confirm-button {
	margin-top: 10px;
	width: 500px;
	padding: 5px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 5px; /* 모서리 둥글게 설정 */
}

.confirm-button:hover {
	background-color: #0056b3;
	transform: scale(1); /* 마우스 오버 시 크기 변화 없애기 */
}
</style>
</head>

<body>
	<!-- 옵션선택 모달창 -->
	<div id="modal" class="modal">
		<div class="modal_body">
			<c:forEach items="${fundingGoodsInfo }" var="fundingGoods">
				<div class="product-option">
					<div class="option-box" onclick="toggleDetails(this)">
						<p class="option-name">${fundingGoods.fndGoodsName }<br>${fundingGoods.fndGoodsAmount }<br>${fundingGoods.fndGoodsPrice }<br>텍스트
						</p>
						<p class="option-description">${fundingGoods.fndGoodsContent }</p>
						<div class="option-details">
							<p class="option-details-content">상세 설명이 여기에 나타납니다.</p>
							<div class="quantity">
								<button class="decrement">-</button>
								<span class="quantity-value">1</span>
								<button class="increment">+</button>
							</div>

							<button class="confirm-button AddPayment"
								data-goodsnumber="${fundingGoods.fndGoodsNumber }"
								data-price="${fundingGoods.fndGoodsPrice}">
								${fundingGoods.fndGoodsPrice}</button>
						</div>
					</div>
					<!-- 다른 옵션 박스들도 추가 가능 -->
				</div>
			</c:forEach>
		</div>
	</div>
	<section>
	
		<div class="container">
			<form method="post" name="fundingFrm">
				<div class="funding-Title" style="text-align: center";>
					<font style="font-weight: bold;" size=6;>${fundingPostInfo.fndTitle }</font>
				</div>
				<div class="fudning-Img">
					<figure>
						<img id="img"
							src="${fundingPostInfo.fndMainImgPath }${fundingPostInfo.fndMainImg }" alt="img"
							style="float: left" width="450px" height="350px">
					</figure>
				</div>
			</form>
			<form>
				<div>
					<h3>모인금액</h3>
					<br> <font class="time" style="font-weight: bold;" size=6>
						<fmt:formatNumber value="${fundingPostInfo.fndCurrentAmount }"
							pattern="#,###원" />
					</font>
				</div>
				<div>
					<h3>남은시간</h3>
					<font class="time" style="font-weight: bold;" size=6> <jsp:useBean
							id="now" class="java.util.Date" /> <fmt:parseNumber
							value="${now.time / (1000*60*60*24)}" integerOnly="true"
							var="nowfmtTime" scope="request" /> <fmt:parseDate
							value="${fundingPostInfo.fndEndDate}" pattern="yyyy-MM-dd"
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
				</div>
				<br>
				<div>
					<h3>참여인원</h3>
					<font class="time" style="font-weight: bold;" size=6>
						${fundingPostInfo.fndParticipants } </font>
				</div>
				<br>
				<hr
					style="border-width: 1px 0 0 0; border-style: dashed; border-color: #bbb;">
				<div>
					<font class="time" style="font-weight: bold;" size=3> 목표금액 </font>
					<font> <fmt:formatNumber
							value="${fundingPostInfo.fndTargetAmount }" pattern="#,###원" />
					</font>
				</div>
				<div>
					<font class="time" style="font-weight: bold;" size=3> 펀딩기간 </font>
					<font> <fmt:parseDate
							value="${fundingPostInfo.fndStartDate}" type="DATE"
							pattern="yyyy-MM-dd" var="currentDate" /> <fmt:formatDate
							value="${currentDate}" pattern="yyyy.MM.dd" /> ~ <fmt:parseDate
							value="${fundingPostInfo.fndEndDate}" type="DATE"
							pattern="yyyy-MM-dd" var="endPlanDate" /> <fmt:formatDate
							value="${endPlanDate}" pattern="yyyy.MM.dd" />
					</font> <br>
					<div>
    <font class="time" style="font-weight: bold;" size=3> 달성률 </font>
    <font>
        <fmt:formatNumber value="${(fundingPostInfo.fndCurrentAmount / fundingPostInfo.fndTargetAmount) * 100 }" pattern="#.##" />
        %
    </font>
</div>
<br>
					<button type="button" class="btn btn-dark"
								onclick="location.href=''">관심목록</button>
							<!-- 공유하기 모달창 -->
							<button type="button" class="btn btn-secondary" id="modal-open">공유하기</button>
							<!-- 옵션선택 모달창 -->
							<button type="button" class="btn btn-danger" id="btnOpenPopup">이 프로젝트 후원하기</button>
				</div>
			</form>
			<form id="commentForm">
				<br>
				<hr style="border: 0; height: 1px; background: #000;">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
  					<li class="nav-item" role="presentation">
    				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">프로젝트 소개</button>
  					</li>
  					<li class="nav-item" role="presentation">
    				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">구매후기</button>
  					</li>
  				</ul>
  			<div class="tab-content" id="myTabContent">
  				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  					<a>${fundingPostInfo.fndContent }</a>
  				</div>
  				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  					<input type="hidden" id="fndPostNumber" name="fndPostNumber" value="${fundingPostInfo.fndPostNumber}">
  					<input type="hidden" id="fndCommentNumber" name="fndCommentNumber">
  					
  					<c:forEach items="${commentList}" var="comment">
  						<c:choose>
  							<c:when test="${(comment.fndSecret eq 'L2') || (comment.fndSecret eq 'L1' && member.memberEmail eq fundingPostInfo.memberEmail ||
  											member.memberEmail eq comment.memberEmail || member.memberGrd eq 'A3')}">
  								  <p>${comment.fndCommentContent}</p>
  								  <p>작성자 : ${comment.memberEmail}</p>
  								  <p><fmt:formatDate value="${comment.fndCommentDate}" pattern="yyyy-MM-dd" /></p>
  								  <c:if test="${member.memberEmail eq comment.memberEmail}">
  								  	<button type="button" onclick="commentUpdate(${comment.fndCommentNumber})">수정</button>
  								  </c:if>
  								  <c:if test="${member.memberEmail eq comment.memberEmail || member.memberGrd eq 'A3'}">
  								  	<button type="button" onclick="commentDelete(${comment.fndCommentNumber})">삭제</button>
  								  </c:if>
  							</c:when>
  							<c:otherwise>
  								<p>비밀 댓글은 게시글, 댓글 작성자와 관리자만 볼 수 있습니다.</p>
  							</c:otherwise>
  						</c:choose>
  					</c:forEach>
  					<div>
  						<label for="memberEmail">작성자 : </label>
  						<input type="text" id="memberEmail" name="memberEmail" value="${member.memberEmail}">
  						<label for="fndCommentContent"> 댓글 내용 : </label>
  							<textarea rows="1" cols="100" id="fndCommentContent" name="fndCommentContent"></textarea>
  						<label for="fndSecret">비밀 댓글 : </label>
  						<input type="checkbox" id="fndSecret" name="fndSecret" value="">
  						<button id="commentInsert">댓글 작성</button>
  					</div>
  				</div>
			</div>
			</form>
			<!-- 공유하기 모달창 -->
			<div class="container">
				<div class="popup-wrap" id="popup">
					<div class="popup">
						<div class="popup-head">
							<span class="head-title"></span>
						</div>
						<div class="popup-body">
							<div class="body-content">
								<div class="body-titlebox">
								<h1>공유하기</h1>
							</div>
							<hr>
							<div class="body-contentbox">
								<div>
									<!-- 아래 스크립트단 처리 -->
									<a href="javascript:sendLink()">
									<img src="resources/images/icon-kakao.png " style="padding: 20px" /></a>
									<a href="javascript:shareFacebook()">
									<img src="resources/images/icon-facebook.png " style="padding: 20px" /></a> 
									<a href="javascript:shareTwitter()">
									<img src="resources/images/icon-twitter.png " style="padding: 20px" /></a>
									<a href="#" onclick="clip(); return false;">
									<img src="resources/images/icon-pngwing.png " style="padding: 20px" /></a>
								</div>
							</div>
						</div>
					</div>
						<div class="popup-foot">
							<!-- <span class="pop-btn confirm" id="confirm">확인</span>  -->
							<span class="pop-btn close" id="close">창 닫기</span>
						</div>
					</div>
				</div>
			</div>
</section>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

function remaindTime() {
	 
	let today = new Date();
	

	var now = new Date(); //현재시간을 구한다. 
	console.log(now);
	var open = Date.parse("${fundingPostInfo.fndEndDate}");
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

 
//옵션선택 모달 관련
 const body = document.querySelector('body');
 const modal = document.getElementById('modal');
 const btnOpenPopup = document.getElementById('btnOpenPopup');

 btnOpenPopup.addEventListener('click', () => {
   modal.classList.toggle('show');

   if (modal.classList.contains('show')) {
     body.style.overflow = 'hidden';
   }
 });

 modal.addEventListener('click', (event) => {
   if (event.target === modal) {
     modal.classList.toggle('show');

     if (!modal.classList.contains('show')) {
       body.style.overflow = 'auto';
     }
   }
 });

 //공유하기 모달 관련
 $(function(){
	  $("#confirm").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	      
	      //컨펌 이벤트 처리
	  });
	  $("#modal-open").click(function(){        
	      $("#popup").css('display','flex').hide().fadeIn();
	      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
	  });
	  $("#close").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	  });
	  function modalClose(){
	      $("#popup").fadeOut(); //페이드아웃 효과
	  }
	});


 Kakao.init('9e8afa7d0fe61fc9e80faaea5d5589a0'); // 초기화
 console.log(Kakao.isInitialized());
 

 function sendLink() {
	 var dummy   = document.createElement("textarea");
	 var text    = location.href;
	 console.log(text);
	    Kakao.Link.sendDefault({
	        objectType: 'feed',
	        content: {
	            title: '${fundingPostInfo.fndTitle }',
	            description: '공유될내용',
	            imageUrl: 'http://localhost:8080/app/resources/images/${fundingPostInfo.fndMainImg }',
	            link: {
	                mobileWebUrl: 'text',
	                webUrl: 'text',
	            },
	        },
	        buttons: [
	            {
	                title: '상품 보기',
	                link: {
	                    mobileWebUrl: 'text',
	                    webUrl: 'text',
	                },
	            }
	        ],
	    })
	};
	//페이스북 공유하기
	function shareFacebook() {
	    window.open("http://www.facebook.com/share.php?u=" + encodeURIComponent(location.href));
	};
	//트위터 공유하기
	function shareTwitter() {
	    var sendText = "${fundingPostInfo.fndTitle }"; // 전달할 텍스트
	    var sendUrl = "text"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	};

	function toggleDetails(option) {
		  var options = document.querySelectorAll('.option-box');
		  options.forEach(function(item) {
		    if (item !== option) {
		      item.classList.remove('active');
		    }
		  });
		  option.classList.toggle('active');
		}
	
	//링크복사
	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
	// 수량 조절 및 총 가격 업데이트 함수
    function updateTotalPrice(button, quantity) {
      var initialPrice = parseFloat(button.getAttribute('data-price'));
      var totalPrice = initialPrice * quantity;
      button.textContent = totalPrice;

     
    }

    // 수량 조절 함수
    function adjustQuantity(button, valueChange) {
      var quantityValue = button.parentElement.querySelector('.quantity-value');
      var value = parseInt(quantityValue.textContent) + valueChange;

      if (value >= 1) {
        quantityValue.textContent = value;
        updateTotalPrice(button.closest('.option-box').querySelector('.confirm-button'), value);
      }
    }

    // 감소 버튼 클릭 이벤트
    document.querySelectorAll('.decrement').forEach(function (button) {
      button.addEventListener('click', function (event) {
        event.stopPropagation();
        adjustQuantity(this, -1);
      });
    });

    // 증가 버튼 클릭 이벤트
    document.querySelectorAll('.increment').forEach(function (button) {
      button.addEventListener('click', function (event) {
        event.stopPropagation();
        adjustQuantity(this, 1);
      });
    });
	


    $('.AddPayment').click(function(){
    	var fndGoodsNumber = $(event.target).data('goodsnumber');
    	var fndPostNumber = ${fundingPostInfo.fndPostNumber };
    	var quantityValue = $(event.target).closest('.option-details').find('.quantity-value').text();
		
    	 location.href='${pageContext.request.contextPath}/fundingPayment?fndPostNumber=${fundingPostInfo.fndPostNumber}&fndGoodsNumber='+fndGoodsNumber+'&GoodsAmount='+quantityValue
     
    });
    
    
    
    // 댓글 작성
    	$("#commentInsert").on("click", function() {
	
		var form = document.getElementById("commentForm");
		var fndPostNumber = form.fndPostNumber.value;
		var memberEmail = form.memberEmail.value;
		var fndCommentContent = form.fndCommentContent.value;
		var fndSecret = form.fndSecret.checked ? "on" : "";
		
		$.ajax({
			url : 'fndCommentInsert',
			data : {
				"fndPostNumber" : fndPostNumber,
				"memberEmail" : memberEmail,
				"fndCommentContent" : fndCommentContent,
				"fndSecret" : fndSecret
			},
			type : "post",
			success : function(result) {
				if (result == 1) {
					alert("댓글 등록에 성공 했습니다.");
				}
				$('#fndCommentContent').val('');
			},
			error : function() {
				alert("댓글 등록에 실패 했습니다.");
			}
		});
		
	});
    
    
    // 댓글 수정
    function commentUpdate(commentNumber) {
	window.name = "parentForm";
	window.open("${pageContext.request.contextPath}/fndCommentUpdate?fndCommentNumber=" + commentNumber,
			"fndCommentUpdate", "width=570, height=350, resizable = no, scrollbars = no");
	}
    
    
    // 댓글 삭제
    function commentDelete(commentNumber) {
    		
    	$.ajax({
      		url : 'fndCommentDelete',
      		data : {
    				'fndCommentNumber' : commentNumber
    		},
      		type : 'POST',
    		success : function(result) {
    			if (result) {
    				alert("댓글 삭제에 성공 했습니다.");
    			}
    		},
    		error : function() {
    			alert("댓글 삭제에 실패 했습니다.");
    		}
    	});
    		
      }
    
    
</script>
</body>

</html>