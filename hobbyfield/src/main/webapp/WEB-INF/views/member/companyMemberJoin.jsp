<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/join.css?after">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<section id="faqs">
	<div class="container">
		<div class="row">
			<h1 class="text-center lh-sm mb-5 fs-lg-6 fs-xxl-7">기업 회원 가입</h1>
			<div class="col-12">
				<div class="card">
					<div class="card-body px-5 pb-0">
						<div class="wrapper">
							<form id="join_form" action="memberInsert" method="post">
								<div class="wrap">
									<div class="id_wrap">
										<div class="id_name">이메일</div>
										<div class="id_input_box">
											<input class="id_input" type="email" id="memberEmail" name="memberEmail">
										</div>
										<span class="id_input_re_1">사용 가능한 이메일입니다.</span>
										<span class="id_input_re_2">이미 존재하는 이메일입니다.</span>
										<span class="final_email_ck">아이디를 입력해주세요.</span>
										<span class="mail_input_box_warn"></span>
									</div>
									<div class="pw_wrap">
										<div class="pw_name">비밀번호</div>
										<div class="pw_input_box">
											<input class="pw_input" type="password" id="memberPwd" name="memberPwd">
										</div>
										<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
									</div>
									<div class="pwck_wrap">
										<div class="pwck_name">비밀번호 확인</div>
										<div class="pwck_input_box">
											<input class="pwck_input" type="password" id="passwordCheck" name="passwordCheck">
										</div>
										<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
										<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
										<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
									</div>
									<div class="user_wrap">
										<div class="user_info">기업명</div>
										<div class="user_input_box">
											<input class="user_input" type="text" id="memberNm" name="memberNm">
										</div>
										<span class="final_name_ck">이름을 입력해주세요.</span>
									</div>
									<div class="user_wrap">
										<div class="user_info">사업자번호</div>
										<div class="user_input_box">
											<input class="user_input" type="text" id="memberBizno" name="memberBizno" placeholder="000-00-0000">
										</div>
										<span class="final_bizno_ck">사업자번호를 입력해주세요.</span>
									</div>
									<div class="address_wrap">
										<div class="address_name">사업장 주소</div>
										<div class="address_input_1_wrap">
											<div class="address_input_1_box">
												<input class="address_input_1" type="text" id="sample6_postcode" name="memberZip" placeholder="우편번호" readonly="readonly">
											</div>
											<div class="address_button">
												<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
											</div>
												<div class="clearfix"></div>
										</div>
										<div class ="address_input_2_wrap">
											<div class="address_input_2_box">
												<input class="address_input_2" type="text" id="sample6_address" name="memberBaseaddr" placeholder="기본주소" readonly="readonly">
											</div>
										</div>
										<div class ="address_input_3_wrap">
											<div class="address_input_3_box">
												<input class="address_input_3" type="text" id="sample6_detailAddress" name="memberDetaaddr" placeholder="상세주소" readonly="readonly">
											</div>
										</div>
										<span class="final_addr_ck">사업장 주소를 입력해주세요.</span>
									</div>
									<div class="user_wrap">
										<div class="user_info">연락처</div>
										<div class="user_input_box">
											<input class="user_input" type="text" id="memberCntinfo" name="memberCntinfo" placeholder="'-'을 포함하여 입력해 주세요.">
										</div>
										<span class="final_tel_ck">연락처를 입력해주세요.</span>
									</div>
									<div>
										<div class="join_button_wrap">
											<input class="join_button" type="submit" value="가입하기">
										</div>
									</div>
								</div>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
		// 유효성 검사 변수
		var emailCheck = false;            // 아이디
		var emailckCheck = false;            // 아이디 중복 검사
		var pwCheck = false;            // 비번
		var pwckCheck = false;            // 비번 확인
		var pwckcorCheck = false;        // 비번 확인 일치 확인
		var nameCheck = false;            // 이름
		var biznoCheck = false;         // 사업자번호
		var addressCheck = false;         // 주소
		var telCheck = false;			// 연락처

		$(document).ready(function() {	
			// 회원가입 기능 작동
			$(".join_button").on("click", function() {

				// 입력값 변수
				var email = $('.id_input').val();
				var pw = $('.pw_input').val();
				var pwck = $('.pwck_input').val();
				var name = $('#memberNm').val();
				var bizno = $('#memberBizno').val();
				var addr = $('.address_input_3').val();
				var tel = $('#memberCntinfo').val();
				
				// 이메일 유효성 검사
				if (email == ""){
					$('.final_email_ck').css('display', 'block');
					emailCheck = false;
				} else {
					$('.final_email_ck').css('display', 'none');
					emailCheck = true;
				}
				
				// 비밀번호 유효성 검사
		        if(pw == ""){
		            $('.final_pw_ck').css('display','block');
		            pwCheck = false;
		        }else{
		            $('.final_pw_ck').css('display', 'none');
		            pwCheck = true;
		        }
				
				// 비밀번호 확인 유효성 검사
		        if(pwck == ""){
		            $('.final_pwck_ck').css('display','block');
		            pwckCheck = false;
		        }else{
		            $('.final_pwck_ck').css('display', 'none');
		            pwckCheck = true;
		        }
				
				// 이름 유효성 검사
		        if(name == ""){
		            $('.final_name_ck').css('display','block');
		            nameCheck = false;
		        }else{
		            $('.final_name_ck').css('display', 'none');
		            nameCheck = true;
		        }
				
				// 사업자번호 유효성 검사
		        if(bizno == ""){
		            $('.final_bizno_ck').css('display','block');
		            biznoCheck = false;
		        }else{
		            $('.final_bizno_ck').css('display', 'none');
		            biznoCheck = true;
		        }
				
				// 주소 유효성 검사
		        if(addr == ""){
		            $('.final_addr_ck').css('display','block');
		            addressCheck = false;
		        }else{
		            $('.final_addr_ck').css('display', 'none');
		            addressCheck = true;
		        }
				
				
				// 연락처 유효성 검사
		        if(tel == ""){
		            $('.final_tel_ck').css('display','block');
		            telCheck = false;
		        }else{
		            $('.final_tel_ck').css('display', 'none');
		            telCheck = true;
		        }
				
				// 최종 유효성 검사
		        if(emailCheck&&emailckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&biznoCheck&&addressCheck&&telCheck){
		        	$('#join_form').submit();
		        }
					return false;
				});
		});
		
		// 아이디 중복 체크
		$('.id_input').on("propertychange change keyup paste input", function(){
			
			var memberEmail = $('.id_input').val();
			var data = {memberEmail : memberEmail}
			var warnMsg = $(".mail_input_box_warn"); // 이메일 형식 유효성 검사
			
			$.ajax({
				type : "post",
				url : "memberEmailChk",
				data : data,
				success : function(result){
					if(result != 'fail'){
						if (!(mailFormCheck(memberEmail))){
							$('.id_input_re_1').css("display", "none");
					        warnMsg.text("올바르지 못한 이메일 형식입니다.");
					        warnMsg.css("display", "inline-block");				
					} else {
						warnMsg.css("display", "none");
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");
						emailckCheck = true;
					}
					} else {
						warnMsg.css("display", "none");	
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");
						emailckCheck = false;
					}
				}
		});	
	});
		
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
	
	// 비밀번호 확인 일치 유효성 검사
	 
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	    
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    } 
	});
	
	 /* 입력 이메일 형식 유효성 검사 */
	 function mailFormCheck(email){
	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 	return form.test(email);
	}

</script>


