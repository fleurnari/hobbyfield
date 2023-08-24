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
				<form method="post">
					<input type="hidden" id="memberEmail" name="memberEmail" value="${memberInfo.memberEmail}">
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tr>
							<th>이메일</th>
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
						<c:if test="${memberInfo.memberGrd eq 'A2' && memberInfo.memberComaccp ne 'AJ2'}">
							<tr>
								<th>기업 회원 승인 여부</th>
									<td>
										<select name="memberComaccp">
												<c:forEach items="${AJ}" var="type">
													<option value="${type.subcode}">${type.literal}</option>
												</c:forEach>
										</select>
									</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${memberInfo.memberGrd eq 'A2' && memberInfo.memberComaccp ne 'AJ2'}">
						<button type="button" id="memUpdate" name="memUpdate">승인 여부 수정</button>
					</c:if>
					<c:if test="${memberInfo.memberGrd ne 'A3'}">
						<button type="button" id="memDelete" name="memDelete">강제 탈퇴</button>
					</c:if>
					<c:choose>
						<c:when test="${memberInfo.memberComaccp eq null || memberInfo.memberComaccp eq 'AJ2'}">
							<button id="memberList" type="button">목록으로</button>
						</c:when>
						<c:otherwise>
							<button id="comMemList" type="button">목록으로</button>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
       </div>
    </section>
    <script>
	  	$('#memUpdate').on('click', function(e){
	  		
	  		let objData = serializeObject();
	  		
	  		$.ajax({
	  			url : 'updateComMember',
	  			method : 'POST',
	  			data : objData
	  		})
	  		.done(data => {
	  			if (data){
	  				alert("기업 회원 승인 여부 처리를 완료 했습니다.");
	  				$('form').submit;
	  			} else {
	  				alert("기업 회원 승인 여부 처리에 실패 했습니다.");
	  				return;
	  			}
	  		})
	  		.fail(reject => console.log(reject));
	  		
	  		return false;
	  	});
	  	
	  	$('#memDelete').on('click', function(e){
	  		
	  		let objData = serializeObject();
	  		
	  		$.ajax({
	  			url : 'forcedDeleteMember',
	  			method : 'POST',
	  			data : objData
	  		})
	  		.done(data => {
	  			if (data){
	  				alert("강제 탈퇴 처리를 완료 했습니다.");
	  				$('form').submit;
	  			} else {
	  				alert("강제 탈퇴 처리에 실패 했습니다.");
	  				return;
	  			}
	  		})
	  		.fail(reject => console.log(reject));
	  		
	  		return false;
	  	});
	  	
		function serializeObject(){
			let formData = $('form').serializeArray();
			
			let formObject = {};
			$.each(formData, function(idx, obj){
				let field = obj.name;
				let val = obj.value;
				
				formObject[field] = val;
			});
			
			return formObject;
		}
		
		$("#memberList").on("click", function(){

			location.href = "${pageContext.request.contextPath}/admin/memberList?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
		$("#comMemList").on("click", function(){

			location.href = "${pageContext.request.contextPath}/admin/comMemberList?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})			

			
   </script>
</body>
</html>