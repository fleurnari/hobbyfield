<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>전체 리스트 조회</title>

<style>
.container2 {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.item {
	width: 30%;
	margin-bottom: 10px;
}

#img {
	width: 333px;
	height: 333px;
}
</style>

</head>
<body>
	<Section>
		<!-- 임시 카테고리 -->
		<div class="container">
			<a class="navbar-brand d-inline-flex"
				href="${pageContext.request.contextPath}/fundingPostList"><span
				class="fs-2 fw-bold text-primary ms-2">HOBBY<span
					class="text-warning">FUNDING</span></span></a>
			<nav class="nav nav-underline">
				<a class="nav-link fw-bold" href="#">카테고리</a> <a
					class="nav-link fw-bold" href="#">인기</a> <a
					class="nav-link fw-bold" href="#">마감임박</a> <a
					class="nav-link fw-bold" href="#">공지사항</a> <a
					class="nav-link fw-bold" href="#">후원현황</a> <a
					class="nav-link fw-bold"
					href="${pageContext.request.contextPath}/fundingPostInsertForm">프로젝트만들기</a>
				</li>
			</nav>
		</div>
	</Section>
	<!-- Blog preview section-->
	<section class="py-5">
		<div class="container px-5">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Portfolio</h2>
				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit
					amet consectetur.</h3>
				<br>
			</div>
			<div class="row gx-5">
				<c:forEach items="${fundingPostList }" var="fundingPost">
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0"
							onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'">
							<img class="card-img-top"
								src="resources/images/${fundingPost.fndMainImg }" alt="..." />
							<div class="card-body p-4">
								
								

								
									<div class="h5 card-title mb-3">${fundingPost.fndTitle }
									<a class="badge bg-danger top-0 end-0">

									<jsp:useBean id="now" class="java.util.Date" />
									<!-- number타입으로 변경(계산을 위해) -->
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
										integerOnly="true" var="nowfmtTime" scope="request" />
									<!-- DATE로 가져와서 NUMBER로 변환 -->
									<fmt:parseDate value="${today}" pattern="yyyy-MM-dd"
										var="strPlanDate" />
									<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}"
										integerOnly="true" var="strDate" />
									<fmt:parseDate value="${fundingPost.fndEndDate}"
										pattern="yyyy-MM-dd" var="endPlanDate" />
									<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}"
										integerOnly="true" var="endDate" />
									<!-- 남은시간에 따라 일자로 계산될지, 오늘 마감으로 처리할지 등으로 -->
									<c:choose>
										<c:when test="${endDate - nowfmtTime >= 1}">
            									${endDate - nowfmtTime + 1}
           										<span>일 남음</span>
										</c:when>
										<c:when test="${endDate - nowfmtTime == 0}">
											<span>오늘 마감</span>
										</c:when>
										<c:otherwise>
											<span>마감</span>
										</c:otherwise>
									</c:choose>
								</a>
									
									</div>
								<p class="card-text mb-0">
								
									<span>${fundingPost.fndStatus}</span>
								</p>
								<p>
									<span>${fundingPost.fndCurrentAmount }</span>
								</p>

							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-3"
											src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
										<div class="small">
											<div class="fw-bold">${fundingPost.memberEmail }</div>
											<div class="text-muted">March 12, 2023 &middot; 6 min
												read</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

=======
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트 조회</title>
<style>
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}

.item {
  width: 30%; 
  margin-bottom: 10px; 
}
#img{
	width: 333px;
	height: 333px;
}

</style>

</head>
<body>
	<Section>
	<!-- 임시 카테고리 -->
	<div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/fundingPostList"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></a>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">카테고리</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">인기</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">마감임박</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">공지사항</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="#">후원현황</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/fundingPostInsertForm">프로젝트만들기</a></li>
            </ul>
        </div>
	</Section>
	<Section>
	<div class="container">
		<div class="container2">
			<c:forEach items="${fundingPostList }" var="fundingPost">
			<div onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'">
					<figure>
						<img id="img" src="resources/images/${fundingPost.fndMainImg }" alt="">
					</figure>
				<p>
					<span>${fundingPost.fndCategory }</span>
				</p>
				<p>
					<span><h3>프로젝트 이름</h3></span>
					<span>${fundingPost.fndTitle }</span>
				</p>
				<br />
				<p>
					<span>${fundingPost.fndStatus}</span>
				</p>
				<p>
					<span>000%</span>
				</p>
				<p>
					<span>${fundingPost.fndCurrentAmount }</span>
				</p>
				<p>
					<span>펀딩 마감까지 남은 시간</span>
					<span class="time">
					<!-- 지금시간 가져오기 -->
						<jsp:useBean id="now" class="java.util.Date" />
					<!-- number타입으로 변경(계산을 위해) -->
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					<!-- DATE로 가져와서 NUMBER로 변환 -->
    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    					<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
    					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
					<!-- 남은시간에 따라 일자로 계산될지, 오늘 마감으로 처리할지 등으로 -->
    					<c:choose>
        					<c:when test="${endDate - nowfmtTime >= 1}">
            					${endDate - nowfmtTime + 1}
           						<span>일 남음</span>
        					</c:when>
        					<c:when test="${endDate - nowfmtTime == 0}">
                         		<span>오늘 마감</span>
        					</c:when>
        					<c:otherwise>
            					<span>마감</span>
        					</c:otherwise>
    					</c:choose>
					</span>
				</p>
			</div>
			</c:forEach>
		</div>
	</div>
	</Section>
>>>>>>> branch 'master' of https://github.com/fleurnari/hobbyfield.git
</body>
</html>