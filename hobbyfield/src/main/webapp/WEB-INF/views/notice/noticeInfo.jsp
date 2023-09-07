<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin-top: 150px;
}

.notice-info {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

.notice-info th, .notice-info td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 30px;
	text-align: center;
}

.notice-subject {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

.notice-subject th, .notice-subject td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 30px;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

<meta charset="UTF-8">
</head>
<body>
	<table class="notice-info">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${notice.noticeId}</td>
				<td>${notice.noticeWriter}</td>
				<td>${notice.noticeCate}</td>
				<td>${notice.noticeTitle}</td>
				<td><fmt:parseDate value="${notice.noticeWdate}"
						pattern="yyyy-MM-dd" var="noticeWdate" /> <fmt:formatDate
						value="${noticeWdate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</tbody>
	</table>

	<table class="notice-subject">
		<thead>
			<tr>
				<th>내용</th>
			</tr>
		</thead>
		<tbody id="editor">
			<tr>
				<td>${notice.noticeSubject}</td>
			</tr>
		</tbody>
	</table>


	<!-- 버튼 -->
	<div class="buttonGroup">
		<button type="submit" onclick="location.href='updateNotice?noticeId=${notice.noticeId}'">수정</button>
		<button type="button" onclick="location.href='deleteNotice?noticeId=${notice.noticeId}'">삭제</button>
		<button type="button" onclick="location.href='noticeList'">목록</button>
	</div>
	<script type="text/javascript">
	ClassicEditor
	.create( document.querySelector( '#editor' ), {
		 toolbar: []
		 readOnly : true
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
	})
	</script>
</body>
</html>