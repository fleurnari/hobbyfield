<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	margin-top: 150px;
	margin-left: 500px;
	display: center;
}
</style>
</head>
<body>
	<form action="talentInsert" class="talentInsert" method="post">
		<div>
			<h3>재능기부 등록</h3>
		</div>
		<div class="form-group">
			<label for="talentCate">카테고리</label> <select class="form-contol"
				id="tlntCate" name="tlntCate">
				<option disabled selected>재능기부 카테고리</option>
				<option id="Y1" value="가족">가족</option>
				<option id="Y2" value="스터디">스터디</option>
				<option id="Y3" value="취미(동호회)">취미(동호회)</option>
				<option id="Y4" value="운동">운동</option>
				<option id="Y5" value="학교">학교</option>
				<option id="Y6" value="팬밴드">팬밴드</option>
				<option id="Y7" value="회사">회사</option>
			</select>
		</div>
		<div>
			<h6>제목</h6>
			<span><input type="text" id="tlntTitle" name="tlntTitle"
				required="required" placeholder="재능기부 제목을 입력하세요."></span>
		</div>
		<div>
			<h6>내용</h6>
			<div class="editor">
			<span><textarea id="tlntContent" name="tlntContent"
					></textarea></span>
			</div>
		</div>
		<div>
			<h6>모집기간</h6>
			<p>재능기부 모집시작일</p>
			<span><input type="date"></span>
			<p>재능기부 모집마감일</p>
			<span><input type="date"></span>
		</div>
		<div>
			<h6>모집정원</h6>
			<span><input type="number" value="모집정원"></span>
		</div>
		<div>
			<h6>재능기부 기간</h6>
			<p>재능기부 시작일</p>
			<span><input type="date"></span>
			<p>재능기부 마감일</p>
			<span><input type="date"></span>
		</div>
		<div class="buttonGroup">
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='talentList'">목록</button>
			<button type="reset">초기화</button>
		</div>
	</form>




	<script>

//editor
ClassicEditor
.create( document.querySelector( '#editor' ), {
} )
.then( editor => {
    const toolbarElement = editor.ui.view.toolbar.element;
    editor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
        if ( isReadOnly ) {
            toolbarElement.style.display = 'none';
        } else {
            toolbarElement.style.display = 'flex';
        }
    });
});

</script>
</body>
</html>