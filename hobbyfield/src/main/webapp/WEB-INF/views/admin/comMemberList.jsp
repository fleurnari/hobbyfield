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
             <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">기업 회원 승인</h1>
           </div>
         </div>
		 <div>
				<table>
					<thead>
						<tr>
							<th align="center" width="150">이메일</th>
							<th align="center" width="150">이름</th>
							<th align="center" width="150">회원분류</th>
							<th align="center" width="150">승인 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comMemberList}" var="comMem">
							<tr onclick="location.href='memberInfo?memberEmail=${comMem.memberEmail}'">
								<td>${comMem.memberEmail}</td>
								<td>${comMem.memberNm}</td>
								<td>${comMem.memberGrd}</td>
								<c:if test="${comMem.memberComaccp eq 'AJ1'}">
									<td>승인 대기</td>
								</c:if>
								<c:if test="${comMem.memberComaccp eq 'AJ3'}">
									<td>승인 거절</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
       </div>
     </section>
</body>
</html>