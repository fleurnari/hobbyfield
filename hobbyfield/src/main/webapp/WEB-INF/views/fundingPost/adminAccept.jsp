<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수락 페이지</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}

.item {
  width: 30%; 
  margin-bottom: 10px; 
}
#img{
	width: 333px;
	height: 333px;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}
.popup-wrap {
	background-color: rgba(0, 0, 0, 0.5);
	/* 배경색과 투명도로 살짝 어둡지만 투명한 배경
  허공에 붕 떠있는 느낌을 주고 싶으면 안넣어도 무방 */
	justify-content: center; /* 수평 중앙정렬 */
	align-items: center; /* 수직 중앙정렬 */
	position: fixed; /* 포지션 픽스, 화면이 스크롤되더라도 고정되기 위함 */
	top: 0;
	left: 0;
	right: 0;
	bottom: 0; /* 모든 방향에 0을 주면 화면에 꽉차게 됩니다. */
	display: none;
	/* 이벤트가 발생할 때 띄우기 위해 숨김
  처음부터 보이게 하는 상황이라면 display:flex; */
	padding: 15px;
	/* 반응형의 경우 padding이 없으면 박스가 화면에 붙어서 안이뻐짐 */
	z-index: 1;
}

.popup {
	width: 100%; /* 반응형 이기 때문에 가로값은 100% */
	max-width: 400px; /* 팝업의 최대 크기지정 */
	border-radius: 10px; /* 둥글둥글한 디자인을 위해 각을 없앱니다. */
	overflow: hidden; /* 각을 없앴을 때 내부 영역이 튀어나오는걸 방지 */
	background-color: #264db5; /* 배경색 */
	/* 팝업이 허공에 떠있는 듯한 느낌을 주기 위한 그림자 효과. */
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, 0.5);
}

.popup-head {
	width: 100%;
	/* 부모요소를 따라가기 때문에 굳이 가로값을 주지 않아도 되지만 일부 ie에서 인식 못하는 문제가 있음 */
	height: 50px; /* 헤드 영역 높이 */
	display: flex; /* 로고 이미지나 텍스트를 중앙 정렬하기 위한 flex 및 정렬 */
	align-items: center;
	justify-content: center;
}

.popup-body {
	width: 100%;
	background-color: #ffffff; /* 컨텐츠 영역의 배경색 */
}

.body-content { /* 몸통 내부 컨텐츠 영역 */
	width: 100%;
	padding: 30px; /* 좌우에 내용이 붙으면 보기 안좋기 때문에 간격 띄움 */
}

.body-titlebox { /* 컨텐츠 타이틀 영역 */
	text-align: center; /* 제목 중앙정렬 */
	width: 100%;
	height: 40px;
	margin-bottom: 10px; /* 내용과 간격 조정 */
}

.body-contentbox { /* 컨텐츠 내용 영역 */
	word-break: break-word; /* 단어가 짤리지 않음 */
	overflow-y: auto; /* 내부요소가 지정한 세로 값보다 클 경우 스크롤 생성 */
	min-height: 100px; /* 최소 높이 */
	max-height: 200px; /* 최대 높이 */
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn { /* 각각의 버튼  */
	display: inline-flex;
	/* 한줄로 나열하기 위한 inline속성과 flex속성 혼합 */
	width: 100%; /* 2개 버튼 각각 50% 영역 */
	height: 100%; /* 50px */
	justify-content: center; /* 수평정렬 */
	align-items: center; /* 수직정렬 */
	float: left; /* 좌측배치 */
	color: #ffffff; /* 글자색 */
	cursor: pointer; /* 마우스 포인터 효과 */
}

.product-option {
	display: flex;
	justify-content: space-around;
}

.option-box {
	width: 600px; /* 옵션창을 더 길게 만들기 */
	margin: 10px; /* 간격을 주기 위한 margin 추가 */
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 10px; /* 모서리 둥글게 설정 */
}

.option-box:hover {
	background-color: #f0f0f0;
}

.option-name {
	font-weight: bold;
	margin-top: 10px;
}

.option-description, .option-details {
	display: none;
	margin-top: 10px; /* 조금 더 큰 간격 */
}

.option-box.active .option-description, .option-box.active .option-details
	{
	display: block;
}

.quantity {
	margin-top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.decrement, .increment {
	padding: 5px 10px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px; /* 모서리 둥글게 설정 */
}

.decrement {
	margin-right: 5px; /* 간격 추가 */
}

.quantity-value {
	margin: 0 10px;
}

.confirm-button {
	margin-top: 10px;
	width: 500px;
	padding: 5px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 5px; /* 모서리 둥글게 설정 */
}

.confirm-button:hover {
	background-color: #0056b3;
	transform: scale(1); /* 마우스 오버 시 크기 변화 없애기 */
}

</style>
</head>
<body>
	<div class="container">
			<div class="text-center">
			<h4>
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
            </div>
                          <div class="dropdown">
                <span>
                <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                </button>
                <ul class="dropdown-menu" aria-labelledby="categoryDropdown">
                    <c:forEach items="${category}" var="type">
                        <li>
                            <a class="dropdown-item" href="#" data-type-code="${type.literal}">${type.literal}</a>
                        </li>
                    </c:forEach>
                </ul>
                </span>
              <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
              <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/notice/noticeList?noticeCate=AA3'">공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'">후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'">프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'">프로젝트 승인</span>
                </c:if>
            </h4>
            </div>
        </div>
        <div>
        </div>
        <br>
        <br>
<form name="fundingAdminUpdate" action="fundingAdminUpdate" method="post">
    <div class="text-center">
    	<table class="table table-condensed">
    		<thead>
    			<tr class="active">
    				<th>카테고리</th>
    				<th>프로젝트 제목</th>
    				<th>판매자 ID</th>
    				<th>프로젝트 등록일</th>
    				<th>프로젝트 시작일 </th>
    				<th>프로젝트 종료일</th>
    				<th>프로젝트 목표금액</th>
    				<th>프로젝트 상태</th>
    				<th>심사 승인</th> 
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${fundingPostList }" var="fundingPost">
    				
    					<tr>
    						<td>${fundingPost.fndCategory }</td>
    						<td>${fundingPost.fndTitle }</td>
    						<td>${fundingPost.memberEmail }</td>
    						<td>${fundingPost.fndWdate }</td>
    						<td>${fundingPost.fndStartDate }</td>
    						<td>${fundingPost.fndEndDate }</td>
    						<td>${fundingPost.fndTargetAmount }</td>
    						<td>
    							<c:choose>
        							<c:when test="${fundingPost.fndStatus eq '0'}">
            							임시저장
        							</c:when>
        							<c:when test="${fundingPost.fndStatus eq '1'}">
            							심사대기
        							</c:when>
        							<c:otherwise>
            							${fundingPost.fndStatus}
        							</c:otherwise>
    							</c:choose>
    						</td>
    						<td>
    							<input type="hidden" value="${fundingPost.fndPostNumber }">
    							<button type="button" class="btn btn-primary modal-open" data-modal-id="modal-${fundingPost.fndPostNumber}">심사하기</button>
									<div class="popup-wrap modal-wrap" id="modal-${fundingPost.fndPostNumber}">
    	<div class="popup">
        	<div class="popup-head">
            	<span class="head-title"></span>
        	</div>
        	<div class="popup-body">
            	<div class="body-content">
                	<div class="body-titlebox">
                    	<p>심사하기</p>
                	</div>
                		<hr>
                	<div class="body-contentbox">
                    	<br>
                    	<div>
                        	<span>
                            	<button type="button" class="btn btn-primary btn-approve" data-modal-id="modal-${fundingPost.fndPostNumber}">승인</button>
                        	</span>&nbsp;
                        	<span>
                            	<button type="button" class="btn btn-danger btn-reject" data-modal-id="modal-${fundingPost.fndPostNumber}">반려</button>
                        	</span>
                    	</div>
                	</div>
            	</div>
        	</div>
        	<div class="popup-foot">
           		<!-- <span class="pop-btn confirm" id="confirm">확인</span>  -->
            	<span class="pop-btn close modal-close" data-modal-id="modal-${fundingPost.fndPostNumber}">창 닫기</span>
        	</div>
        </div>
     </div>
							</td>
						</tr>
    
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
</form>
<section>
    		<div class="container">
				<div class="search">
						</div>
						<div>
							<ul >
								<c:if test="${pageMaker.prev}">
				    			<li><a href="adminAccept${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				   				 </c:if> 
				
				    			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    			<li><a href="adminAccept${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    				</c:forEach>
				
				    			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    			<li><a href="adminAccept${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    			</c:if> 
									</ul>
						</div>
		
			</div>

 </Section>
 <script>
		$(function() {
			$('#searchBtn')
					.click(
							function() {
								self.location = "${pageContext.request.contextPath }/fundingPostList"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
		});
		// 모달 열기
		$(".modal-open").click(function() {
		    var modalId = $(this).data("modal-id");
		    $("#" + modalId).css('display', 'flex').hide().fadeIn();
		});

		// 모달 닫기
		$(".modal-close").click(function() {
		    var modalId = $(this).data("modal-id");
		    $("#" + modalId).fadeOut();
		});
		
		
		$(document).ready(function () {
	        // 심사 승인 버튼 클릭 시
	        $('.btn-approve').click(function () {
	            var modalId = $(this).data('modal-id');
	            var fndPostNumber = modalId.split('-')[1]; // 모달의 ID에서 fndPostNumber 추출
	            var fndStatus = 2;
	            
	            // Ajax 요청을 이용하여 승인 처리
	            $.ajax({
	                url: 'fundingAdminUpdate', // 실제 승인 처리를 수행할 URL로 변경해야 합니다.
	                type: 'POST',
	                data: { fndPostNumber: fndPostNumber, fndStatus: fndStatus },
	                success: function (response) {
	                    // 성공 시 처리
	                	Swal.fire({
	                		title: '승인성공!', // 제목 추가
	                        text: 'success' // 텍스트 추가
	                        }).then(function () {
	                        // 모달 창 닫기
	                        $("#" + modalId).fadeOut();

	                        // 페이지 새로고침
	                        location.reload();
	                    });
	                },
	                error: function (error) {
	                    // 실패 시 처리
	                    alert('승인 실패');
	                }
	            });
	        });

	        // 심사 반려 버튼 클릭 시
	        $('.btn-reject').click(function () {
	            var modalId = $(this).data('modal-id');
	            var fndPostNumber = modalId.split('-')[1]; // 모달의 ID에서 fndPostNumber 추출
	            var fndStatus = 4;
	            // Ajax 요청을 이용하여 반려 처리
	            $.ajax({
	                url: 'fundingAdminUpdate', // 실제 반려 처리를 수행할 URL로 변경해야 합니다.
	                type: 'POST',
	                data: { fndPostNumber: fndPostNumber },
	                success: function (response) {
	                    // 성공 시 처리
	                	let message = '반려 완료';
	                    alert(message);
	                 // 모달 창 닫기
	                    $("#" + modalId).fadeOut();

	                    // 페이지 새로고침
	                    location.reload();
	                },
	                error: function (error) {
	                    // 실패 시 처리
	                    alert('반려 실패');
	                }
	            });
	        });
	    });
	</script>
</body>
</html>