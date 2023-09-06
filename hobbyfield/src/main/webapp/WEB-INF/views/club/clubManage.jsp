<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<div align="center" style="margin-top: 100px;">

	<h2>소모임 설정</h2>
	<!-- 소모임 정보 및 관리(모임장만) -->
	<div id="clubInfo">
		<div><p>모임소개 : ${club.clubInfo}</p></div>
		<div><p>카테고리 : ${club.clubCategory}</p></div>
		<div><p>모임장 : ${club.profileNickname}</p></div>
		<div>모임장 프로필 
		<img src="${pageContext.request.contextPath}/${club.profileImgPath}${club.profileImg}">
		</div>
		<div><p>모임유형 : ${club.clubType}</p></div>
		<div><p>모임지역 : ${club.majorLocation}</p></div>
		<div></div>
		<!-- 톱니바퀴 모양 -->
		<c:if test="${club.profileNickname eq profile.profileNickname}">
			<div id="clubUpdate">
					<p>소모임 정보 수정</p>
			</div>
		</c:if>
		<!-- 소모임 탈퇴 버튼 -->
		<div id="clubQuit">
			<p>소모임 탈퇴</p>
			<div id="quitBtn">탈퇴</div>
		</div>
	</div>
	
	<!-- 가입신청리스트(모임장만) modal창으로 확인 -->
		<div id="applyModal">
				<div class="apply-content">
					<table>
						<thead align="center">
							<tr>
								<th>닉네임 </th>
								<th>가입신청일자</th>
								<th>질문답변 1</th>
								<th>질문답변 2</th>
								<th>질문답변 3</th>
								<th>승인처리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${beforeMembers}" var="members">
								<tr>
									<td>${members.profileNickname }</td>
									<td>${members.applyDate }</td>
									<td>${members.applyAnswer1 }</td>
									<td>${members.applyAnswer2 }</td>
									<td>${members.applyAnswer3 }</td>
									<td>
							    	<button type="button" class="accept" data-nickname="${members.profileNickname}" 
							    	data-clubnumber="${members.clubNumber}">수락</button>
							    	<button type="button" class="reject" data-nickname="${members.profileNickname}" 
							    	data-clubnumber="${members.clubNumber}">거절</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>	
					</table>
				</div>
		</div>	

	
	
	

		
	
		
	
</div>	

	
	

	
<script type="text/javascript">
	//수락 거절 버튼
	$(document).ready(function() {
	    $('.accept').click(function() {
	        var nickname = $(this).data('nickname');
	        var clubnumber = $(this).data('clubnumber');
			
	        $.post("${pageContext.request.contextPath}/club/acceptClubMember", 
	        		{ profileNickname: nickname, clubNumber: clubnumber }, 
	        		function(data) {
	            if(data.success) {
	                alert("수락되었습니다.");
	                
	                
	            } else {
	                alert("오류 발생");
	            }
	        });
	    });
	
	    
	    $('.reject').click(function() {
	        var nickname = $(this).data('nickname');
	        var clubnumber = $(this).data('clubnumber');
	
	        $.post("${pageContext.request.contextPath}/club/rejectClubMember", { profileNickname: nickname, clubNumber: clubnumber }, function(data) {
	            if(data.success) {
	                alert("거절되었습니다.");
	                location.reload();
	            } else {
	                alert("오류 발생");
	            }
	        });
	    });
	});	
</script>	
	
</body>
</html>