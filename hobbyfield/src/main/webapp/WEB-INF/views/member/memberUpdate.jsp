<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	/* Reset some default styling */
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}
	
	/* Body styles */
	body {
	  font-family: Arial, sans-serif;
	  background-color: #f0f0f0;
	}
	
	/* Container styles */
	.container-lg {
	  max-width: 1200px;
	  margin: 0 auto;
	  padding: 20px;
	}
	
	/* Heading styles */
	h1 {
	  font-size: 2.5rem;
	  margin-bottom: 20px;
	  color: #333;
	  text-align: center;
	}
	
	/* Input and label styles */
	label {
	  display: block;
	  font-weight: bold;
	  margin-bottom: 5px;
	}
	
	input[type="text"] {
	  width: 100%;
	  padding: 10px;
	  margin-bottom: 10px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	}
	
	/* Button styles */
	.btn {
	  display: inline-block;
	  padding: 10px 20px;
	  background-color: #007bff;
	  color: #fff;
	  text-decoration: none;
	  border: none;
	  border-radius: 5px;
	  margin: 5px;
	  cursor: pointer;
	}
	
	/* Button hover effect */
	.btn:hover {
	  background-color: #0056b3;
	}
	
	/* Address input styles */
	.address_name {
	  font-weight: bold;
	  margin-top: 15px;
	}
	
	.address_input_1_wrap {
	  display: flex;
	  align-items: center;
	  margin-top: 10px;
	}
	
	.address_input_1_box {
	  flex: 1;
	  margin-right: 10px;
	}
	
	.address_button {
	  flex: 0.5;
	}
	
	.address_input_1 {
	  width: 100%;
	  padding: 10px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	}
	
	/* Submit and back buttons */
	button[type="submit"],
	button[type="button"] {
	  display: inline-block;
	  padding: 10px 20px;
	  background-color: #007bff;
	  color: #fff;
	  text-decoration: none;
	  border: none;
	  border-radius: 5px;
	  margin: 10px 5px;
	  cursor: pointer;
	}
	
	button[type="submit"]:hover,
	button[type="button"]:hover {
	  background-color: #0056b3;
	}
	  
	  /* Button container styles */
	.button-container {
	  display: flex;
	  justify-content: center;
	  margin-top: 20px;
	}
	
	.button-container button {
	  margin: 0 10px;
	}

</style>
</head>
<body>
  <section class="bg-100 py-7" id="packages">
     <form name="updateForm">
       <div class="container-lg">
          <div class="row justify-content-center">
            <div class="col-12">
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">회원 정보 수정</h1>
            </div>
          </div>
			<div>
				<div>
				<div>
				<input type="hidden" name="memberEmail" id="memberEmail" value="${info.memberEmail}" readonly>
				</div>
				<div>
					<label for="memberNm">이름</label> <input type="text" name="memberNm"
						id="memberNm" value="${info.memberNm}">
				</div>
				<div>
					<div class="ms-lg-5"><a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberPwdUpdate">비밀번호 변경</a></div>
				</div>
				<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" type="text" id="sample6_postcode" name="memberZip" placeholder="우편번호" readonly="readonly" value="${info.memberZip}">
						</div>
						<div class="address_button">
							<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
						</div>
					</div>
					<div class ="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" type="text" id="sample6_address" name="memberBaseaddr" placeholder="기본주소" readonly="readonly" value="${info.memberBaseaddr}">
						</div>
					</div>
					<div class ="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" type="text" id="sample6_detailAddress" name="memberDetaaddr" placeholder="상세주소" readonly="readonly" value="${info.memberDetaaddr}">
					</div>
				</div>
				<div>
					<label for="memberCntinfo">연락처</label>
					<input type="text" name="memberCntinfo" id="memberCntinfo" value="${info.memberCntinfo}">
				</div>
				</div>
			</div>
        </div>
		<div class="button-container">
		  <button type="submit">수정</button>
		  <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/myPage'">뒤로 가기</button>
		</div>
        </form>
   </section>
   <script>
  	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    
		                    // 주소 변수 문자열과 참고항목 문자열 합치기
		                    addr += extraAddr;
		                    
		                } else {
		                	
		                	addr += ' ';
		                }

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
			            $(".address_input_1").val(data.zonecode);
			            $(".address_input_2").val(addr);
			            
						// 커서를 상세주소 필드로 이동한다.
			            $(".address_input_3").attr("readonly",false);
			            $(".address_input_3").focus();
					}
				}).open();
	}
  	
  	$('form').on('submit', function(e){
  		
  		let objData = serializeObject();
  		
  		$.ajax({
  			url : 'memberUpdate',
  			method : 'POST',
  			data : objData
  		})
  		.done(data => {
  			if (data){
  				alert("회원 정보 수정이 완료 되었습니다.");
  			} else {
  				alert("회원 정보 수정에 실패 했습니다.");
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
			
			formObject[field] = val;
		});
		
		return formObject;
	}
   </script>
</body>
</html>