<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css?after">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css?after">
</head>
<body>
	<div id="wrapper">
		<header>
			<div class="top">
				<div>
					<p>
						<a href="#">로그인</a> <a href="#">회원가입</a> <a href="#">마이페이지</a> <a
							href="#"> <i class="fa fa-shopping-cart" aria-hidden="true"></i>
							장바구니
						</a>
					</p>
				</div>
			</div>
			<div class="logo">
				<div>
					<a href="#"> <img src="" alt="로고"> 고객센터
					</a>
				</div>
			</div>
		</header>
		<section id="cs">
			<div class="notice">
				<nav>
					<div>
						<p>
							홈 <span>></span> CS
						</p>
					</div>
				</nav>
				<section class="list">
					<aside>
						<h2>공지사항</h2>
						<ul>
							<li class="on"><a href="#">전체</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">고객서비스</a></li>
							<li><a href="#">이벤트당첨</a></li>
						</ul>
					</aside>
					<article>
						<nav>
							<h1>전체 게시글</h1>
							<br>
							<h2>CS게시판</h2>
						</nav>
						<table>
							<tbody>
								<c:forEach items="${CSboardList }" var="CSboard">
									<tr
										onclick="location.href='CSboardInfo?csNumber=${CSboard.csNumber}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'">
										<td>${CSboard.csNumber }</td>
										<td>${CSboard.csTitle }</td>
										<td>${CSboard.csCate }</td>
										<td>${CSboard.csWriter }</td>
										<td><fmt:formatDate value="${CSboard.csDate }"
												pattern="yyyy년MM월dd일" /></td>
									</tr>
								</c:forEach>
								<div align="center">
									<button type="button" class="btnList"
										onclick="location.href='CSboardInsert'">게시글등록</button>
							</tbody>
						</table>
						<div class="search">
							<select name="searchType">
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"
									<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"
									<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}" />

							<button id="searchBtn" type="button">검색</button>
						</div>
						<div>
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="${pageContext.request.contextPath }/CSboard/CSboardList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a
										href="${pageContext.request.contextPath }/CSboard/CSboardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="${pageContext.request.contextPath }/CSboard/CSboardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</article>
				</section>
			</div>
		</section>
		<footer>
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">서비스이용약관</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">전자금융거래약관</a></li>
			</ul>
			<div>
				<p>
					<img src="" alt="푸터로고">
				</p>
				<p>
					<strong>HobbyGang</strong> <br> 예담 <br> 대표이사 : 신나리 <br>
					사업자등록번호 : 220-81-83676 사업자정보확인 <br> 통신판매업신고 : 강남 10630호 Fax :
					02-589-8842
				</p>
				<p>
					<strong>고객센터</strong> <br> Tel : 1234-5678 (평일 09:00 ~ 18:00)
					<br> 스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00) <br>
					경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층 <br> Fax : 051-123-4567 | Mail
					: nateok12@naver.com <br>
				</p>
			</div>
		</footer>
	</div>
	<script>
		$(function() {
			$('#searchBtn')
					.click(
							function() {
								self.location = "${pageContext.request.contextPath }/CSboard/CSboardList"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
		});
	</script>

</body>
</html>