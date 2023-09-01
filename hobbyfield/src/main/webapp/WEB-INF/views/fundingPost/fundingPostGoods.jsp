<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}
.option-box {
	width: 400px; /* 옵션창을 더 길게 만들기 */
	margin: 10px; /* 간격을 주기 위한 margin 추가 */
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 10px; /* 모서리 둥글게 설정 */
}

.option-box:hover {
	background-color: #f0f0f0;
}

.option-name {
	font-weight: bold;
	margin-top: 10px;
}

.option-description, .option-details {
	display: none;
	margin-top: 10px; /* 조금 더 큰 간격 */
}

.option-box.active .option-description, .option-box.active .option-details
	{
	display: block;
}

</style>
</head>
<body>
	<section>
		<div class="container">
			<div class="container2">
			<c:forEach items="${fundingGoodsInfo }" var="fundingGoods">
				<form action="goodsDelete" method="post" id="deleteGoods">
				<div class="product-option">
					<div class="option-box" onclick="toggleDetails(this)">
						<p class="option-name">${fundingGoods.fndGoodsName }<br>${fundingGoods.fndGoodsAmount }<br>${fundingGoods.fndGoodsPrice }<br>텍스트
						</p>
						<p class="option-description">${fundingGoods.fndGoodsContent }</p>
						<input type="text" id="fndGoodsNumber" name="fndGoodsNumber" value="${fundingGoods.fndGoodsNumber }">
						<input type="text" id="fndPostNumber" name="fndPostNumber" value="${fundingGoods.fndPostNumber }"> 
						<button type="submit" id="goodsDelete" name="goodsDelete" class="btn btn-dark">삭제</button>
					</div>
				</div>
				</form>
			</c:forEach>
		</div>
	</div>
	</section>
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
									<label>첨부이미지</label>
         <div id="preview"></div>
			<input name="uploadFile" type="file" value="profileImg" onchange="readURL(this);" accept=".gif, .jpg, .png">
			<button type="button" id="uploadBtn">upload</button>
      </div>
	
								</div>
							</div>
				
					<br>
					<input type="text" name="fndPostNumber" value="${fundingPostGoods.fndPostNumber}">
        	<button type="submit" form="frm" class="btn btn-primary" style="float: right;">저장</button>
				</div>							
				</form>
			</div>
		</div>
	</section>
	<script>
	 /* 이미지 업로드 */
    function imgUploadHandler(list) {
    			for (i = 0; i < list.length; i++) {
    				let tag = `<input type="text" name="fndGoodsImg" value="\${list[i].UUID}">
    				           <input type="text" name="fndGoodsImgPath" value="\${list[i].url}">`
    				$('#frm').append(tag);
    			}
    		}
	
    $('#deleteGoods').on('submit', function(e){
		e.preventDefault();
		
		
		let fndGoodsNumber = $(this).find('input[name="fndGoodsNumber"]').val();
		let fndPostNumber = $(this).find('input[name="fndPostNumber"]').val();
		
		$.ajax({
			url : "goodsDelete",
			method : "POST",
			//비동기라고 json 방식으로 안보내도됨! 
			data : {
				fndGoodsNumber: fndGoodsNumber,
				fndPostNumber: fndPostNumber
			}
		})
		.done(data => {
				let message = '삭제되었습니다.';
				alert(message);
				
				document.location.reload();
		})
		.fail(reject => console.log(reject));
		
	});
	
	</script>
</body>
</html>
