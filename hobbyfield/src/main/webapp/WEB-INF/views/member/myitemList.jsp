<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>나의 아이템 구매현황</title>
<style>
/* Reset some default margin and padding */
body, h1 {
	margin: 0;
	padding: 0;
}

/* Add some spacing and background color to the section */
.bg-100 {
	background-color: #f5f5f5;
	padding: 30px 0;
}

/* Center align the h1 */
.text-center {
	text-align: center;
}

/* Add some spacing and border to the table */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
	border: 1px solid #ddd;
}

/* Add some padding and border to table cells */
th, td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

/* Style the header cells */
th {
	background-color: #f2f2f2;
}

/* Style alternating rows with different background colors */
tr:nth-child(even) {
	background-color: #f2f2f2;
}

/* Add pointer cursor on hover for clickable rows */
tr:hover {
	cursor: pointer;
}

/* Style the images */
td img {
	width: 100px;
	height: 100px;
}

/* 박스 스타일 */
#box {
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

#box>div {
	margin-right: 20px;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 모달 내부 스타일 */
.modal-content h5 {
    font-size: 20px;
    margin-bottom: 20px;
}

.modal-content select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
    width: 100%;
}

.modal-content button {
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 5px 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.modal-content button:hover {
    background-color: #0056b3;
}

/* 이미지 스타일 */
.modal-content img {
    max-width: 100px;
    max-height: 100px;
}

</style>

</head>
<body>
	<section class="bg-100 py-7" id="packages">
		<div class="container-lg">
			<div class="row justify-content-center">
				<div class="col-12">
					<h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">나의 아이템</h1>
				</div>
			</div>
			<div id="box">
				<div>
					<jsp:include page="myPageMenu.jsp"></jsp:include>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<th align="center" width="150">이미지</th>
								<th align="center" width="150">아이템 이름</th>
								<th align="center" width="150">아이템 유형</th>
								<th align="center" width="150">구매 일자</th>
								<th align="center" width="150">사용 기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myitemList}" var="myitem">
								<tr>
									<td><img
										src="${pageContext.request.contextPath}${myitem.pointImgPath}${myitem.pointImgName}"></td>
									<td>${myitem.pointName}</td>
									<td>${myitem.pointItemTypeNm}</td>
									<td><fmt:formatDate value="${myitem.myitemPurcdt}"
											pattern="yyyy-MM-dd" /></td>
									<td>
										<c:choose>
											<c:when test="${myitem.pointItemType eq 'W1' and myitem.myitemUseterm ne 0}">${myitem.myitemUseterm}일권</c:when>
											<c:when test="${myitem.pointItemType eq 'W1' and myitem.myitemUseterm eq 0}">영구	</c:when>
											<c:when	test="${myitem.pointItemType eq 'W2' and myitem.myitemUseterm eq 1}"><a onclick="openModal(${myitem.myitemId})">사용가능</a></c:when>
											<c:when	test="${myitem.pointItemType eq 'W2' and myitem.myitemUseterm eq 0}">사용완료</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 모달창 -->
<div id="myModal" class="modal">
    <div class="modal-content"><span class="close" id="closeModalBtn">&times;</span>
        <div>
            <h5>가입한 소모임</h5><br>
            <select name="clubNumber">
                <option value="" disabled selected>소모임 선택</option>
                <c:forEach items="${myClubList}" var="myClub">
								<c:if test="${myClub.clubTotal eq 50}">
									<option value="${myClub.clubNumber}">${myClub.clubName}</option>
								</c:if>
							</c:forEach>
            </select>
            <div>
                <input type="hidden" name="myitemId" id="myitemId">
                <button type="button" name="applyBtn" id="applyBtn">적용</button>
            </div>
        </div>
    </div>
</div>

		</div>
	</section>
	<script type="text/javascript">
	    // 모달 열기
	    function openModal(myitemId) {
	    	$('#myitemId').val(myitemId)
	        var modal = document.getElementById("myModal");
	        modal.style.display = "block";
	    }
	
	    // 모달 닫기
	    function closeModal() {
	        var modal = document.getElementById("myModal");
	        modal.style.display = "none";
	    }
	
	    // 모달 닫기 버튼 클릭 시 모달 닫기
	    document.getElementById("closeModalBtn").addEventListener("click", closeModal);
	
	    // 모달 외부 클릭 시 모달 닫기
	    window.onclick = function (event) {
	        var modal = document.getElementById("myModal");
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    };
	    
	    // 모달 적용버튼 클릭시 소모임 인원제한 풀림
	    var applyBtn = document.getElementById("applyBtn");
	    applyBtn.addEventListener("click", function(e){
	    	var selectClubNumber = document.querySelector('[name="clubNumber"]');
		     var selectItemId = document.querySelector('#myitemId')
		    $.ajax({
		    	url : 'myitemList',
		    	method : 'POST',
		    	 data : {clubNumber: selectClubNumber.value, myitemId: selectItemId.value}
		    })
		    .done(data => {
		    	if(data){
		    		Swal.fire(
		    	            '소모임 증원권이 적용되었습니다.',
		    	            '',
		    	            'success');
		    	} else {
		    		 Swal.fire(
		    		            '소모임 증원권 적용에 실패했습니다.',
		    		            '',
		    		            'error'
		    		        );
		    	}

		    })
		    .fail(reject => console.log(reject));
		    return false;
		    });
	    
	    
	    
	</script>

</body>
</html>