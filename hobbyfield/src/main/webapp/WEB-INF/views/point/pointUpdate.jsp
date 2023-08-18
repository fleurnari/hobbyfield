<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<td>${pointInfo.pointId }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${pointInfo.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${pointInfo.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="2" style="width: 100px;" readonly>
				${pointInfo.content }
				</textarea></td>
			</tr>
			<tr>
				<th>첨부이미지</th>
				<c:choose>
					<c:when test="${ not empty pointInfo.image }">
						<td><img
							src='<c:url value="/resources/${pointInfo.image }" />'
							style="width: 200px;"></td>
					</c:when>
					<c:otherwise>
						<td>파일없음</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${pointInfo.regdate }" pattern="yyyy/MM/dd" /></td>
			</tr>
		</thead>
		</tbody>
	</table>
	<button type="button"
		onclick="location.href='pointUpdate?pointId=${pointInfo.pointId }'">수정</button>
	<button type="button"
		onclick="location.href='pointDelete?pointId=${pointInfo.pointId }'">삭제</button>


</body>
</html>