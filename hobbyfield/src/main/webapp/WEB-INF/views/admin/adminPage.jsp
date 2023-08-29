<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">관리자 페이지</h1>
            </div>
         </div>
			<div>
				<div class="ms-lg-5">
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/memberList">전체 회원 조회</a>
				</div>
				<div class="ms-lg-5">
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/comMemberList">기업 회원 승인</a>
				</div>
        	</div>
       </div>
     </section>
</body>
</html>