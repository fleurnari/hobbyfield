<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form id="frm" name="insertPostForm" action="fundingPostInsert20"
					method="post">
					<div>
						<h3>프로젝트 기획</h3>
						<p>프로젝트의 카테고리를 선택해주세요</p>
					</div>
					<br> <br> <br> <br> <br>
					<div class="container">
						<div class="row">
							<div class="col-sm-6">
								<h4>
									목표금액<a style="color: red">*</a>
								</h4>
								<p>
									프로젝트를 완수하기 위해 필요한 금액을 설정해주세요. <br>
								</p>
								<a tabindex="0" class="btn btn-lg btn-danger" role="button"
									data-bs-toggle="popover" data-bs-trigger="focus"
									title="Dismissible popover"
									data-bs-content="●종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.<br>●후원 취소 및 결제 누락을 대비해 10% 이상 초과 달성을 목표로 해주세요.<br>●제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.">▼
									목표 금액 설정시 꼭 알아두세요!</a>
							</div>
							<div class="col-sm-6">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										
										aria-label="Recipient's username"
										aria-describedby="basic-addon2"> <span
										class="input-group-text" id="basic-addon2">원</span>
								</div>
							</div>
						</div>
						<br> <br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 제목<a style="color: red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 제목을<br> 적어주세요.
								</p>
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text"
									placeholder="프로젝트 제목을 입력해 주세요." name="fndTitle"
									aria-label="default input example">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 대표이미지<a style="color: red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 이미지를 등록해주세요.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<label for="formFileMultiple" class="form-label"></label> <input
										class="form-control" type="file" accept=".gif, .jpg, .png"
										id="formFileMultiple" name="fndMainImg" multiple>
								</div>
							</div>
						</div>
					</div>
					<br>
					<button id="submitButton" type="submit" class="btn btn-primary"
						style="float: right;" disabled>저장</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>