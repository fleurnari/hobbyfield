<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css?after">
</head>
<body>
 <div class="wrapper">
        <header>
            <div class="top">
                <div>
                    <p>
                        <a href="#">로그인</a>
                        <a href="#">회원가입</a>
                        <a href="#">마이페이지</a>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            장바구니
                        </a>
                    </p>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#">
                        고객문의
                    </a>
                </div>
            </div>
        </header>
        <section id="cs">
            <div class="notice">
                <nav>
                    <div>
                        <p>
                            홈
                            <span>></span>
                            공지사항
                        </p>
                    </div>
                </nav>
                <section class="view">
                    <aside>
                        <h2>공지사항</h2>
                        <ul>
                            <li class="on">
                                <a href="#">전체</a>
                            </li>
                            <li>
                                <a href="#">고객서비스</a>
                            </li>
                            <li>
                                <a href="#">안전거래</a>
                            </li>
                            <li>
                                <a href="#">위해상품</a>
                            </li>
                            <li>
                                <a href="#">이벤트당첨</a>
                            </li>
                        </ul>
                    </aside>
                    
                    <article>
					
					<form name="getCSboardInfo" method="post">
						  <input type="hidden" name="csNumber" id="csNumber" value="${CSboardInfo.csNumber}">
						  <input type="hidden" id="page" name="page" value="${scri.page}"> 
						  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					</form>
                        <nav>
                            <h1 class="title">${CSboardInfo.csTitle}</h1>
                            <span class="date">${CSboardInfo.csWriter }</span>
                            <br>
                            <span class="date"><fmt:formatDate value="${CSboardInfo.csDate }" 
										pattern="yyyy년MM월dd일" /></span>
                            
                        </nav>					
                        <div class="content">
                            <p>
							<img src='<c:url value="../resources/${CSboardInfo.csImgName }" />' style="width: 200px;">
                            ${CSboardInfo.csContents }
							</p>
                        </div>
                       	<div>
							<button type="submit" class="update_btn">수정</button>
							<button type="submit" class="delete_btn">삭제</button>
							<button type="submit" class="list_btn">목록</button>	
						</div>
	<div class="row">
    <div class="col-sm-12" style="margin-top: 10px;">
        <div id="comment">
            <div class=" commont-write">
                <form class="comment_form" role="form"  method="post">
                     <label>
                        <div class="input-group">
                            <textarea name="replyContents" 
                                      id="replyContents"
                                      class="form-control p-10" 
                                      placeholder="댓글입력"></textarea>
                            <span class="input-group-btn">
                                <button class="btn btn-white btn-lg" id="comment-btn" type="button" style="background-color: #ddd">
                                    <i class="far fa-edit">댓글등록</i>
                                </button>
                            </span>
                        </div>
                    </label>
                </form>    
            </div>
            <div class="comment-none">
                <div class="well text-center">
                    등록된 내용이 없습니다.
                </div>
            </div>
        </div>
    </div>
</div>

						
                    </article>
                </section>
            </div>
        </section>	
         <footer>
         
            <ul>
                <li>
                    <a href="#">회사소개</a>
                </li>
                <li>
                    <a href="#">서비스이용약관</a>
                </li>
                <li>
                    <a href="#">개인정보처리방침</a>
                </li>
                <li>
                    <a href="#">전자금융거래약관</a>
                </li>
            </ul>
            <div>
                <p>
                </p>
                <p>
                    <strong>HobbyGang</strong>
                    <br>
                    예담
                    <br>
                    대표이사 : 신나리
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00 ~ 18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : nateok12@naver.com
                    <br>
                </p>
            </div>
        </footer>
    </div>
    
  	<script>
  	$(document).ready(function(){
        
  	    // 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지) 
  	    var commentPage = 1;
  	 
  	    commentList(commentPage);
  	    
  	    $("#comment-btn").click(function() {
  	        var comment = $("#comments").val();
  	        var board_code = <c:out value="${board.code}"/>;
  	        
  	        $.ajax({ 
  	            type : "POST", 
  	            headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" },
  	            url : "/comment/write",
  	            data : JSON.stringify({
  	                    comment:comment,
  	                    board_code:board_code,
  	                    writer:"관리자"
  	                }),
  	            dataType : "text",
  	            success : function (data) {
  	                $("#comments").val(''); // 댓글 작성시 댓글 입력란 초기화
  	                $("#commentList").html(''); // 댓글 리스트 초기화
  	                commentList(1); // 새로운 댓글 리스트 
  	            }
  	        });
  	    });
  	    
  	    function commentList(commentPage) {
  	        $.getJSON("/comment/pages/"+${board.code}+"/"+commentPage, function (data) { 
  	            $("#commentList").html('');
  	            var html = "<ul class='list-group'>";
  	            $(data).each(function(){
  	                html += "<li class='list-group-item comments'>";
  	                html +=     "<div class='comment'>";
  	                html +=         "<a href='javascript:; class='comment-img'>";
  	                html +=             "<img src='' width='50' height='50'>";
  	                html +=         "</a>";
  	                html +=         "<div class='comment-info'>";
  	                html +=             "<span class='date'>"+ getFormatDate(new Date(this.write_date)) +"</span>";
  	                html +=             "<a href='javascript:;' class='name'>"+ this.writer +"</a>";
  	                html +=             "<div class='comment-text'> "+ this.comment +"</div>";
  	                html +=             "<div class='comment_etc'>";
  	                html +=                 "<div class='comment-info'>";
  	                html +=                 "<a href='javascript:;' class='btn btn-secondary btn-icon-split comment_delete'>";
  	                html +=                      "<span class='text'>답글(0)</span>";
  	                html +=                 "</a>";
  	                html +=                 "<a href='javascript:;' class='btn btn-danger btn-icon-split comment_delete'>";
  	                html +=                      "<span class='text'>삭제</span>";
  	                html +=                 "</a>";
  	                html +=                 "<a href='javascript:;' class='btn btn-primary btn-icon-split comment_delete'>";
  	                html +=                      "<span class='text'>수정</span>";
  	                html +=                 "</a>";
  	                html +=             "</div>";
  	                html +=         "</div>";
  	                html +=     "</div>";
  	                html += "</li>";
  	            });
  	            html += "</ul>";
  	        
  	            $("#commentList").append(html);
  	        });
  	    }
  	    
  	    /**
  	     *  yyyy-MM-dd 포맷으로 반환
  	     */
  	    function getFormatDate(date){
  	        var year = date.getFullYear();              //yyyy
  	        var month = (1 + date.getMonth());          //M
  	        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
  	        var day = date.getDate();                   //d
  	        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
  	        return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
  	    }
  	});
	
	
    $(document).ready(function(){
		var formObj = $("form[name='getCSboardInfo']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.prop("action", "CSboardUpdate");
			formObj.prop("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			let deleteChk = confirm("삭제??");
			if(deleteChk == true){
			formObj.prop("action", "CSboardDelete");
			formObj.prop("method", "post");
			formObj.submit();
			
			}
		})
		
		// 목록
		$(".list_btn").on("click", function(){
			
			location.href = "CSboardList"
				
		})
	})
	
	
	

	
	
    </script>
</body>
</html>