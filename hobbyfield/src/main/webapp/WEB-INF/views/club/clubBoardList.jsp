<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 게시글</title>
</head>
<body>
	<h1>게시글 목록</h1>

<table border="1">
    <thead>
        <tr>
            <th>글 번호</th>
            <th>클럽 번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>게시글 유형</th>
            <th>일정 날짜</th>
            <th>블라인드 여부</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.boardNumber}</td>
                <td>${board.clubNumber}</td>
                <td>${board.clubBoardWriter}</td>
                <td>${board.clubBoardTitle}</td>
                <td>${board.clubBoardContent}</td>
                <td>${board.clubBoardWdate}</td>
                <td>${board.clubBoardViews}</td>
                <td>${board.clubBoardType}</td>
                <td>${board.scheduleDate}</td>
                <td>${board.clubBoardBlind}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>