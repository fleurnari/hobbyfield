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
<section>
	<h2>신청한 인원 없으면 없다고 alert창 생성해야함</h2>
		<div align="center">
			<div>
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
	</section>
<script type="text/javascript">
	//수락 거절 버튼
	$(document).ready(function() {
	    $('.accept').click(function() {
	        var nickname = $(this).data('nickname');
	        var clubnumber = $(this).data('clubnumber');
	
	        $.post("${pageContext.request.contextPath}/club/acceptClubMember", { profileNickname: nickname, clubNumber: clubnumber }, function(data) {
	            if(data.success) {
	                alert("수락되었습니다.");
	                location.reload();
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