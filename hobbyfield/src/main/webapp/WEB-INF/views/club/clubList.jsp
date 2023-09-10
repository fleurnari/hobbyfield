<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>소모임 조회 메인 페이지</title>
<style>

/* 지역, 카테고리 정렬 */
.region-list, .category-list {
    padding: 1rem 0;
    display: flex;
    white-space: nowrap;
    overflow-x: auto;
    scrollbar-width: none;
}

.region-list::-webkit-scrollbar, .category-list::-webkit-scrollbar {
    display: none;
}

.region-item, .category-item {
    display: inline-block;
    padding-right: 1.2rem;
}

.btn-sm {
    padding: 0.25rem 0.5rem !important;
    font-size: 0.875rem !important;
    line-height: 1.5 !important;
    border-radius: 50px;
}

.center-container{
	align-content: center;
}

/* 카테고리를 화면 가운데에서 시작하게 만들기 */
.center-container {
    text-align: center; /* 가운데 정렬 */
}

.category-list {
    display: inline-block; /* inline-block으로 설정하여 가운데 정렬이 가능하게 만듭니다. */
}

.order {
	align-content : center;
    background-color: #f4f6fa;
    color: black;
    padding: 0.5rem 1rem;
    border-radius: 70px;
    margin-bottom: 5%;
    font-weight: bold;
    border-radius: 1 rem;
    max-width: 1100px;
    margin: 0 auto;
}

/* 정렬 메인 화면보다 작게  */
.order-container{
	max-width: 800px;  
    margin: 0 auto;    
    padding: 0 6px;
    position: relative;     
}


/* 화살표의 공통 스타일 */
.arrow-left, .arrow-right {
    content: '';
    display: block;
    width: 0;
    height: 0;
    position: absolute;
    top: 49%;
/*     top: calc(10% - 10px);  /* 화살표의 상단 위치를 조정 */  */
    transform: translateY(-8%);
    border-style: solid;
}

.arrow-left{
    left: 20px; /* 왼쪽 화살표를 왼쪽으로 추가 이동 */
    border-width: 10px 15px 10px 0;
    border-color: transparent #000 transparent transparent; 
}

.arrow-right{
    right: 20px; /* 오른쪽 화살표를 오른쪽으로 추가 이동 */
    border-width: 10px 0 10px 15px;
    border-color: transparent transparent transparent #000; 
}





/* 소모임 리스트 */
#clubContainer {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px; 
    margin-bottom: 30px;
    margin-top: 30px;
}

.clubItem {
    width: 23%;
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.2s, box-shadow 0.2s;
    cursor: pointer;
    position: relative;
}

.clubItem img {
    width: 100%;
    height: 220px; 
    object-fit: cover;
}

.clubItem:hover {
     transform: translateY(-10px); 
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
}

.clubInfo {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 10px;
    height: 150px; 
    background-color: #fff;
}

.clubInfo p {
    margin-bottom: 2px; 
    font-size: 14px;
}

.clubInfo p:nth-child(1) {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 10px;
}

.clubInfo p:nth-child(2) {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 90%; 
}

.rounded-info {
    background-color: #eee;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    margin-right: 5px;
    margin-bottom: : 10px;
    margin-top: 10px; 
    line-height: 1.2; 
}


/*모임생성, 프로필 생성 */
.top-buttons {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-bottom: 30px; /* 여백 추가 */
    margin-top: 30px;
}

.custom-button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    color: #fff;
    text-decoration: none;
    margin-left: 10px; /* 버튼 사이의 간격 */
    transition: background-color 0.2s;
    display: flex;
    align-items: center; /* 아이콘과 텍스트 중앙으로 정렬 */
}

.button-icon {
    margin-right: 10px; /* 아이콘 텍스트 사이의 간격 */
    font-size: 1.2em; 
}

.club-create .button-icon {
    content: "\002B"; /* 플러스 아이콘 */
}

.profile-create .button-icon {
    content: "\1F464"; /* 사람 아이콘 */
}

.btn-primary:hover {
    background-color: #28a745; /* 초록색 */
}

.title{
	font: bold;
}


/* 에디터 부분 */
.ck.ck-editor {
    width: 30%;
    max-width: 50px;
    margin: 0 auto;
}

.ck-editor__editable {
    height: 80vh;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}



</style>
</head>

<body>
<section>
    	<img src="${pageContext.request.contextPath}/resources/img/hobbyClub.png" width="1430px;" height="300px;" />
    	<div class="top-buttons">
    		<c:if test="${not empty profile.profileNickname}">
		    <a href="${pageContext.request.contextPath}/club/clubInsert" class="custom-button club-create btn btn-primary">
		        <span class="button-icon">&#43;</span> <!-- 플러스 아이콘 -->
		        소모임 생성
		    </a>
		    </c:if>
		    <a href="${pageContext.request.contextPath}/club/profileInsert" class="custom-button profile-create btn btn-primary">
		        <span class="button-icon">&#128100;</span> <!-- 사람 아이콘 -->
		        프로필 생성
		    </a>
		</div>
    
    	
    	<div class="order">
    		<div class="order-container" style="position: relative;">
		<!-- 지역 정렬 -->
			<div class="label" align="center">지역</div>
			<ul class="region-list">
			
					<li class="region-item">
						<button class="region-btn btn btn-sm btn-outline-primary" data-region-code="">전체지역</button>
					</li>
				<c:forEach items="${E}" var="region">
					<li class="region-item">
						<button class="region-btn btn btn-sm btn-outline-primary" data-region-code="${region.subcode}">${region.literal}</button>
					</li>
				</c:forEach>
			</ul>
		<div class="arrow-left"></div>
		<div class="arrow-right"></div>
		<!-- 모임 종류 정렬 -->
			<div class="center-container" style="position: relative;">
			<div class="label">모임종류</div>
				<ul class="category-list">
					<li class="category-item">
						<button class="category-btn btn btn-sm btn-outline-primary" data-type-code="">전체종류</button>
					</li>
					<c:forEach items="${C}" var="type">
						<li class="category-item">
							<button class="category-btn btn btn-sm btn-outline-primary" data-type-code="${type.subcode}">${type.literal}</button>
						</li>
					</c:forEach>
				</ul>
			</div>
		
		</div>
		</div>
		


			<!-- 소모임 표시 -->    
     <div id="clubContainer">
            <c:forEach items="${clubList}" var="club">
				<div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${club.clubNumber}'">
					<img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
					<div class="clubInfo">
						<p>${club.clubName}</p>
						<p>${fn:substring(club.clubInfo, 0, 100)}${club.clubInfo.length() > 100 ? '...' : ''}</p>
						<span class="rounded-info">${club.clubCategory}</span>
						<span class="rounded-info">${club.majorLocation} ${club.subLocation}</span>
					</div>
				</div>
			</c:forEach>
        </div>
</section>




<script type="text/javascript">

	var currentPage = 2;  // 현재 페이지 번호 초기화
	var pageSize = 12;    // 페이지 크기 초기화
	var isLoading = false; // 중복 요청을 확인

	

	//카테고리 종류 정렬
	//카테고리 버튼 클릭 이벤트 핸들러
	$('.region-btn, .category-btn' ).on('click', function() {
		let majorLocation = "";
		let clubCategory = "";
		if ( $(this).hasClass("region-btn") ) {			
			$('.region-list .region-btn').removeClass('active')
			$(this).addClass('active')
	    	majorLocation = $(this).data('region-code');
			clubCategory = $('.category-list .active').length>0  ? $('.category-list .active').data('type-code') : "";
		} else {
			$('.category-list .category-btn').removeClass('active')
			$(this).addClass('active')
	    	clubCategory = $(this).data('type-code');
			majorLocation = $('.region-list .active').length>0  ? $('.region-list .active').data('region-code') : "";
			
		}
	    // 서버에 지역 코드 전송
	    $.ajax({
	    	url: "${pageContext.request.contextPath}/club/getClubsByRegionAndCate",
	        type: 'GET',
	        data: { "majorLocation" : majorLocation, "clubCategory" : clubCategory },
	        dataType: 'json',
	        success: function(clubs) {
	        	 console.log("Received clubs:", clubs);
	            // #clubContainer 내용삭제
	            $('#clubContainer').empty();
	            
	            // 서버로부터 받은 소모임 리스트를 화면에 추가
	            $.each(clubs, function(index, club) {
	                //각 소모임의 정보를 표시하는 코드 
	                $('#clubContainer').append(`
	                		<div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=\${club.clubNumber}'">
	                        	<img src="${pageContext.request.contextPath}/\${club.clubImgPath}\${club.clubImg}">
	                        <div class="clubInfo">
	                        <p>${club.clubName}</p>
							<p>${fn:substring(club.clubInfo, 0, 100)}${club.clubInfo.length() > 100 ? '...' : ''}</p>
							<span class="rounded-info">${club.clubCategory}</span>
							<span class="rounded-info">${club.majorLocation} ${club.subLocation}</span>
	                        </div>
	                    </div>
	                `);
	            });
	            currentPage++;  // 다음 페이지로 이동
	        },
	        error: function(error) {
	            console.error("지역 정렬 에러", error);
	            alert("데이터 로딩 중 오류가 발생했습니다. 다시 시도해 주세요.");
	        }
	    });
	});

	
	

	



	//페이징
	$(window).off('scroll').on('scroll', function() {
	    if (!isLoading && $(window).scrollTop() + $(window).height() == $(document).height()) {
	        isLoading = true; // 요청 시작 전 플래그 설정

	        $.ajax({
	        	url: "${pageContext.request.contextPath}/club/clubInfiniteScroll",
	            data: {
	            	 startPage: (currentPage - 1) * pageSize + 1,  // 예: 1, 11, 21...
	                 endPage: currentPage * pageSize               // 예: 10, 20, 30...
	            },
	            type: 'GET',
	            dataType: 'json',
	            success: function(clubs) {
	            	console.log("현재페이지:", currentPage);  // 현재 페이지 번호 출력
	                console.log("반환페이지:", clubs);     // 반환된 소모임 데이터 출력
	                // 서버에서 반환된 데이터가 있을 경우만 화면에 추가
	                if (clubs.length > 0) {
	                    $.each(clubs, function(index, club) {
	                        $('#clubContainer').append(`
	                        		<div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=\${club.clubNumber}'">
	                                <img src="${pageContext.request.contextPath}/\${club.clubImgPath}\${club.clubImg}">
	                                <div class="clubInfo">
	                                <div class="clubInfo">
									<p>${club.clubName}</p>
									<p>${fn:substring(club.clubInfo, 0, 100)}${club.clubInfo.length() > 100 ? '...' : ''}</p>
									<span class="rounded-info">${club.clubCategory}</span>
									<span class="rounded-info">${club.majorLocation} ${club.subLocation}</span>
								</div>
	                                </div>
	                            </div>
	                        `);
	                    });
	                    currentPage++;  // 페이지 증가
	                }
	                isLoading = false; // 요청 완료 후 플래그 해제
	            },
	            error: function(error) {
	            	console.error("무한 스크롤 에러", error);
	                showError("데이터 로딩 중 오류가 발생했습니다. 다시 시도해 주세요.");
	                isLoading = false; // 요청 완료 후 플래그 해제
	            }
	        });
	    }
	});

	
	function showError(message) {
	    let errorDiv = $("#errorDiv");
	    if (!errorDiv.length) {
	        $("body").prepend('<div id="errorDiv" style="background-color: red; color: white; text-align: center; padding: 10px; position: fixed; top: 0; left: 0; right: 0;">' + message + '</div>');
	        setTimeout(function() {
	            $("#errorDiv").fadeOut().remove();
	        }, 3000); // 3초 후 에러 메시지 제거
	    }
	}
	
	//지역 스크롤
	$(document).ready(function() {
	    const list = document.querySelector('.region-list');
	    let isDragging = false;
	    let startX;
	    let scrollLeft;

	    list.addEventListener('mousedown', (e) => {
	        isDragging = true;
	        startX = e.pageX - list.offsetLeft;
	        scrollLeft = list.scrollLeft;
	        list.style.cursor = 'grabbing';
	    });

	    list.addEventListener('mouseleave', () => {
	        isDragging = false;
	        list.style.cursor = 'grab';
	    });

	    list.addEventListener('mouseup', () => {
	        isDragging = false;
	        list.style.cursor = 'grab';
	    });

	    list.addEventListener('mousemove', (e) => {
	        if (!isDragging) return;
	        const x = e.pageX - list.offsetLeft;
	        const walk = (x - startX);
	        list.scrollLeft = scrollLeft - walk;
	    });
	});
	
	//마우스 이동에 따른 해당 list 동적이동
	$(document).ready(function() {
	    const scrollList = ['.region-list', '.category-list'];

	    scrollList.forEach(selector => {
	        const list = document.querySelector(selector);
	        let isDragging = false;
	        let startX;
	        let scrollLeft;

	        list.addEventListener('mousedown', (e) => {
	            isDragging = true;
	            startX = e.pageX - list.offsetLeft;
	            scrollLeft = list.scrollLeft;
	            list.style.cursor = 'grabbing';
	        });

	        list.addEventListener('mouseleave', () => {
	            isDragging = false;
	            list.style.cursor = 'grab';
	        });

	        list.addEventListener('mouseup', () => {
	            isDragging = false;
	            list.style.cursor = 'grab';
	        });

	        list.addEventListener('mousemove', (e) => {
	            if (!isDragging) return;
	            const x = e.pageX - list.offsetLeft;
	            const walk = (x - startX);
	            list.scrollLeft = scrollLeft - walk;
	        });
	    });
	});
	
	
</script>
</body>
</html>