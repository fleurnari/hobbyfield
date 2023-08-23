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
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">회원 상세 조회</h1>
            </div>
         </div>
			<div align="center">
				<form>
					<table>
						<tr>
							<th>아이디</th>
								<td> ${memberInfo.memberEmail} </td>
						</tr>
						<tr>
							<th>이름</th>
								<td> ${memberInfo.memberNm} </td>
						</tr>
						<tr>
							<th>우편번호</th>
								<td> ${memberInfo.memberZip} </td>
						</tr>
						<tr>
							<th>기본주소</th>
								<td> ${memberInfo.memberBaseaddr} </td>
						</tr>
						<tr>
							<th>상세주소</th>
								<td> ${memberInfo.memberDetaaddr} </td>
						</tr>
						<c:if test="${memberInfo.memberGrd eq 'A2'}">
						<tr>
							<th>사업자번호</th>
								<td> ${memberInfo.memberBizno} </td>
						</tr>
						</c:if>
						<tr>
							<th>연락처</th>
								<td> ${memberInfo.memberCntinfo} </td>
						</tr>
						<tr>
							<th>회원 분류</th>
							<td>${memberInfo.memberGrd}</td>
						</tr>
						<tr>
							<th>활동 포인트</th>
								<td> ${memberInfo.memberActpnt} P</td>
						</tr>
						<tr>
							<th>신고 누적 횟수</th>
								<td> ${memberInfo.memberRprtcnt} 회</td>
						</tr>				
						<tr>
							<th>최근 접속일</th>
								<td><fmt:formatDate value="${memberInfo.memberLtstconn}" pattern="yyyy-MM-dd"/> </td>
						</tr>
						<c:if test="${memberInfo.memberGrd eq 'A2'}">
							<tr>
								<th>기업 회원 승인 여부</th>
									<td> ${memberInfo.memberComaccp} </td>
							</tr>
						</c:if>
					</table>
					<c:if test="${memberInfo.memberGrd eq 'A2' && memberInfo.memberComaccp ne 'AJ2'}">
						<button type="button" onclick="location.href='#'">승인 여부 수정</button>
					</c:if>
					<c:if test="${memberInfo.memberGrd ne 'A3'}">
						<button type="button" onclick="location.href='#'">강제 탈퇴</button>
					</c:if>
					<button type="button" onclick="location.href='#'">목록으로</button>
				</form>
			</div>
       </div>
    </section>
</body>
</html>