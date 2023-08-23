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
						<!-- 댓글 -->
						<div id="reply">
							<ol class="replyList">
								<c:forEach items="${replyList}" var="replyList">
									<li>
										<p>
										작성자 : ${replyList.replyWriter}<br /> 
										작성 날짜 : <fmt:formatDate value="${replyList.regDate}" pattern="yyyy-MM-dd" />
										</p>
										<div>
										  <button type="button" class="replyUpdateBtn" data-replyId="${replyList.replyId}">수정</button>
										  <button type="button" class="replyDeleteBtn" data-replyId="${replyList.replyId}">삭제</button>
										</div>

										<p>${replyList.content}</p>
									</li>
								</c:forEach>
							</ol>
						</div>
						<!-- 모달 -->
<div class="modal-background" id="modalBackground">
    <div class="modal-container">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div class="modal-content" id="modalContent">
            <!-- 댓글 수정 폼이 여기에 로드될 것입니다. -->
        </div>
    </div>
</div>

						<form id="replyForm" method="post">
						    <input type="hidden" id="csNumber" value="${CSboardInfo.csNumber}" />
						    <input type="hidden" id="replyWriter" value="test" />
						    <textarea id="content"></textarea>
						    <button type="button" onclick="submitReply()">댓글 작성</button>
						</form>
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
	
  	//게시글 수정, 삭제 , 목록
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
   
   <script>
    // 댓글 수정 버튼 클릭 시 모달 열기와 댓글 수정 폼 로드
    $(".replyUpdateBtn").on("click", function(){
        var replyId = $(this).attr("data-replyId");
        openModal();

        // 댓글 수정 폼 로드를 위한 Ajax 요청
        $.ajax({
            type: "GET",
            url: "replyUpdateView",
            data: { csNumber: "${CSboardInfo.csNumber}", replyId: replyId },
            success: function(response) {
                $("#modalContent").html(response); // 모달 내용에 댓글 수정 폼 로드
            },
            error: function(xhr, status, error) {
                // 오류 처리
            }
        });
    });

    // 모달 닫기
    function closeModal() {
        $("#modalBackground").hide();
    }

    // 모달 열기
    function openModal() {
        $("#modalBackground").show();
    }
   </script>
   
   <script>
   
   //댓글 목록조회
	function submitReply() {
	    var csNumber = $("#csNumber").val();
	    var content = $("#content").val();
	    var writer = $("#replyWriter").val(); 
	    
	
	    var data = {
	        csNumber: csNumber,
	        content: content,
	        replyWriter: writer
	    };

    $.ajax({
        type: "POST",
        url: "insertReply",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function(response) {
            alert("댓글 작성 완료")
            location.reload();
        },
        error: function(xhr, status, error) {
            alert("댓글 작성에 실패하였습니다.");
        }
    });
}
   
//    	//수정
// 	$(".replyUpdateBtn").on("click", function(){
// 		location.href = "replyUpdateView?csNumber=${CSboardInfo.csNumber}"
// 						+ "&replyId="+$(this).attr("data-replyId");
// 	});
   	
	// 삭제
	$(".replyDeleteBtn").on("click", function(){
		location.href = "replyDeleteView?csNumber=${CSboardInfo.csNumber}"
						+ "&replyId="+$(this).attr("data-replyId");
	});
	
	
</script>
</body>
</html>