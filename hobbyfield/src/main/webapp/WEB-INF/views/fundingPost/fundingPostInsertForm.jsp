<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록폼1</title>
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
              <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" >후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'" style="color:#5aa5db;">프로젝트만들기</span>
            </h4>
            </div>
        </div>
	</Section>
<section>
<div class="container">
	<div class="text-center">
	
		<h3>꿈을 시작하는 시작</h3>
		<p>쉽고 빠르게 만드는</p>
		
		<button type="button" class="btn btn-danger btn-lg" onclick="location.href='fundingPostInsert'">프로젝트 만들기</button>
	<br><br><br><br>
	</div>
</div>
</section>
</body>
</html>