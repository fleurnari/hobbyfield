<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트 조회</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>프로젝트 이름</th>
				<th>프로젝트 시작 날짜</th>
				<th>프로젝트 종료 날짜</th>
				<th>프로젝트 상태</th>
				
				<th>펀딩 목표금액</th>
				<th>펀딩 현재금액</th>
				<th>조회수</th>
				<th class="time-title">펀딩 마감까지 남은 시간</th>
			
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${fundingPostList }" var="fundingPost">
				<tr>
					<td>${fundingPost.fndTitle }</td>
					<fmt:parseDate value="${fundingPost.fndStartDate}" type="DATE" pattern="yyyy-MM-dd" var="currentDate" />
					<td><fmt:formatDate value="${currentDate}"  pattern="yyyy년MM월dd일"/></td>
					<fmt:parseDate value="${fundingPost.fndEndDate}" type="DATE" pattern="yyyy-MM-dd" var="endPlanDate"/>
                    <td><fmt:formatDate value="${endPlanDate}"  pattern="yyyy년MM월dd일"/></td>
					<td>${fundingPost.fndStatus }</td>
					<td>${fundingPost.fndTargetAmount }</td>
					<td>${fundingPost.fndCurrentAmount }</td>
					<td>${fundingPost.fndViews }</td>
				<td class="time">
					
					<jsp:useBean id="now" class="java.util.Date" />
					
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					
					
    				<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    				<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    				<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
    				<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
    


    				<c:choose>
        				<c:when test="${endDate - nowfmtTime >= 0}">
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
				</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>


</body>
</html>