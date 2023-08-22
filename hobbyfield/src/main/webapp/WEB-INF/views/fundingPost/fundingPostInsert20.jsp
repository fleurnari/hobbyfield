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
	<Section>
	
			<div class="navbar-nav ms-auto mb-2 mb-lg-0">
              <span class="nav-item px-2"><a class="nav-link fw-bold" id="fundingGoodsLink" onclick="location.href='${pageContext.request.contextPath}/fundingPostGoods?fndPostNumber=${fundingPostInsert20.fndPostNumber}'">옵션 구성</a></span>
            </div>
       
	</Section>
	<section>
		<div class="container">
			<div class="text-center">
				<form id="frm" name="fundingPostUpdate" action="fundingPostUpdate"
					method="post">
					<div>
						<h3>프로젝트 설정</h3>
						<p>프로젝트를 설정해주세요</p>
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
					</div>
					<br>
					<input type="hidden" name="fndPostNumber" value="${ fundingPostInsert20.fndPostNumber}">
					<button type="submit" class="btn btn-primary"
						style="float: right;">저장</button>
				</form>
			
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">
    
//목표금액에 000,000 콤마
/*     function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	} */
    
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
</script>
</html>