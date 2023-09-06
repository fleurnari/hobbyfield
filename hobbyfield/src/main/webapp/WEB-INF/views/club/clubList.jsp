<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>소모임 조회 메인 페이지</title>
<style>
#clubContainer {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

.clubItem {
	width: 23%; /* 4개씩 나열될 수 있도록 너비 설정 */
	margin: 10px;
	border: 1px solid #ccc;
	border-radius: 10px; /* 굴곡진 모서리 */
	overflow: hidden; /* 이미지가 박스를 벗어나지 않도록 함 */
	transition: transform 0.2s; /* 부드러운 hover 효과 */
	position: relative; /* 하위 요소의 위치 지정을 위해 */
}

.clubItem:hover {
	transform: scale(1.05); /* 이미지를 클릭할 때 크기를 약간 확대 */
}

.clubItem img {
	width: 100%;
	height: 350px;
	object-fit: cover; /* 이미지가 박스 내에 꽉 차도록 */
}

.clubInfo {
	display: none; /* 기본적으로 정보는 숨김 */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
	color: white;
	padding: 10px;
	box-sizing: border-box;
}

.clubItem:hover .clubInfo {
	display: block; /* 마우스를 올리면 정보 표시 */
}

.ck.ck-editor {
	width: 30%;
	max-width: 50px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;
}

/* 지역 버튼 및 모임분류 버튼 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.region-list {
	padding: 1rem 0;
	display: flex;
	white-space: nowrap;
	overflow-x: auto;
	scrollbar-width: none; /* 스크롤바 숨기기 */
}

/* Chrome, Safari 및 Opera의 스크롤바 숨기기 */
.region-list::-webkit-scrollbar {
	display: none; /* 스크롤바 자체를 숨김 */
}

.region-item {
	display: inline-block;
	padding-right: 1rem;
}

/* 지역 버튼 스타일 */
.region-btn {
	list-style: none;
	user-select: none;
	margin: 5px;
	background-color: #FF6F61;
	color: white;
	border: none;
	padding: 1rem;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	width: 150px;
}

.region-btn:hover {
	background-color: #FF8B7D;
}

/* 지역 버튼과 동일한 스타일을 모임 종류 버튼에도 적용 */
.category-list {
	padding: 1rem 0;
	display: flex;
	white-space: nowrap;
	overflow-x: auto;
	scrollbar-width: none; /* 스크롤바 숨기기 */
}

.category-list::-webkit-scrollbar {
	display: none; /* Chrome, Safari 및 Opera의 스크롤바 숨기기 */
}

.category-item {
	display: inline-block;
	padding-right: 1rem;
}

/* 전체 컨테이너를 화면의 중앙에 위치시키기 위한 스타일 */
.category-btn {
    list-style: none;
    user-select: none;
    margin: 3px;  /* 마진 사이즈 조정 */
    background-color: #FF6F61;
    color: white;
    border: none;
    padding: 0.5rem;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    width: 100px;
    font-size: 0.8rem;
}

/* 카테고리 리스트 스타일 조정 */
.category-list {
    display: flex;
    justify-content: center;  /* 가운데 정렬 */
    flex-wrap: wrap;  /* 필요한 경우 줄바꿈 */
    width: 70%;  /* 전체 너비 설정. 필요에 따라 조절 가능 */
    margin: 0 auto;  /* 중앙 정렬 */
}
</style>
</head>

<body>
<section>
    <div align="center" style="margin-top: 100px;">
		<a class="btn btn-success" href="${pageContext.request.contextPath}/club/clubInsert">소모임 생성</a>
		<!-- 지역 정렬 -->
		<ul class="region-list">
			<c:forEach items="${E}" var="region">
				<li class="region-item">
					<button class="region-btn" data-region-code="${region.literal}">${region.literal}</button>
				</li>
			</c:forEach>
		</ul>

		<!-- 모임 종류 정렬 -->
		<div class="center-container">
			<ul class="category-list">
				<c:forEach items="${C}" var="type">
					<li class="category-item">
						<button class="category-btn" data-type-code="${type.literal}">${type.literal}</button>
					</li>
				</c:forEach>
			</ul>
		</div>


			<!-- 소모임 표시 -->    
     <div id="clubContainer">
            <c:forEach items="${clubList}" var="club">
                <div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=${club.clubNumber}'">
                    <img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
                    <div class="clubInfo">
                        <p>모임리더: ${club.profileNickname}</p>
                        <p>모임이름: ${club.clubName}</p>
                        <p>카테고리: ${club.clubCategory}</p>
                        <p>분류: ${club.clubType}</p>
                        <p>소개글: ${club.clubInfo}</p>
                        <p>광역시: ${club.majorLocation}</p>
                        <p>구: ${club.subLocation}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
	</div>
</section>
</body>



<script type="text/javascript">

	var currentPage = 2;  // 현재 페이지 번호 초기화
	var pageSize = 12;    // 페이지 크기 초기화
	var isLoading = false; // 중복 요청을 확인

	
	//카테고리 버튼 클릭 이벤트 핸들러
	$(document).on('click', '.category-btn', function(e) {
	    const clubCategory = $(this).data('type-code');
	    console.log("카테고리", clubCategory);
	
	    // 서버에 지역 코드 전송
	    $.ajax({
	    	url: "${pageContext.request.contextPath}/club/getClubsByCate",
	        type: 'GET',
	        data: { "clubCategory" : clubCategory },
	        dataType: 'json',
	        success: function(Cate) {
	        	 console.log("Received Cate:", Cate);
	            // #clubContainer 내용삭제
	            $('#clubContainer').empty();
	            
	            // 서버로부터 받은 소모임 리스트를 화면에 추가
	            $.each(Cate, function(index, club) {
	                //각 소모임의 정보를 표시하는 코드 
	                $('#clubContainer').append(`
	                		<div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubBoardList?clubNumber=\${club.clubNumber}'">
	                        <img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
	                        <div class="clubInfo">
	                            <p>모임리더: \${club.profileNickname}</p>
	                            <p>모임이름: \${club.clubName}</p>
	                            <p>카테고리: \${club.clubCategory}</p>
	                            <p>분류: \${club.clubType}</p>
	                            <p>소개글: \${club.clubInfo}</p>
	                            <p>광역시: \${club.majorLocation}</p>
	                            <p>구: \${club.subLocation}</p>
	                        </div>
	                    </div>
	                `);
	            });
	        },
	        error: function(error) {
	            console.error("카테고리 정렬 에러", error);
	            alert("데이터 로딩 중 오류가 발생했습니다. 다시 시도해 주세요.");
	        }
	    });
	});

	

	   

	//카테고리 종류 정렬
	//카테고리 버튼 클릭 이벤트 핸들러
	$(document).on('click', '.region-btn', function() {
		//버블링 방지
		
	    const majorLocation = $(this).data('region-code');
	    // 서버에 지역 코드 전송
	    $.ajax({
	    	url: "${pageContext.request.contextPath}/club/getClubsByRegion",
	        type: 'GET',
	        data: { "majorLocation" : majorLocation },
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
	                        	<img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
	                        <div class="clubInfo">
	                            <p>모임리더: \${club.profileNickname}</p>
	                            <p>모임이름: \${club.clubName}</p>
	                            <p>카테고리: \${club.clubCategory}</p>
	                            <p>분류: \${club.clubType}</p>
	                            <p>소개글: \${club.clubInfo}</p>
	                            <p>광역시: \${club.majorLocation}</p>
	                            <p>구: \${club.subLocation}</p>
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
	                        		<div class="clubItem" onclick="location.href='${pageContext.request.contextPath}/club/clubInfo?clubNumber=\${club.clubNumber}'">
	                                <img src="${pageContext.request.contextPath}/${club.clubImgPath}${club.clubImg}">
	                                <div class="clubInfo">
	                                    <p>모임리더: \${club.profileNickname}</p>
	                                    <p>모임이름: \${club.clubName}</p>
	                                    <p>카테고리: \${club.clubCategory}</p>
	                                    <p>분류: \${club.clubType}</p>
	                                    <p>소개글: \${club.clubInfo}</p>
	                                    <p>광역시: \${club.majorLocation}</p>
	                                    <p>구: \${club.subLocation}</p>
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
	
	
	
// $(document).ready(function() {
// 	//지역종류 가로스크롤
// 	// 요소 & 사이즈
//     const list = document.querySelector('.region-list');
//     const listScrollWidth = list.scrollWidth;
//     const listClientWidth = list.clientWidth;

//     // 이벤트마다 갱신될 값
//     let startX = 0;
//     let nowX = 0;
//     let endX = 0;
//     let listX = 0;

//     function getClientX(e) {
//         const isTouches = e.touches ? true : false;
//         return isTouches ? e.touches[0].clientX : e.clientX;
//     }

//     function getTranslateX() {
//         return parseInt(getComputedStyle(list).transform.split(/[^\-0-9]+/g)[5]);
//     }

//     function setTranslateX(x) {
//         list.style.transform = `translateX(${x}px)`;
//     }

//     function onScrollStart(e) {
//         startX = getClientX(e);
//         window.addEventListener('mousemove', onScrollMove);
//         window.addEventListener('touchmove', onScrollMove);
//         window.addEventListener('mouseup', onScrollEnd);
//         window.addEventListener('touchend', onScrollEnd);
//     }

//     function onScrollMove(e) {
//         nowX = getClientX(e);
//         setTranslateX(listX + nowX - startX);
//     }

//     function onScrollEnd(e) {
//         endX = getClientX(e);
//         listX = getTranslateX();

//         if (listX > 0) {
//             setTranslateX(0);
//             list.style.transition = `all 0.3s ease`;
//             listX = 0;
//         } else if (listX < listClientWidth - listScrollWidth) {
//             setTranslateX(listClientWidth - listScrollWidth);
//             list.style.transition = `all 0.3s ease`;
//             listX = listClientWidth - listScrollWidth;
//         }

//         window.removeEventListener('mousedown', onScrollStart);
//         window.removeEventListener('touchstart', onScrollStart);
//         window.removeEventListener('mousemove', onScrollMove);
//         window.removeEventListener('touchmove', onScrollMove);
//         window.removeEventListener('mouseup', onScrollEnd);
//         window.removeEventListener('touchend', onScrollEnd);
//         window.removeEventListener('click', onClick);

//         setTimeout(() => {
//             bindEvents();
//             list.style.transition = '';
//         }, 300);
//     }

//     function onClick(e) {
//         if (startX - endX === 0) {
//             const clickedX = getClientX(e);
//             const halfWidth = listClientWidth / 2;

//             if (clickedX < halfWidth) {
//                 listX -= halfWidth;
//             } else {
//                 listX += halfWidth;
//             }

//             if (listX > 0) {
//                 listX = 0;
//             } else if (listX < listClientWidth - listScrollWidth) {
//                 listX = listClientWidth - listScrollWidth;
//             }

//             list.style.transition = `all 0.3s ease`;
//             setTranslateX(listX);

//             setTimeout(() => {
//                 list.style.transition = '';
//             }, 300);
//         } else {
//             e.preventDefault();
//         }
//     }

//     function bindEvents() {
//         list.addEventListener('mousedown', onScrollStart);
//         list.addEventListener('touchstart', onScrollStart);
//         list.addEventListener('click', onClick);
//     }

//     bindEvents();
// });


// 	$('#clubLink').on("click",function(e){
// 		.stopPropagation();
// 		var email = $('#checkClub').
// 		// ajax로 해당 소모임에 사용자가 가입되어있는지 확인, 
// 		// 가입되어있을시 해당 페이지로 이동, 아닐시 가입페이지로 이동
// 		// 
// 		// ajax로 통해 보내야할 데이터는 Session의 member.memberEmail
// 		$.ajax({
// 			url : 'checkClubApply',
// 			data : email,
// 			type : 'POST',
// 			success : function(result) {
// 					console.log("ajax 호출, Session의 email : " + email);	
// 					if(result == ture){
// 						// 해당 소모임 메인페이지 이동 호출 
// 					}esle{
// 						alert("해당 소모임 가입페이지로 이동합니다.")
// 					}
// 				}
			
// 			}
// 		})

		
// 	});

// 	$('#clubContainer').on('click',function(e){
// 		var linkta
// 	});
	
// 	ClassicEditor
//     .create( document.querySelector( '#editor' ), {
//     	toolbar: []
//     })
//     .then(editor => {
        

//         editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
//     })
//     .catch( error => {
//         console.error( error );
//     });

//       editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
//    })
//    .catch( error => {
//       console.error( error );
//    });
// 	bootstrap modal ex

	
</script>

</html>