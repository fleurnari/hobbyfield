<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품 단건조회</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh;
	margin-top: 100px;
}

.jb-division-line {
	border-top: 1px solid #444444;
	margin: 30px;
}
</style>
</head>
<body>
	<div>
		<img alt="" src="">
	</div>
	
	
	
	<table>
	
	
	
	</table>
	<div class="container">
		<div class="row">
			<h3>${point.pointName}</h3>
			<p>=-------------------pointPrice---------------</p>
			<p>${point.pointContent}</p>
			<p>${point.pointItemType}</p>
			<p>${point.pointState}</p>
			<p>
			<p>
				판매종료일까지 <font class="time" style="font-weight: bold;" size=6>
					<jsp:useBean id="now" class="java.util.Date" /> <fmt:parseNumber
						value="${now.time / (1000*60*60*24)}" integerOnly="true"
						var="nowfmtTime" scope="request" /> <fmt:parseDate
						value="${point.pointEndterm}" pattern="yyyy-MM-dd"
						var="endPlanDate" /> <fmt:parseNumber
						value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true"
						var="endDate" /> <c:choose>
						<c:when test="${endDate - nowfmtTime >= 1}">
            				${endDate - nowfmtTime + 1}
           					<span>일 남음</span>
						</c:when>
						<c:otherwise>
							<div>
								<span id="d-day-hour">00</span> <span class="col">:</span> <span
									id="d-day-min">00</span> <span class="col">:</span> <span
									id="d-day-sec">00</span>
							</div>
						</c:otherwise>
					</c:choose>
				</font>
			</p>
			<p>${point.pointImgName}</p>
			<p>${point.pointImgPath}</p>
		</div>
	</div>
	<div class="jb-division-line"></div>
	<div>
		<p>${point.pointContent}</p>
	</div>
	
	<!-- 버튼 -->
	<div class="buttonGroup">
		<button type="submit" onclick="location.href='pointUpdate'">수정</button>
		<button type="button" id="" onclick="location.href='pointDelete?pointId=${point.pointId}'">삭제</button>
		<button type="button" onclick="location.href='pointList'">목록</button>
	</div>

	<script type="text/javascript">
	
	function remaindTime() {
		 
		let today = new Date();
		

		var now = new Date(); //현재시간을 구한다. 
		console.log(now);
		var open = Date.parse("${point.pointEndterm}");
		console.log(open);
		
		var nt = now.getTime(); // 현재의 시간만 가져온다
		
	  	
		if(nt<open){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.   
			sec = parseInt(open - nt) / 1000;
			hour = parseInt(sec/60/60);
			sec = (sec - (hour*60*60));
			min = parseInt(sec/60);
			sec = parseInt(sec-(min*60));
	  
	    if(hour<10){hour="0"+hour;}
	    if(min<10){min="0"+min;}
	    if(sec<10){sec="0"+sec;}
			$("#d-day-hour").html(hour);
			$("#d-day-min").html(min);
			$("#d-day-sec").html(sec);
	    }else{ //현재시간이 종료시간보다 크면
		    $("#d-day-hour").html('00');
		    $("#d-day-min").html('00');
		    $("#d-day-sec").html('00'); 	   
			
		   
	   }
	}
	 setInterval(remaindTime,1000); 
	
</script>
</body>
</html>
