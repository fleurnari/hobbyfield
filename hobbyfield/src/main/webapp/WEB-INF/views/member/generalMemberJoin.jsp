<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<section id="faqs">
	<div class="container">
		<div class="row">
			<h1 class="text-center lh-sm mb-5 fs-lg-6 fs-xxl-7">일반 회원 가입</h1>
			<div class="col-12">
				<div class="card">
					<div class="card-body px-5 pb-0">
						<div class="row gx-8">
							<form id="insertFrm" action="memberInsert" onsubmit="return formCheck()" method="get">
									<div>
										<table>
											<tr>
												<th width="150">*이메일</th>
												<td width="300">
													<input type="email" id="memberId" name="memberId" required="required">
													<button id="checkId" value="No" onclick="idCheck()">중복체크</button>
												</td>
											</tr>
											<tr>
												<th>*패스워드</th>
												<td>
													<input type="password" id="memberPwd" name="memberPwd" required="required">
												</td>
											</tr>
											<tr>
												<th>*패스워드 확인</th>
												<td>
													<input type="password" id="passwordCheck" name="passwordCheck" required="required">
												</td>
											</tr>
											<tr>
												<th>*이름</th>
												<td>
													<input type="text" id="memberNm" name="memberNm" required="required">
												</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>
													<input type="text" id="sample6_postcode" name="memberZip" placeholder="우편번호">
													<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
													<input type="text" id="sample6_address" name="memberBaseaddr" placeholder="기본주소">
													<input type="text" id="sample6_detailAddress" name="memberDetaaddr" placeholder="상세주소">
												</td>
											</tr>
											<tr>
												<th>*연락처</th>
												<td>
													<input type="text" id="memberCntinfo" name="memberCntinfo" required="required">
												</td>
											</tr>
									</table>
								</div><br>
								<div>
									<input type="submit" value="등록">&nbsp;&nbsp;
									<input type="reset" value="취소">&nbsp;&nbsp;
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
	function formCheck() {
		let frm = document.getElementById("insertFrm");
		if (frm.memberPwd.value != frm.passwordCheck.value) {
			alert("비밀번호가 일치 하지 않습니다.");
			frm.memberPwd.value = "";
			frm.passwordCheck.value = "";
			frm.memberPwd.focus();
			return false;
		} else if (frm.checkId.value != "Yes") {
			alert("아이디 중복체크를 해 주세요.");
			return false;
		}
	
		return true;
	}
	
	function idCheck() {
		$.ajax({
			url : "/idChk",
			type : "post",
			dataType : "json",
			data : {"memberEmail" : $("#memberEmail").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#checkId").attr("value", "Yes");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	
    
    
</script>