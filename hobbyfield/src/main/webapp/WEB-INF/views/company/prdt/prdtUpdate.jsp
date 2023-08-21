<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">${prdtInfo.prdtId}</h1>
			<div class="form-group hidden-xs" id="fileDrop">
				<label>추가로 업로드 할 파일을 드랍하세요.</label>	
					<div class="fileDrop"></div>
					<ul class="clearfix uploadedList col-xs-12"></ul>
			</div>
			<div class="form-group productInfo">
				<form action="prdtUpdate" method="post">
					<div>
						<label>상품 ID</label> <input name="productId" value="${prdtInfo.prdtId}" class="form-control productId" readonly>
					</div>
					<div>
						<label>상품명</label> <input name="productName" value="${prdtInfo.prdtName}" class="form-control" required>
					</div>
					<div>
						<label>상품가격</label> <input name="price" value="${prdtInfo.prdtPrice}" class="form-control" required>
					</div>
					<div>
						<label>상품분류</label>
						<div class="form-inline">
							<select class="form-control" id="productDist">
								<option value="outer">1. 외투</option>
								<option value="top">2. 상의</option>
								<option value="bottom">3. 하의</option>
								<option value="bag">4. 가방</option>
								<option value="acc">5. 액세서리</option>
							</select>
							<button class="btn btn-default btn_productDist">입력</button>
							<input name="productDist" value="${prdtInfo.prdtDist}"
								class="form-control" readonly>
						</div>
					</div>
					<div>
						<label>재고</label> <input name="stock" value="${prdtInfo.prdtStock}" class="form-control" required>
					</div>
					<div>
						<label>상품정보</label> <input name="productInfo" value="${prdtInfo.prdtInfo}" class="form-control" required>
					</div>
					<div>
						<label>상품 등록일</label> <input value="${prdtInfo.prdtRegDate}" class="form-control" readonly>
					</div>
					<div>
						<label>최종 수정일</label> <input value="${prdtInfo.prdtUpdate}" class="form-control" readonly>
					</div>
					<div class="btns">
						<button class="btn btn-default" id="btn_product_update">상품정보 수정</button>
						<button class="btn btn-default" id="btn_product_back">상품 정보 페이지로 돌아가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	
	$(document).ready(function(){
		
		$(".uploadedList").on('click', '.delbtn', function(event) {
            /* 작은 휴지통 버튼을 누르면 파일을 삭제하는 코드 */
			var isOK = confirm("수정버튼이나 되돌아가기 버튼과 관계없이 첨부파일이 삭제됩니다.");
			if (isOK) {
				
				var that = $(this);
				
				$.ajax({
					type : 'post',
					url : '/deleteFile',
					data : {
						filename : that.attr("data-src")
					},
					dataType : 'text',
					success : function(result) {
						
						if (result =="O") {
							
							that.parent().parent().parent().remove();
							
							$.ajax({
								type : 'post',
								url : 'deleteFile',
								data : {
									filename : that.attr("data-src")
								},
								dataType : 'text',
								success : function(result) {
									alert(result);
								}
							});
							
						} else {
							alert("삭제실패");
						}
					}
				});
			} 
		});
		
		$.getJSON(""/admin/product/getAttaches/" + productId, function(result) {
			/* 썸네일이 여러개인 경우 가져와서 하나씩 썸네일 영역에 넣어줌 */
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
            /* 드래그인, 드래그 오버로 실행되는 어떠한 기능들을 막는 코드 */
		});
		
		$(".fileDrop").on("drop", function(event) {
            /* 파일 드롭 영역에 파일을 가져다 놓으면 업로드 후, 썸네일로 띄우게 하는 코드 */
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);

			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});
		});

		$("#btn_product_update").click(function(){
			
			var str = '';
			$(".delbtn").each(function(index) {
				
				var data = $(this).attr("data-src");
				str += '<input type="hidden" value="' + data + '" name="files[' + index + ']">';
			});
			
			$("form").append(str);

			$("form").submit();
		});
		
		$(".btn_productDist").on('click', function(event) {
			event.preventDefault();
			var productDist = $("#productDist option:selected").val();
			$("input[name='productDist']").val(productDist);
            /* 상품구분을 선택하고 입력 버튼을 누르면 input란에 해당하는 값이 출력됨 */
		});
		
		$("#btn_product_back").click(function(event) {
			event.preventDefault();
			history.back();
		});
	});
</script>
</body>
</html>