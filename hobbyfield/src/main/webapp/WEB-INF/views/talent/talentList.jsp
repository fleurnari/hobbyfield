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
</style>
<meta charset="UTF-8">
<title>재능기부 카테고리내 전체조회</title>
</head>
<body>
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
				<th>모집정원</th>

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
					<td>${talent.tlntCap }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>