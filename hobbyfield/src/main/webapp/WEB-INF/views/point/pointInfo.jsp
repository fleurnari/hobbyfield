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
	margin: 30px ;
}
</style>
</head>
<body>
	<main>
		<form method="post">
			<div class="product">

				<img src="resources/images/bikini bottom2.jpg" alt="bees">
				<div class="product-info">
					<p>2023-03-08 ~ 2023-03-22</p>
				</div>
			</div>
			<div>
				<input type="radio" name="chk_info" checked="checked">7일 이용권
				<!-- value -->
				<input type="radio" name="chk_info">14일 이용권 <input
					type="radio" name="chk_info">30일 이용권 <input type="radio"
					name="chk_info">영구 이용권
				<p>가용포인트 : ${pointInfo.memberActPnt }point</p>
			</div>
			<div class="btn-group">
				<button type="button" value="위시">위시</button>
				<button type="submit" value="구입">구입</button>
				<!-- 구매 팝업창 떠야함 -->
			</div>
		</form>
		<form>
			<div>
				<h4>판매 남은 기간</h4>
				<font class="time" style="font-weight: bold;" size=6> <jsp:useBean
						id="now" class="java.util.Date" /> <fmt:parseNumber
						value="${now.time / (1000*60*60*24)}" integerOnly="true"
						var="nowfmtTime" scope="request" /> <fmt:parseDate
						value="${pointInfo.pointEndTerm}" pattern="yyyy-MM-dd"
						var="endDate" /> <fmt:parseNumber
						value="${endDate.time / (1000*60*60*24)}" integerOnly="true"
						var="endDate" /> <c:choose>
						<c:when test="${endDate - nowfmtTime >= 1}">
            				${endDate - nowfmtTime + 1}
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
			</div>

		</form>
		<div class="jb-division-line"></div>
		<div>
				<h4>상세설명</h4>
		</div>
	</main>
</body>
</html>
