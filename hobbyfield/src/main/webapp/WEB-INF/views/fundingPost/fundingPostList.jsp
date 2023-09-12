<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트 조회</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.search {
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    margin-top: 20px; /* 위쪽으로 20px만큼 이동 */
    margin-bottom: 20px; /* 아래쪽으로 20px만큼 이동 */
    position: relative; /* 상대적 위치 설정 */
    left: 200px; /* 오른쪽으로 20px 이동 */
}

.search select, .search input[type="text"] {
    height: 40px;
    padding: 5px;
    border: 1px solid #ddd; 
    outline: none;
    font-size: 16px;
    margin-right: 10px;
}


#searchBtn {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}


#searchBtn:hover {
    background-color: #0056b3;
}

/* Pagination CSS */
.pagination {
    margin: 20px 0;
    display: flex;
    justify-content: center;
}

.pagination ul {
    list-style: none;
    padding: 0;
    display: flex;
    align-items: center;
}

.pagination li {
    margin-right: 10px;
    border: 1px solid #ddd;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 20%; 
}

.pagination li a {
    text-decoration: none;
    color: #333;
}

.pagination li.active {
    background-color: #007bff;
    border: 1px solid #007bff;
}

.pagination li.active a {
    color: #fff;
}

.pagination li:hover {
    background-color: #ccc;
}

/* Previous and Next buttons */
.pagination .prev,
.pagination .next {
    margin: 0 10px;
    border: 1px solid #007bff;
    color: #007bff;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 50%; /* 더 둥글게 설정 */
}

.pagination .prev a,
.pagination .next a {
    text-decoration: none;
    color: #007bff;
}

.pagination .prev:hover,
.pagination .next:hover {
    background-color: #ccc;
}


.col {
  cursor: pointer;
}
/* 이미지 주변 공백 제거 */
.bd-placeholder-img image {
    display: block; /* 이미지를 블록 요소로 설정 */
    width: 100%; /* 가로 너비 100% 설정 */
    height: auto; /* 세로 비율 유지 */
    margin: 0; /* 외부 여백 제거 */
    padding: 0; /* 내부 여백 제거 */
}

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
	      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
</style>

</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
<br><br><br><br>
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
	<Section>
	 <div class="album py-5 bg-body-tertiary">
    <div class="container">
    <div class="container2">
     <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
     <c:forEach items="${fundingPostList}" var="fundingPost">
     <c:if test="${fundingPost.fndStatus eq '2' }">
        <div class="col" onclick="location.href='fundingPostInfo?fndPostNumber=${fundingPost.fndPostNumber }'">
          <div class="card shadow-sm">
<svg class="bd-placeholder-img card-img-top" width="337.78" height="225" role="img" aria-label="Placeholder: Thumbnail" focusable="false">
  <title>Placeholder</title>
  <image xlink:href="${pageContext.request.contextPath}${fundingPost.fndMainImgPath}${fundingPost.fndMainImg}" width="337.78" height="225" />
</svg>
            <div class="card-body">
              <p class="card-text">
              <p>
					<span>${fundingPost.fndCategory }</span>
				</p>
				<p>
					<span><h3>${fundingPost.fndTitle }</h3></span>
				</p>
				<br />
				<p>
					<span>${fundingPost.fndStatus}</span>
				</p>
				<p>
					<span><div class="progress">
    <div class="progress-bar" role="progressbar" style="width: ${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}%;" aria-valuenow="${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}" aria-valuemin="0" aria-valuemax="100">${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}% 진행중</div>
</div><span>        조회수: ${fundingPost.fndViews }</span>
				</p>
				<p>
					<span>${fundingPost.fndCurrentAmount }</span><span>원</span>
				</p>

              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                </div>
                <small class="text-body-secondary">					<span>펀딩 마감까지 남은 시간</span>
					<span class="time">
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
					
    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
    				
    					<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
    					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>

    					<c:choose>
        					<c:when test="${endDate - nowfmtTime >= 1}">
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
					</span></small>
              </div>
            </div>
          </div>
        </div>
     </c:if>
     </c:forEach>
	</div>
		</div>
	</div>
			<div class="container">
				
						<div class="pagination">
							<ul >
								<c:if test="${pageMaker.prev}">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				   				 </c:if> 
				
				    			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    				</c:forEach>
				
				    			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    			<li><a href="fundingPostList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    			</c:if> 
									</ul>
						</div>
		
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
		
		
		
		$(document).on('click', '.dropdown-item', function(e) {
		    const fndCategory = $(this).data('type-code');
		    const fndPostNumber = $(this).data('${fundingPost.fndPostNumber }');

		    $.ajax({
		        url: "${pageContext.request.contextPath}/fundingPost/selectFundingPostCate",
		        type: 'GET',
		        data: { "fndCategory": fndCategory	},
		        dataType: 'json',
		        success: function (cate) {
		            // 펀딩 전체 조회 내용 삭제
		            $(".container2").empty();

		            $.each(cate, function (index, fundingPost) {
		                    $(".container2").append(`
		                    		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		                    	     <c:forEach items="\${fundingPostList}" var="fundingPost">
		                    	     <c:if test="\${fundingPost.fndStatus eq '2' }">
		                    	        <div class="col" onclick="location.href='fundingPostInfo?fndPostNumber=\${fundingPost.fndPostNumber }'">
		                    	          <div class="card shadow-sm">
		                    	<svg class="bd-placeholder-img card-img-top" width="337.78" height="225" role="img" aria-label="Placeholder: Thumbnail" focusable="false">
		                    	  <title>Placeholder</title>
		                    	  <image xlink:href="\${pageContext.request.contextPath}\${fundingPost.fndMainImgPath}\${fundingPost.fndMainImg}" width="337.78" height="225" />
		                    	</svg>
		                    	            <div class="card-body">
		                    	              <p class="card-text">
		                    	              <p>
		                    						<span>${fundingPost.fndCategory }</span>
		                    					</p>
		                    					<p>
		                    						<span><h3>${fundingPost.fndTitle }</h3></span>
		                    					</p>
		                    					<br />
		                    					<p>
		                    						<span>${fundingPost.fndStatus}</span>
		                    					</p>
		                    					<p>
		                    						<span><div class="progress">
		                    	    <div class="progress-bar" role="progressbar" style="width: \${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}%;" aria-valuenow="${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}" aria-valuemin="0" aria-valuemax="100">${(fundingPost.fndCurrentAmount / fundingPost.fndTargetAmount) * 100}% 진행중</div>
		                    	</div><span>        조회수: ${fundingPost.fndViews }</span>
		                    					</p>
		                    					<p>
		                    						<span>${fundingPost.fndCurrentAmount }</span><span>원</span>
		                    					</p>

		                    	              <div class="d-flex justify-content-between align-items-center">
		                    	                <div class="btn-group">
		                    	                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
		                    	                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
		                    	                </div>
		                    	                <small class="text-body-secondary">					<span>펀딩 마감까지 남은 시간</span>
		                    						<span class="time">
		                    							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
		                    						
		                    	    					<fmt:parseDate value="${today}"  pattern="yyyy-MM-dd" var="strPlanDate" />
		                    	    					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
		                    	    				
		                    	    					<fmt:parseDate value="${fundingPost.fndEndDate}"  pattern="yyyy-MM-dd" var="endPlanDate"/>
		                    	    					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>

		                    	    					<c:choose>
		                    	        					<c:when test="${endDate - nowfmtTime >= 1}">
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
		                    						</span></small>
		                    	              </div>
		                    	            </div>
		                    	          </div>
		                    	        </div>
		                    	     </c:if>
		                    	     </c:forEach>
		                    `);
		            });
		        },
		        error: function (error) {
		            console.log(error);
		            alert("데이터 로딩 중 오류가 발생 했습니다. 다시 시도해 주세요.");
		        }
		    });
		});
		
	</script>
</body>
</html>