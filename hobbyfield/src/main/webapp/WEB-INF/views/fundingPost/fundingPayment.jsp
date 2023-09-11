<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<Section>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			<h4>
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
            </div>
                          <div class="dropdown">
                <span>
                <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                </button>
                <ul class="dropdown-menu" aria-labelledby="categoryDropdown">
                    <c:forEach items="${category}" var="type">
                        <li>
                            <a class="dropdown-item" href="#" data-type-code="${type.literal}">${type.literal}</a>
                        </li>
                    </c:forEach>
                </ul>
                </span>
              <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/notice/noticeList'">공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'">후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'">프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'">프로젝트 승인</span>
                </c:if>
            </h4>
            </div>
        </div>
        <div>
        </div>
	</Section>
	<Section>
		<div class="container">
		<form>
			<div class="container2">
				<h3>주문/결제</h3>
			</div>
			<hr style="border-width: 1px 0 0 0; border-style: dashed; border-color: #bbb;">
			
			<div>
				<table class="table table-striped">
					<tr class="active">
					<td></td>
					<td>프로젝트이름</td>
					<td>상품정보</td>
					<td>판매자</td>
					<td>수량</td>
					<td>상품금액</td>
					</tr>
					<tr>
					<td>
					<figure>
					<img id="img" src="${fundingGoodsInfo.fndGoodsImgPath }${fundingGoodsInfo.fndGoodsImg }"
						alt="img" style="float: left" width="450px" height="350px">
					</figure>
					</td>
					<td>${fundingPostInfo.fndTitle }</td>
					<td>${fundingGoodsInfo.fndGoodsName }</td>
					<td>${fundingPostInfo.memberEmail }</td>
					<td>${GoodsAmount }</td>
					<td><span id="calculatedResult"></span><span>원</span></td>
					</tr>
				</table>
				<hr style="border-width: 1px 0 0 0; border-style: dashed; border-color: #bbb;">
				<div class="container">
						
						<div class="row">
							<div class="col-sm-6">
								<p>
									배송지정보<a style="color:red">*</a>
								</p>
								<p>
									<a>수신인: <input type="text" id="fndOrderRecipient" name="fndOrderRecipient" value="${member.memberNm}"></a>
									<br>
									<a>전화번호: <input type="text" id="fndCntinfo" name="fndCntinfo" value="${member.memberCntinfo}"></a>
									<br>
									주소:
										<div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                            <div class="col-md-8">
                                <input type="text" id="FndZip" name="FndZip" value="${member.memberZip}" class="form-control" readonly>
								<input type="button" id="searchBtn" value="Search" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-lg"><br>
								<input type="text" id="FndBaseAddr" name="FndBaseAddr" value="${member.memberBaseaddr}" placeholder="Address" class="form-control" required="required"><br>
								<input type="text" id="FndDetaAddr" name="FndDetaAddr" value="${member.memberDetaaddr}" placeholder="상세주소를 입력해주세요." class="form-control" required="required">					
                            </div>
                        </div>
									<br>
									[요청사항]<br>
									<input class="form-control" type="text"
									placeholder="요청사항을 입력해주세요."
									name="FndOrderRequest"
									aria-label="default input example">
									<br>
								
							</div>
							<div class="col-sm-6">
									<p>
										주문자정보<br>
										이름: ${member.memberNm}<br>
										이메일: ${member.memberEmail}<br>
										<br>
										결제상세<br>
										주문금액 <span id="calculatedResult2"></span>원<br>
										<br>
										결제수단<br>
										kakao pay<br>
									<br>	
									<button type='button' onclick="requestPay()">결제하기</button>			
									
									</p>
							</div>
						</div>
			</div>
			<input type="text" name="fndPostNumber" value="${fundingPostInfo.fndPostNumber }">
			<input type="text" name="fndGoodsNumber" value="${fundingGoodsInfo.fndGoodsNumber }">
			<input type="text" name="MemberEmail" value="${member.memberEmail }">
			<input type="text" name="fndOrderAmount" value="${GoodsAmount }">
			<input type="text" name="fndTotalPrice" id="calculatedResult3" value="calculatedValue">
			<input type="text" value="${fundingGoodsInfo.fndGoodsPrice }">
			<input type="text" value="${fundingPostInfo.fndEndDate }">
		</form>
		</div>
	</Section>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	var endDate = Date.parse("${fundingPostInfo.fndEndDate}");
	console.log(endDate);
	var IMP = window.IMP;
	IMP.init('imp73114016'); // 예: imp00000000
	
	var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
    var BaseAddr = '${member.memberBaseaddr}';
    var DetaAddr = '${member.memberDetaaddr}';
    var buyer_addr = BaseAddr + DetaAddr;
  
  
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: 'kakaopay',
		    merchant_uid : "IMP"+makeMerchantUid,
		    schedule_at : endDate,
		    currency: "KRW",
		    name : '${fundingGoodsInfo.fndGoodsName }'/*상품명*/,
		    amount : calculatedValue/*상품 가격*/, 
		    buyer_email : '${member.memberEmail}'/*구매자 이메일*/,
		    buyer_name : '${member.memberEmail }',
		    buyer_tel : '${member.memberCntinfo}'/*구매자 연락처*/,
		    buyer_addr : buyer_addr/*구매자 주소*/,
		    buyer_postcode : '${member.memberZip}'/*구매자 우편번호*/
      }, function(rsp) {
		    if ( rsp.success ) {
		    	let objData = serializeObject();
		    	objData.merchantUid = rsp.merchant_uid;
		    	console.log(objData);

		        $.ajax({
		        	url : 'supportInsert',
		        	method : 'post',
		        	data : objData,
		        })
				Swal.fire(
  					'결제가 성공했습니다!',
  					'후원현황을 확인해주세요!',
  					'success'
				);

		    } else {
		    	Swal.fire(
		    			  '결제가 실패했습니다!',
		    			  '결제 정보를 확인해주세요!',
		    			  'error'
		    			)
			
		    }
      });
    }
    console.log(merchant_Uid)
    function serializeObject(){
		let formData = $('form').serializeArray();
		
		let formObject = {};
		$.each(formData, function(idx, obj){
			let field = obj.name;
			let val = obj.value;
			
			formObject[field] = val;
		})
		
		return formObject;
	};

  </script>
  <script>
  var endDate = Date.parse("${fundingPostInfo.fndEndDate}");
	console.log(endDate);
	var IMP = window.IMP;
	IMP.init('imp73114016'); // 예: imp00000000
	
	var today = new Date();   
  var hours = today.getHours(); // 시
  var minutes = today.getMinutes();  // 분
  var seconds = today.getSeconds();  // 초
  var milliseconds = today.getMilliseconds();
  var makeMerchantUid = hours +  minutes + seconds + milliseconds;
  
  var BaseAddr = '${member.memberBaseaddr}';
  var DetaAddr = '${member.memberDetaaddr}';
  var buyer_addr = BaseAddr + DetaAddr;


  function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: 'kakaopay',
		    merchant_uid : "IMP"+makeMerchantUid,
		    schedule_at : endDate,
		    currency: "KRW",
		    name : '${fundingGoodsInfo.fndGoodsName }'/*상품명*/,
		    amount : calculatedValue/*상품 가격*/, 
		    buyer_email : '${member.memberEmail}'/*구매자 이메일*/,
		    buyer_name : '${member.memberEmail }',
		    buyer_tel : '${member.memberCntinfo}'/*구매자 연락처*/,
		    buyer_addr : buyer_addr/*구매자 주소*/,
		    buyer_postcode : '${member.memberZip}'/*구매자 우편번호*/
    }, function(rsp) {
		    if ( rsp.success ) {
		    	let objData = serializeObject();
		    	objData.merchantUid = rsp.merchant_uid;
		    	console.log(objData);

		        $.ajax({
		        	url : 'supportInsert',
		        	method : 'post',
		        	data : objData,
		        })
				Swal.fire(
					'결제가 성공했습니다!',
					'후원현황을 확인해주세요!',
					'success'
				);

		    } else {
		    	Swal.fire(
		    			  '결제가 실패했습니다!',
		    			  '결제 정보를 확인해주세요!',
		    			  'error'
		    			)
			
		    }
    });
  }
  console.log(merchant_Uid)
  function serializeObject(){
		let formData = $('form').serializeArray();
		
		let formObject = {};
		$.each(formData, function(idx, obj){
			let field = obj.name;
			let val = obj.value;
			
			formObject[field] = val;
		})
		
		return formObject;
	};

</script>
<script>
	 //Get the values from the HTML
  var fndGoodsAmount = parseFloat(${GoodsAmount });
  var fndTotalPrice = parseFloat(${fundingGoodsInfo.fndGoodsPrice });
  // Calculate the product
  var calculatedValue = fndGoodsAmount * fndTotalPrice;
  document.getElementById('calculatedResult').textContent = calculatedValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');;
  document.getElementById('calculatedResult2').textContent = calculatedValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');;
  document.getElementById('calculatedResult3').value = calculatedValue;
      
  function sample6_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                  } else {
                      document.getElementById("sample6_extraAddress").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('FndZip').value = data.zonecode;
                  document.getElementById("FndBaseAddr").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("FndDetaAddr").focus();
              }
          }).open();
      }
	</script>
</body>
</html>