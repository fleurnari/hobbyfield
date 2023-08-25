<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${pageContext.request.contextPath}/resources/css/theme.css" rel="stylesheet">
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/"/><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FIELD</span></span></a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/clubList">소모임</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/fundingPostList">펀딩</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath }/CSboard/CSboardList">쇼핑몰</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/pointList">포인트샵</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/talentMain">재능기부</a></li>
            </ul>
            	<c:if test = "${member == null}">
            		<div class="ms-lg-5"><a class="btn btn-primary" href="${pageContext.request.contextPath}/member/login">로그인</a></div>
          		</c:if>
          		<c:if test = "${member != null}">
          			 <div>
						<span>${member.memberNm} 님 환영합니다.</span>
						<span>활동 포인트 : ${member.memberActpnt} </span>
						<span>최근 접속일 : <fmt:formatDate value="${member.memberLtstconn}" pattern="yyyy-MM-dd" /></span>
						<a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a>
						<c:if test="${member.memberGrd eq 'A3'}">
							<a href="${pageContext.request.contextPath}/admin/adminPage">관리자 페이지</a>
						</c:if>
						<form action="${pageContext.request.contextPath}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-primary">로그아웃</button>
						</form>
                    </div>
          		</c:if>
          </div>
        </div>
      </nav>