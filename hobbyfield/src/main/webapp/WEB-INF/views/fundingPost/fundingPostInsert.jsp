<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
		<div class="container">
			<div class="text-center">
				<form id="frm" name="insertPostForm" action="fundingPostInsert" method="post">
					<div>
						<h3>어떤 프로젝트를 계획중이신가요?</h3>
						<p>프로젝트의 카테고리를 선택해주세요</p>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<div class="container">
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 카테고리<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 성격과 가장 일치하는<br> 카테고리를 선택하세요.
								</p>
							</div>
							<div class="col-sm-6">
								<select class="form-select" name="insertCateGory" name="fndCategory" aria-label="Default select example">
									<option selected>카테고리를 선택해주세요.</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
						</div>
					<br>
					<br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 제목<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 제목을<br> 적어주세요.
								</p>
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text"
									placeholder="프로젝트 제목을 입력해 주세요."
									name="fndTitle"
									aria-label="default input example">
							</div>
						</div>
					<br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 대표이미지<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 이미지를 등록해주세요.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<label for="formFileMultiple" class="form-label"></label> <input
										class="form-control" type="file" accept=".gif, .jpg, .png" id="formFileMultiple"
										name="fndMainImg" multiple>
								</div>
							</div>
						</div>
					</div>
					<br>
                        <button id="submitButton" type="submit" class="btn btn-primary" style="float:right;" disabled>확인</button>
                </form>
              </div>
             </div>
            </section>
                <script>
                var form = document.getElementById('frm');
                var submitButton = document.getElementById('submitButton');
                var fndCateGory = document.querySelector('[name="insertCateGory"]');

                function validateForm() {
                    var allInputs = form.querySelectorAll('select, input');
                    return Array.from(allInputs).every(function(input) {
                        return input.value.trim() !== '' || input.type === 'hidden';
                    });
                }

                form.addEventListener('input', function() {
                    submitButton.disabled = !validateForm() || !fndCateGory.value;
                });

                submitButton.addEventListener('click', function() {
                    if (fndCateGory.value == '카테고리를 선택해주세요.') {
                        alert('카테고리를 선택해주세요.');
                        return;
                    }

                });
	</script>
=======
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" name="insertPostForm" action="fundingPostInsert" method="post">
		<div>
			<h3>어떤 프로젝트를 계획중이신가요?</h3>
			<p>프로젝트의 카테고리를 선택해주세요</p>
		</div>
		<table>
			<tr>
				<th>프로젝트 아이디</th>
				<td><input type="text" name="fndPostNumber"></td>
			</tr>
			<tr>
				<th>프로젝트 제목</th>
				<td><input type="text" name="fndTitle"></td>
			</tr>
			<tr>
				<th>프로젝트 대표 이미지</th>
				<td><input type="text" name="fndMainImg"></td>
			</tr>
			<tr>
				<th>프로젝트 메인 이미지 등록</th>
				<td><input type="text" name="fndMainImgPath"></td>
			</tr>
			<tr>
				<th>프로젝트 목표 금액</th>
				<td><input type="text" name="fndTargetAmount"></td>
			</tr>
			<tr>
				<th>프로젝트 시작일</th>
				<td><input type="date" name="fndStartDate"></td>
			</tr>
			<tr>
				<th>프로젝트 종료일</th>
				<td><input type="date" name="fndEndDate"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
	<script>

	document.getElementById('fndStartDay').valueAsDate = new Date();
		document.querySelector('form[name="insertPostForm"]')
				.addEventListener('submit', function(e){
					e.preventDefault();
					
					let fndPostNumber = document.getElementsByName('fndPostNumber')[0];
					let fndTitle = document.getElementsByName('fndTitle')[0];
					let fndMainImg = document.getElementsByName('fndMainImg')[0];
					let fndMainImgPath = document.getElementsByName('fndMainImgPath')[0];
					let fndTargetAmount = document.getElementsByName('fndTargetAmount')[0];
					let fndCurrentAmount = document.getElementsByName('fndCurrentAmount')[0];
					let fndStartDate = document.getElementsByName('fndStartDate')[0];
					let fndEndDate = document.getElementsByName('fndEndDate')[0];
					
					
					if(fndTitle.value == ''){
						alert('제목을 입력해 주세요.');	
						fndTitle.focus();
						return;
					}
					if(fndMainImg.value == ''){
						alert('이미지를 등록해 주세요.');	
						fndMainImg.focus();
						return;
					}
					if(fndMainImgPath.value == ''){
						alert('이미지 위치를 등록해 주세요.');	
						fndMainImgPath.focus();
						return;
					}
					if(fndTargetAmount.value == ''){
						alert('펀딩 목표금액을 등록해 주세요.');	
						fndTargetAmount.focus();
						return;
					}
					if(fndStartDate.value == ''){
						alert('펀딩 시작 날짜를 입력해 주세요.');	
						fndStartDate.focus();
						return;
					}
					if(fndEndDate.value == ''){
						alert('펀딩 종료 날짜를 입력해 주세요.');	
						fndEndDate.focus();
						return;
					}
					//form태그에 대해서 중복만 되지 않는다면 바로 호출가능함
					insertPostForm.submit();
				});
				
	

	
	  
</script>
>>>>>>> branch 'master' of https://github.com/fleurnari/hobbyfield.git
</body>
</html>