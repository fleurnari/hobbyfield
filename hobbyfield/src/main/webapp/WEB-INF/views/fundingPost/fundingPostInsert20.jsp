<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>

</style>
</head>
<body>
	<Section>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			<h4>
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
              <span onclick="location.href='#'">카테고리</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" >후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'" style="color:#5aa5db;">프로젝트만들기</span>
            </h4>
            </div>
        </div>
		<br><br><br>
			<div class="text-center">
				<h4><span style="color:red;">프로젝트 설정</span><span> | </span><span  onclick="location.href='${pageContext.request.contextPath}/fundingPostGoods?fndPostNumber=${fundingPostInsert20.fndPostNumber}'">옵션 구성</span></h4>
						<p>프로젝트를 설정해주세요</p>
					</div>
					<br>
			<div class="text-center">
				<form id="frm" name="fundingPostUpdate" action="fundingPostUpdate"
					method="post">
				
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
										aria-label="Recipient's username" name="fndTargetAmount" value="${fundingPostInsert20.fndTargetAmount }"
										aria-describedby="basic-addon2" > <span
										class="input-group-text" id="basic-addon2">원</span>
								</div>
							</div>
						</div>
						<br> <br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									펀딩 일정<a style="color: red">*</a>
								</h4>
								<p>
									설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
									즉시 펀딩을 시작할 수 있습니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									시작날짜: <input type="date" name="fndStartDate" value="${fundingPostInsert20.fndStartDate }">
								</div>
								<br>
								<div class="mb-3">
									종료일자: <input type="date" name="fndEndDate" value="${fundingPostInsert20.fndEndDate }">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									펀딩 내용<a style="color: red">*</a>
								</h4>
								<p>
									설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
									즉시 펀딩을 시작할 수 있습니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<textarea class="form-control" name="fndContent" id="fndContent"></textarea>
							</div>
						</div>
					</div>
					<br>
					<input type="text" name="fndStatus" value="0">
					<input type="text" name="fndPostNumber" value="${ fundingPostInsert20.fndPostNumber}">
					<button type="submit" class="btn btn-primary"
						style="float: right;">저장</button>
				</form>
			
			</div>

	</section>
</body>

<script type="text/javascript">
ClassicEditor
.create(document.querySelector('#fndContent'))
.catch(error=>{
	console.error(error);
});
    $('form').on('submit', function(e){
		e.preventDefault();
		
		let objData = serializeObject();
		
		$.ajax({
			url : 'fundingPostUpdate',
			method : 'post',
			//비동기라고 json 방식으로 안보내도됨! 
			data : objData
		})
		.done(data => {
			if(data.result){
				//alert이라 텍스트형식만 가능하기때문에 객체형식인 boardInfo에서 bno만 가져와야함
				let message = '저장되었습니다.';
				alert(message);
			}else{
				alert('저장되지 않았습니다.\n정보를 확인해주세요');
			}
		})
		.fail(reject => console.log(reject));
		
		return false;
	});
	

	function serializeObject(){
		let formData = $('form').serializeArray();
		// serialize는 폼태그에서만 사용가능하고 
		// 이런방식으로 [ { name : 'tilte, value='Hello'}, {name : 'writer', value : '여행자'}, ...]
		
		let formObject = {};
		$.each(formData, function(idx, obj){
			let field = obj.name;
			let val = obj.value;
			
			formObject[field] = val;
		})
		
		return formObject;
	};
	// 시작 날짜 문자열에서 날짜 부분만 추출
	var startDateStr = "${fundingPostInsert20.fndStartDate}";
	var startDate = startDateStr.split(" ")[0]; // "yyyy-MM-dd"

	// 종료 날짜 문자열에서 날짜 부분만 추출
	var endDateStr = "${fundingPostInsert20.fndEndDate}";
	var endDate = endDateStr.split(" ")[0]; // "yyyy-MM-dd"

	// 시작 날짜 input 요소에 설정
	document.getElementById("fndStartDate").value = startDate;

	// 종료 날짜 input 요소에 설정
	document.getElementById("fndEndDate").value = endDate;
	

	

</script>
</html>