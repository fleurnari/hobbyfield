<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
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
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
            </div>
            <br>
            <br>
                          <div class="dropdown">
                <span>
                <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                </button>
                <ul class="dropdown-menu" aria-labelledby="categoryDropdown">
                    <c:forEach items="${category}" var="type">
                        <li>
                            <a class="dropdown-item" href="#" data-type-code="${type.literal}">${type.literal}</a>
                        </li>
                    </c:forEach>
                </ul>
                </span>
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/ParticipantsList'">   |  인기</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/endDateList'"> |  마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/notice/noticeList?noticeCate=AA3'"> |  공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'"> |  후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'"> |  프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'"> |  프로젝트 승인</span>
                </c:if>
            </div>
        </div>
      <section>
			<div class="text-center">
				<h4><span   onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsert20?fndPostNumber=${fundingPostGoods.fndPostNumber }'" >프로젝트 설정</span><span> | </span><span style="color:red;">옵션 구성</span></h4>
					                  <button type="button" class="btn btn-primary" id="fundingInsertAcc" style="float: right;">프로젝트 등록 완료하기</button>
						<p>프로젝트를 설정해주세요</p>
					</div>
					<br>
					
		<div class="container">
			<div class="container2">
			<c:forEach items="${fundingGoodsInfo }" var="fundingGoods">
				<form action="goodsDelete" method="post" id="deleteGoods">
				<div class="product-option">
					<div class="option-box">
						<p class="option-name">${fundingGoods.fndGoodsName }<br>${fundingGoods.fndGoodsAmount }<br>${fundingGoods.fndGoodsPrice }<br>텍스트
						</p>
						<p class="option-description">${fundingGoods.fndGoodsContent }</p>
						<input type="hidden" id="fndGoodsNumber" name="fndGoodsNumber" value="${fundingGoods.fndGoodsNumber }">
						<input type="hidden" id="fndPostNumber" name="fndPostNumber" value="${fundingGoods.fndPostNumber }"> 
						<button type="submit" id="goodsDelete" name="goodsDelete" class="btn btn-dark">삭제</button>
					</div>
				</div>
				</form>
			</c:forEach>
		</div>
	</div>
	<br>
	<hr>
			<div class="text-center">
				<form id="frm" name="fundingPostGoods" action="fundingPostInsertGoods"
					method="post">
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
									옵션이름 <input type="text" class="form-control" name="fndGoodsName" value="">
							</div>
						</div>
						<br>
						<hr>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									옵션 설명<a style="color: red">*</a>
								</h4>
								<p>
									옵션에 대한 간략한 설명을 적어주세요<br> 옵션 설명란은 옵션선택시 간략하게 보여주는<br>
									옵션 선택 창에 기입되는 란입니다.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									펀딩설명 <input type="text" class="form-control" name="fndGoodsContent" value="">
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									상품 가격<a style="color: red">*</a>
								</h4>
								<p>
									옵션 상품의 가격을 설정해주세요.<br>
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
						<hr>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									상품 이미지<a style="color: red">*</a>
								</h4>
								<p>
									옵션 상품의 이미지를 설정해주세요.<br>
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
					<input type="hidden" name="fndPostNumber" value="${fundingPostGoods.fndPostNumber}">
        	<button type="submit" form="frm" class="btn btn-primary" style="float: right;">저장</button>
				</div>							
				</form>
			</div>
	<br>
	<br>
	</section>
	<script>
	 /* 이미지 업로드 */
    function imgUploadHandler(list) {
    			for (i = 0; i < list.length; i++) {
    				let tag = `<input type="hidden" name="fndGoodsImg" value="\${list[i].UUID}">
    				           <input type="hidden" name="fndGoodsImgPath" value="\${list[i].url}">`
    				$('#frm').append(tag);
    			}
    		}
	
    $('#deleteGoods').on('submit', function(e){
		e.preventDefault();
		
		const url = '${pageContext.request.contextPath}/fundingPost/fundingMyProject';
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
				
				window.location.href ='${pageContext.request.contextPath}/fundingPost/fundingPostGoods?fndPostNumber='+fndPostNumber;
		})
		.fail(reject => console.log(reject));
		window.location.href ='${pageContext.request.contextPath}/fundingPost/fundingPostGoods?fndPostNumber='+fndPostNumber;
	});
	
    //등록하기 버튼 눌렀을때
    var fundingInsertButton = document.getElementById("fundingInsertAcc");
    fundingInsertButton.addEventListener("click", function() {
 
    		
    		let fndPostNumber = ${fundingPostGoods.fndPostNumber };
    		let fndStatus = 1;
			
    		$.ajax({
				url : "updateFundingStatus",
				method : "POST",
				data : {
					fndPostNumber : fndPostNumber,
					fndStatus : fndStatus
				}
			})
			.done(data => {
		         if(data.result){
		            Swal.fire({
		                  title: '저장되었습니다', // 제목 추가
		                    text: 'success' // 텍스트 추가
		                    }).then(function () {

		                    window.location.href = '${pageContext.request.contextPath}/fundingPost/fundingMyProject';
		                });
		         }else{

		        	 		window.location.href = '${pageContext.request.contextPath}/fundingPost/fundingMyProject';

		          }
		      })
		      .fail(reject => console.log(reject));
		      
		      return false;
    	});
    
	</script>
</body>
</html>
