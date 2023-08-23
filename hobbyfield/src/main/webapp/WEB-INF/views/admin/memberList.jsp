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
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">회원 조회</h1>
           </div>
         </div>
		 <div>
				<table>
					<thead>
						<tr>
							<th align="center" width="150">이메일</th>
							<th align="center" width="150">이름</th>
							<th align="center" width="150">회원분류</th>
							<th align="center" width="150">최근 접속일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="mem">
							<tr onclick="location.href='memberInfo?memberEmail=${mem.memberEmail}'">
								<td>${mem.memberEmail}</td>
								<td>${mem.memberNm}</td>
								<td>${mem.memberGrd}</td>
								<td>
									<fmt:formatDate value="${mem.memberLtstconn}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
       </div>
     </section>
</body>
</html>