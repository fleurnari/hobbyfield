<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

body {
	margin-top: 100px; 
	background: fff;
	font-family: sans-serif;
	font-weight: 100;

}
.header {
	text-align: center;
	padding: 20px;
	margin-bottom: 30px;
}

.title {
	margin-bottom: 30px;
}


.notice-info {
    width: 95%;
    margin: 0 auto;
    border-collapse: separate;
    border-spacing: 0;
}

.notice-info th, .notice-info td {
    border: none;
    border-bottom: 1px solid #ddd;
    padding: 10px;
    height: 30px;
    text-align: center; 
}
.col-1 { width: 10%; }
.col-2 { width: 8%; }
.col-3 { 
		width: 18%; 
}
.col-4 { width: 57%; }
.col-5 { width: 22%; }

th.col-1, th.col-3, th.col-4, th.col-5 {
    background-color: #f0f0f0; 
    text-align: center; 
}

.notice-subject {
    width: 95%;
    margin: 0 auto;
    border-collapse: separate; 
    border-spacing: 0; 
}

.notice-subject th {
    border: none;
    border-bottom: 1px solid #ddd; 
    background-color: #f0f0f0; 
    padding: 10px;
    height: 30px;
    text-align: center;
}

.notice-subject td {
    border: none; 
    border-bottom: 1px solid #ddd;
    padding: 10px;
    height: 30px;
    text-align: left;
}
.btn-group { 
 	text-align: center;
 	margin-top: 30px;
 	margin-left: 45%;
} 

.btn-group button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 50px;
	
}

.centered-button{
	margin-top: 50px;
}

.ck.ck-editor {
    border: none;
}


</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
</head>
<body>
<div class="header">
		<h1 class="title">공지사항</h1>
		
</div>
	<div>
		<table class="notice-info">
			<thead>
				<tr>
					<th class="col-1">글번호</th>
<!-- 					<th class="col-2">작성자</th> -->
					<th class="col-3">카테고리</th>
					<th class="col-4">제목</th>
					<th class="col-5">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${notice.noticeId}</td>
<%-- 					<td>${notice.noticeWriter}</td> --%>
<%-- 					<td>${notice.noticeCate}</td> --%>
					<td> <c:choose>
					        <c:when test="${notice.noticeCate == 'AA1'}">사이트전체공지</c:when>
					        <c:when test="${notice.noticeCate == 'AA2'}">소모임</c:when>
					        <c:when test="${notice.noticeCate == 'AA3'}">펀딩</c:when>
					        <c:when test="${notice.noticeCate == 'AA4'}">쇼핑몰</c:when>
					        <c:when test="${notice.noticeCate == 'AA5'}">포인트</c:when>
					        <c:otherwise>기타</c:otherwise>
					    </c:choose>
					</td>
					<td>${notice.noticeTitle}</td>
					<td><fmt:parseDate value="${notice.noticeWdate}" pattern="yyyy-MM-dd" var="noticeWdate" /> 
						<fmt:formatDate value="${noticeWdate}" pattern="yyyy-MM-dd" /></td>
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
		<div class="btn-group">
			<c:if test="${member.memberGrd eq 'A3'}">
				<button type="submit" onclick="location.href='updateNotice?noticeId=${notice.noticeId}'">수정</button>
				<button type="button" onclick="location.href='deleteNotice?noticeId=${notice.noticeId}'">삭제</button>
			</c:if>
				<button type="button" onclick="location.href='noticeList'" class="centered-button">목록</button> 
		</div> 
	</div>
	
	<script type="text/javascript">
	//editor
	ClassicEditor
	.create( document.querySelector( '#editor' ), {
		 toolbar: [],
		 readOnly : true
	} )
	.then(editor => {
        const toolbarElement = editor.ui.view.toolbar.element;
        toolbarElement.style.display = 'none'; 
    });
	
	function replaceBrTag(str) 
    {
        if (str == undefined || str == null)
        {
            return "";
        }

        str = str.replace(/\r\n/ig, '<br>');
        str = str.replace(/\n/ig, '<br>');
        str = str.replace(/\n/ig, '<br>');
        return str;
    }
	
		$.('.noticeSubject').html( replaceBrTag($('.noticeSubject').text()) )
	
	
	</script>
</body>
</html>