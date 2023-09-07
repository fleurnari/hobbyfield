<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	margin-top: 150px;
}

table {
	border: solid 2px;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fff;
	margin: 10% auto;
	padding: 20px;
	width: 40%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	text-align: center;
	position: relative;
}

.close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>재능기부 카테고리내 전체조회</title>
</head>
<body>
	<!--  재능기부 지원폼과 카테고리 내 전체조회	-->
	<h3 class="talent">${talent.tlntCate}</h3>

	<!-- 모달버튼 -->
	<div class="talent-button">
		<button type="button" onclick="location.href='talentInsert'">재능기부하기</button>
	</div>
		
	<div class="talentList">
		<c:forEach items="${talentList }" var="talent">
			<div class="talent-lec" onclick="lacation.href='talentInfo?tlntId=${talent.tlntId}'">
				
			</div>	
		</c:forEach>
			
	</div>


	<table>
		<thead>
			<tr>
				<th>재능기부 번호</th>
				<th>재능기부 카테고리</th>
				<th>작성자</th>

				<th>작성일</th>
				<th>조회수</th>
				<th>제목</th>

				<th>내용</th>
				<th>재능기부 시작일자</th>
				<th>재능기부 종료일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="talent" items="${talentList }">
				<tr>
					<td>${talent.tlntId }</td>
					<td>${talent.tlntCate }</td>
					<td>${talent.tlntWriter }</td>

					<td>${talent.tlntWdate }</td>
					<td>${talent.tlntView }</td>
					<td>${talent.tlntTitle }</td>

					<td>${talent.tlntContent }</td>
					<td>${talent.tlntStartday }</td>
					<td>${talent.tlntEndday }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


<script type="text/javascript">



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
})







</script>

</body>
</html>