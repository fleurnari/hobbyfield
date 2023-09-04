<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수락 페이지</title>
</head>
<body>
<Section>
    <br><br><br><br>
    <div class="container">
        <div class="text-center">
            <h4>
                <span onclick="location.href='${pageContext.request.contextPath}/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
                <span onclick="location.href='#'">카테고리</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">공지사항</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" style="color:#5aa5db;">후원현황</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'">프로젝트만들기</span>
            </h4>
        </div>
    </div>
    <br><br><br>
    <div class="text-center">
</body>
</html>