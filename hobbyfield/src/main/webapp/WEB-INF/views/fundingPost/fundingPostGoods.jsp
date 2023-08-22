<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<section>
		<div class="container">
			<div class="text-center">
				<form id="frm" name="fundingPostGoods" action="fundingPostInsertGoods"
					method="post">
					<div>
						<h3>프로젝트 옵션</h3>
						<p>프로젝트의 옵션을 설정해주세요</p>
					</div>
					<br> <br> <br> <br> <br>
					<div class="container">	
						<div class="row">
							<div class="col-sm-6">
								<h4>
									펀딩 옵션 이름<a style="color: red">*</a>
								</h4>
								<br>
								<p>
									펀딩 옵션은 펀딩에 포함되는 구성 품목을 말합니다. <br>
								<p>
							</div>
							<div class="col-sm-6">
								<div class="input-group mb-3">
								
							
									옵션이름: <input type="text" name="fndGoodsName" value="">
								
								</div>
							</div>
						</div>
						<br> <br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									펀딩 설명<a style="color: red">*</a>
								</h4>
								<p>
									설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
									즉시 펀딩을 시작할 수 있습니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									펀딩설명: <input type="text" name="fndGoodsContent" value="">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									상품 가격<a style="color: red">*</a>
								</h4>
								<p>
									설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
									즉시 펀딩을 시작할 수 있습니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										aria-label="Recipient's username" name="fndGoodsPrice" value=""
										aria-describedby="basic-addon2" > <span
										class="input-group-text" id="basic-addon2">원</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									상품 이미지<a style="color: red">*</a>
								</h4>
								<p>
									설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
									즉시 펀딩을 시작할 수 있습니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<label for="formFileMultiple" class="form-label"></label> <input
										class="form-control" type="file" accept=".gif, .jpg, .png" id="formFileMultiple"
										name="fndGoodsImg" multiple>
								</div>
							</div>
						</div>
					</div>
					<br>
					<input type="text" name="fndPostNumber" value="${fundingPostGoods.fndPostNumber}">
        	<button type="submit" form="frm" class="btn btn-primary" style="float: right;">저장</button>
				</form>
			
			</div>
		</div>
	</section>
</body>

