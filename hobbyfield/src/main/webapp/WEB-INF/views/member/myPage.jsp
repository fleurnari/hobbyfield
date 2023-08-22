<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <section class="bg-100 py-7" id="packages">
        <div class="container-lg">
          <div class="row justify-content-center">
            <div class="col-12">
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">마이페이지</h1>
            </div>
          </div>
			<div>
				<div>
				<div class="profile-info">
					<label for="memberEmail">아이디</label>
					${info.memberEmail}
				</div>
				<div class="profile-info">
					<label for="memberNm">이름</label>
					${info.memberNm}
				</div>
				<div class="profile-info">
					<label for="memberGrd">회원 분류 : </label>
					<c:if test="${info.memberGrd eq 'A1'}">
						<span>일반 회원</span>
					</c:if>
					<c:if test="${info.memberGrd eq 'A2'}">
						<span>기업 회원</span>
					</c:if>
					<c:if test="${info.memberGrd eq 'A3'}">
						<span>관리자</span>
					</c:if>
				</div>
				<div class="profile-info">
					<label for="memberActpnt">활동포인트</label>
					${info.memberActpnt}
				</div>
				<div class="profile-info">
					<label for="memberLtstconn">최근 접속일</label>
					<fmt:formatDate value="${member.memberLtstconn}" pattern="yyyy-MM-dd" />
				</div>				
				<div class="ms-lg-5"><a class="btn btn-primary" href="${pageContext.request.contextPath}/memberUpdate">회원 정보 수정</a></div>
				<div class="ms-lg-5"><a class="btn btn-primary" href="${pageContext.request.contextPath}/memberDelete">회원 탈퇴</a></div>
			</div>
        </div>
       </div>
      </section>
</body>
</html>