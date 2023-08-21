<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상점 수정</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>포인트 상품번호</th>
				<th>작성일</th>
				<th>제목</th>
				<th>작성자</th>
				<th>내용</th>
				<th>첨부이미지</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${point.pointId }</td>
				<td><fmt:formatDate value="${pointInfo.pointRegdate }"
						pattern="yyyy/MM/dd" /></td>
				<td>${point.pointName }</td>
				<td>${pointInfo.pointWriter }</td>
				<td><textarea rows="3" cols="2" style="width: 100px;"
						placeholder="내용을 입력하세요.">
				${pointInfo.pointContent }
				</textarea></td>
				<c:choose>
					<c:when test="${ not empty pointInfo.pointImgPath }">
						<td><img
							src='<c:url value="/resources/${pointInfo.pointImgPath }" />'
							style="width: 200px;"></td>
					</c:when>
					<c:otherwise>
						<td>파일없음</td>
					</c:otherwise>
				</c:choose>
		</tbody>
	</table>
	<div class="buttonGroup">
		<button type="submit">수정완료</button>
		<button type="button" onclick="location.href='pointList'">목록</button>
		<button type="reset" onclick="location.href='pointUpdate'">취소</button>
	</div>
</body>
</html>