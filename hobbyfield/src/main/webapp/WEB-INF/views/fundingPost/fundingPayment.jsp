<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	응애
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
					<img id="img" src="resources/images/${fundingPostInfo.fndMainImg }"
						alt="img" style="float: left" width="450px" height="350px">
					</figure>
					</td>
					<td>${fundingPostInfo.fndTitle }</td>
					<td>${fundingGoodsInfo.fndGoodsName }</td>
					<td>${fundingPostInfo.memberEmail }</td>
					<td>${fndGoodsAmount }</td>
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
										Naver pay<br>
									<br>									
									<button type="submit" form="frm" class="btn btn-primary" style="float: center;">결제하기</button>
									</p>
							</div>
						</div>
			</div>
			<input type="text" name="fndPostNumber" value="${fundingPostInfo.fndPostNumber }">
			<input type="text" name="fndGoodsNumber" value="${fundingGoodsInfo.fndGoodsNumber }">
			<input type="text" name="MemberEmail" value="${member.memberEmail }">
			<input type="text" name="fndOrderAmount" value="${fndGoodsAmount }">
			<input type="text" name="fndTotalPrice" id="calculatedResult3" value="">
		</form>
		</div>
	</Section>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//Get the values from the HTML
var fndGoodsAmount = parseFloat(${fndGoodsAmount });
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