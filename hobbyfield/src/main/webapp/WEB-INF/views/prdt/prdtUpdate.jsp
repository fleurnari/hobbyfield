<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
</head>

<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">
    <form action="prdtUpdate" method="post" class="form-horizontal">
        <fieldset>
            <legend>상품 수정</legend>
            <div class="form-group row">
                <label for="prdtName" class="col-sm-2 control-label">상품명</label>
                <div class="col-sm-3">
                    <input type="text" id="prdtName" name="prdtName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtCate" class="col-sm-2 control-label">상품 카테고리</label>
                <div class="col-sm-3">
                    <select id="prdtCate" name="prdtCate" class="form-control">
                        <option value="케이스">케이스</option>
                        <option value="키링">키링</option>
                        <option value="스트랩">스트랩</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtPrice" class="col-sm-2 control-label">상품 가격</label>
                <div class="col-sm-3">
                    <input type="number" id="prdtPrice" name="prdtPrice" class="form-control" value="${prdtInfo.prdtPrice }">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtCount" class="col-sm-2 control-label">재고</label>
                <div class="col-sm-3">
                    <input type="number" id="prdtCount" name="prdtCount" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtContents" class="col-sm-2 control-label">상품 설명</label>
                <div class="col-sm-5">
                    <textarea id="prdtContents" name="prdtContents" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="prdtThum" class="col-sm-2 control-label">상품 이미지</label>
                <div class="col-sm-3">
                    <input type="text" id="prdtThum" name="prdtThum" class="form-control">
                    <input name="uploadFile" type="file" value="profileImg" onchange="readURL(this);">
                </div>
            </div>
            <br>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-secondary cancel_btn">목록으로</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<script>
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "prdtList";
		})
	})
	
	$(".update_btn").on("click", function(){
			formObj.prop("action", "prdtUpdate");
			formObj.prop("method", "get");
			formObj.submit();	
	})
		
	</script>
	<script>
/* 이미지 업로드 */
function imgUploadHandler(list) {
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" id="prdtThum" name="prdtThum" value="\${list[i].UUID}">
				           <input type="hidden" id="prdtThumPath" name="prdtThumPath" value="\${list[i].url}">`
				$('.form-horizontal').append(tag);
			}
		}
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</body>
</html>