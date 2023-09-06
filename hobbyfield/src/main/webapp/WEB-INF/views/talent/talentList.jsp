<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	margin-top: 150px;
}

table {
	border: solid 2px;
}

</style>
<meta charset="UTF-8">
<title>재능기부 카테고리내 전체조회</title>
</head>
<body>
	<!--  재능기부 지원폼과 카테고리 내 전체조회	 -->
	
	<h3 class="talent">${talent.tlntCate}</h3>
	
	<div class="talent-button">
	<button type="button" onclick="openModal()">재능기부하기</button>
	</div>
	
	<form action="talentInsert" class="talentInsert" method="post">
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeModalBtn">&times;</span>
		</div>
		<div class="form-group">
			<label for="talentCate">카테고리</label>
			<select class="form-contol" id="tlntCate" name="tlntCate">
				<option disabled selected>재능기부 카테고리</option>
				<option id="Y1" value="가족">가족</option>
				<option id="Y2" value="스터디">스터디</option>
				<option id="Y3" value="취미(동호회)">취미(동호회)</option>
				<option id="Y4" value="운동">운동</option>
				<option id="Y5" value="학교">학교</option>
				<option id="Y6" value="팬밴드">팬밴드</option>
				<option id="Y7" value="회사">회사</option>
			</select>   
			<div>
				<h6>제목</h6>
				<input type="text" id="tlntTitle" name="tlntTitle"
					required="required" placeholder="재능기부 제목을 입력하세요.">
			</div>
			<div>
				<h6>내용</h6>
				<textarea id="tlntContent" name="tlntContent" required="required"
					rows="100" cols="100" placeholder="내용을 입력하세요."></textarea>
				
			</div>
			<div>
				<h6>신청기간</h6>
				<p>재능기부 신청시작일</p>
				<input type="date">
				<p>재능기부 신청마감일</p>
				<input type="date">
			</div>
			<div>
				<h6>모집정원</h6>
				<input type="number" value="모집정원">
			</div>
			<div class="buttonGroup">
				<button type="submit">등록</button>
				<button type="button" onclick="location.href='talentMain'">목록</button>
				<button type="reset" onclick="location.href='talentInsert'">초기화</button>
			</div>
		</div>
	</div>
	</form>
	
	
	
	
	
	
	
		<table>
		<thead>
			<tr>
				<th>재능기부 번호</th>
				<th>재능기부 카테고리</th>
				<th>작성자</th>

				<th>작성일</th>
				<th>조회수</th>
				<th>제목</th>

				<th>내용</th>
				<th>재능기부 시작일자</th>
				<th>재능기부 종료일자</th>
				<th>모집정원</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach var="talent" items="${talentList }">
				<tr>
					<td>${talent.tlntId }</td>
					<td>${talent.tlntCate }</td>
					<td>${talent.tlntWriter }</td>

					<td>${talent.tlntWdate }</td>
					<td>${talent.tlntView }</td>
					<td>${talent.tlntTitle }</td>

					<td>${talent.tlntContent }</td>
					<td>${talent.tlntStartday }</td>
					<td>${talent.tlntEndday }</td>
					<td>${talent.tlntCap }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


<script type="text/javascript">








// 재능기부등록 모달
// 구매 버튼 클릭 시 모달 열기와 purchaseBtn 함수 실행
document.getElementById("purchase").addEventListener("click", function () {
    openModal(); // 모달 열기 함수 호출
});

// 모달 열기 함수
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

// 모달 닫기 함수
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

// 모달 닫기 버튼 클릭 시 모달 닫기
document.querySelector(".close").addEventListener("click", closeModal);

// 모달 외부 클릭 시 모달 닫기
window.onclick = function (event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
};








</script>

</body>
</html>