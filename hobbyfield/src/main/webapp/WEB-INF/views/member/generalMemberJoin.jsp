<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/assets/images/logos/favicon.png" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/styles.min.css" />

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	/* 중복아이디 존재하지 않는경우 */
	#id_input_re_1 {
		color: green;
		display: none;
	}
	/* 중복아이디 존재하는 경우 */
	#id_input_re_2 {
		color: red;
		display: none;
	}
	
	/* 유효성 검사 문구 */
	 
	#final_email_ck{
	    display: none;
	}
	#final_pw_ck{
	    display: none;
	}
	#final_pwck_ck{
	    display: none;
	}
	#final_name_ck{
	    display: none;
	}
	
	#final_bizno_ck{
		display: none;
	}
	
	#final_mail_ck{
	    display: none;
	}
	#final_addr_ck{
	    display: none;
	}
	 
	#final_tel_ck{
		display: none;
	}
	
	
	
	/* 비밀번호 확인 일치 유효성검사 */
	#pwck_input_re_1{
	        color : green;
	        display : none;    
	}
	
	#pwck_input_re_2{
	        color : red;
	        display : none;    
	}    
	 
	/* float 속성 해제 */
	.clearfix{
		clear: both;
	}
</style>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<div
			class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
			<div class="d-flex align-items-center justify-content-center w-100">
				<div class="row justify-content-center w-100">
					<div class="col-md-8 col-lg-6 col-xxl-3">
						<div class="card mb-0">
							<div class="card-body">
								<a href="./index.html"
									class="text-nowrap logo-img text-center d-block py-3 w-100">
									<img
									src="${pageContext.request.contextPath}/resources/images/logo1.png"
									width="180" alt="">
								</a>
								<p class="text-center">일반 회원 가입</p>
								<form id="join_form" action="memberInsert" method="post">
									<div class="mb-3">
										<label for="memberEmail" class="form-label">Email
											Address</label> <input type="email" class="form-control"
											name="memberEmail" id="memberEmail"
											aria-describedby="emailHelp">
										<p>
											<span id="id_input_re_1">사용 가능한 이메일입니다.</span> <span
												id="id_input_re_2">이미 존재하는 이메일입니다.</span> <span
												id="final_email_ck">아이디를 입력해주세요.</span> <span
												id="mail_input_box_warn"></span>
										</p>
									</div>
									<div class="mb-4">
										<label for="memberPwd" class="form-label">비밀번호</label> <input
											type="password" class="form-control" id="memberPwd"
											name="memberPwd">
										<p>
											<span id="final_pw_ck">비밀번호를 입력해주세요.</span>
										</p>
									</div>
									<div class="mb-4">
										<label for="passwordCheck" class="form-label">비밀번호 확인</label> <input
											type="password" class="form-control" name="passwordCheck"
											id="passwordCheck">
										<p>
											<span id="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
												id="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
												id="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
										</p>
									</div>
									<div class="mb-3">
										<label for="memberNm" class="form-label">이름</label> <input
											type="text" class="form-control" name="memberNm"
											id="memberNm">
										<p>
											<span id="final_name_ck">이름을 입력해주세요.</span>
										</p>
									</div>
									<div class="mb-3">
										<label for="address_name" class="form-label">주소</label> <input
											type="text" class="form-control" name="memberZip"
											id="sample6_postcode" placeholder="우편번호" readonly="readonly">
										<button type="button" class="btn btn-secondary m-1"
											onclick="sample6_execDaumPostcode()">우편</button>
										<div class="clearfix"></div>
										<div class="mb-3">
											<input type="text" class="form-control" id="sample6_address"
												name="memberBaseaddr" placeholder="기본주소" readonly="readonly">
										</div>
										<div class="mb-3">
											<input type="text" class="form-control"
												id="sample6_detailAddress" name="memberDetaaddr"
												placeholder="상세주소" readonly="readonly">
										</div>
										<p>
											<span id="final_addr_ck">주소를 입력해주세요.</span>
										</p>
									</div>
									<div class="mb-3">
										<label for="user_info" class="form-label">연락처</label> <input
											type="text" class="form-control" id="memberCntinfo"
											name="memberCntinfo">
										<p>
											<span id="final_tel_ck">연락처를 입력해주세요.</span>
										</p>
									</div>
									<button type="submit" id="join_button"
										class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign
										Up</button>
									<div class="d-flex align-items-center justify-content-center">
										<p class="fs-4 mb-0 fw-bold">이미 가입한 아이디가 존재하나요?</p>
										<a class="text-primary fw-bold ms-2"
											href="${pageContext.request.contextPath}/member/login">Sign
											In</a>
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden"
										id="memberBizno" name="memberBizno" value="">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>


<script>
	// 유효성 검사 변수
	var emailCheck = false; // 아이디
	var emailckCheck = false; // 아이디 중복 검사
	var pwCheck = false; // 비번
	var pwckCheck = false; // 비번 확인
	var pwckcorCheck = false; // 비번 확인 일치 확인
	var nameCheck = false; // 이름
	var addressCheck = false // 주소
	var telCheck = false; // 연락처

	$(document).ready(
			function() {
				// 회원가입 기능 작동
				$("#join_button").on(
						"click",
						function() {

							// 입력값 변수
							var email = $('#memberEmail').val();
							var pw = $('#memberPwd').val();
							var pwck = $('#passwordCheck').val();
							var name = $('#memberNm').val();
							var addr = $('#sample6_detailAddress').val();
							var tel = $('#memberCntinfo').val();

							// 이메일 유효성 검사
							if (email == "") {
								$('#final_email_ck').css('display', 'block');
								emailCheck = false;
							} else {
								$('#final_email_ck').css('display', 'none');
								emailCheck = true;
							}

							// 비밀번호 유효성 검사
							if (pw == "") {
								$('#final_pw_ck').css('display', 'block');
								pwCheck = false;
							} else {
								$('#final_pw_ck').css('display', 'none');
								pwCheck = true;
							}

							// 비밀번호 확인 유효성 검사
							if (pwck == "") {
								$('#final_pwck_ck').css('display', 'block');
								pwckCheck = false;
							} else {
								$('#final_pwck_ck').css('display', 'none');
								pwckCheck = true;
							}

							// 이름 유효성 검사
							if (name == "") {
								$('#final_name_ck').css('display', 'block');
								nameCheck = false;
							} else {
								$('#final_name_ck').css('display', 'none');
								nameCheck = true;
							}

							// 주소 유효성 검사
							if (addr == "") {
								$('#final_addr_ck').css('display', 'block');
								addressCheck = false;
							} else {
								$('#final_addr_ck').css('display', 'none');
								addressCheck = true;
							}

							// 연락처 유효성 검사
							if (tel == "") {
								$('#final_tel_ck').css('display', 'block');
								telCheck = false;
							} else {
								$('#final_tel_ck').css('display', 'none');
								telCheck = true;
							}

							// 최종 유효성 검사
							if (emailCheck && emailckCheck && pwCheck
									&& pwckCheck && pwckcorCheck && nameCheck
									&& addressCheck && telCheck) {
								$('#join_form').submit();
							}
							return false;
						});
			});

	// 아이디 중복 체크
	$('#memberEmail').on("propertychange change keyup paste input", function() {

		var memberEmail = $('#memberEmail').val();
		var data = {
			memberEmail : memberEmail
		}
		var warnMsg = $("#mail_input_box_warn"); // 이메일 형식 유효성 검사

		$.ajax({
			type : "post",
			url : "memberEmailChk",
			data : data,
			success : function(result) {
				if (result != 'fail') {
					if (!(mailFormCheck(memberEmail))) {
						$('#id_input_re_1').css("display", "none");
						warnMsg.text("올바르지 못한 이메일 형식입니다.");
						warnMsg.css("display", "inline-block");
					} else {
						warnMsg.css("display", "none");
						$('#id_input_re_1').css("display", "inline-block");
						$('#id_input_re_2').css("display", "none");
						emailckCheck = true;
					}
				} else {
					warnMsg.css("display", "none");
					$('#id_input_re_2').css("display", "inline-block");
					$('#id_input_re_1').css("display", "none");
					emailckCheck = false;
				}
			}
		});
	});

	function sample6_execDaumPostcode() {
		new daum.Postcode({
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}

					// 주소 변수 문자열과 참고항목 문자열 합치기
					addr += extraAddr;

				} else {

					addr += ' ';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#sample6_postcode").val(data.zonecode);
				$("#sample6_address").val(addr);

				// 커서를 상세주소 필드로 이동한다.
				$("#sample6_detailAddress").attr("readonly", false);
				$("#sample6_detailAddress").focus();
			}
		}).open();
	}

	// 비밀번호 확인 일치 유효성 검사

	$('#passwordCheck').on("propertychange change keyup paste input", function() {
		var pw = $('#memberPwd').val();
		var pwck = $('#passwordCheck').val();
		$('#final_pwck_ck').css('display', 'none');

		if (pw == pwck) {
			$('#pwck_input_re_1').css('display', 'block');
			$('#pwck_input_re_2').css('display', 'none');
			pwckcorCheck = true;
		} else {
			$('#pwck_input_re_1').css('display', 'none');
			$('#pwck_input_re_2').css('display', 'block');
			pwckcorCheck = false;
		}
	});

	/* 입력 이메일 형식 유효성 검사 */
	function mailFormCheck(email) {
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
</script>


