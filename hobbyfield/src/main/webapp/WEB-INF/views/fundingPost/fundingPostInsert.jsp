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
</body>
</html>