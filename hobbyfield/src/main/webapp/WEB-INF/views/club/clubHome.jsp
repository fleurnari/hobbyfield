<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임메인화면</title>
<style>
    aside {
        width: 200px;
        padding: 10px;
        border: 1px solid #ccc;
        float: left; /* or right depending on layout */
    }
    aside ul {
        list-style-type: none;
        padding: 0;
    }
    aside li {
        margin-bottom: 10px;
    }
    aside a {
        text-decoration: none;
        color: #333;
    }
    aside a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<aside>
    <ul>
        <li><a href="page1.jsp">페이지 1</a></li>
        <li><a href="page2.jsp">페이지 2</a></li>
        <li><a href="page3.jsp">페이지 3</a></li>
        <!-- 기타 다른 페이지들 -->
    </ul>
</aside>

<div>
    <!-- 주 내용 영역 -->
    <h2>모임 메인 화면</h2>
    <p>여기에 모임의 주요 콘텐츠가 표시됩니다.</p>
</div>

</body>
</html>
