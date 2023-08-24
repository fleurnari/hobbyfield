<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>
 div.replyModal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); 
    z-index: 1000;
}

div.modalContent {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 80%;
    width: 500px; 
    background: #fff;
    border: 1px solid #ccc;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

div.modalContent textarea {
    font-size: 16px;
    font-family: '맑은 고딕', verdana;
    padding: 10px;
    width: 100%;
    height: 200px;
}

div.modalContent button {
    font-size: 20px;
    padding: 5px 10px;
    margin: 10px 0;
    background: #fff;
    border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
    margin-left: 20px;
}
</style>
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
						<form id="replyForm" method="post">
						    <input type="hidden" id="csNumber" value="${CSboardInfo.csNumber}" />
						    <input type="hidden" id="replyWriter" value="test" />
						    <textarea id="content"></textarea>
						    <button type="button" onclick="submitReply()">댓글 작성</button>
						</form>
					</article>
                </section>
            </div>
			<div id="replyUpdateModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<textarea id="replyUpdateContent"></textarea>
					<button class="modal_update_btn">수정</button>
				</div>
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
  	//게시글 수정, 삭제 , 목록, 댓글삭제
    $(document).ready(function(){
		var formObj = $("form[name='getCSboardInfo']");
		
		// 게시글수정 
		$(".update_btn").on("click", function(){
			formObj.prop("action", "CSboardUpdate");
			formObj.prop("method", "get");
			formObj.submit();				
		})
		
		// 게시글삭제
		$(".delete_btn").on("click", function(){
			
			let deleteChk = confirm("삭제??");
			if(deleteChk == true){
			formObj.prop("action", "CSboardDelete");
			formObj.prop("method", "post");
			formObj.submit();
			
			}
		})
		
		// 게시글목록
		$(".list_btn").on("click", function(){
			
			location.href = "CSboardList"
				
		})
	})
	
	//댓글삭제
	  $(".replyDeleteBtn").on("click", function() {
        var replyId = $(this).attr("data-replyId");
        var deleteChk = confirm("댓글을 삭제하시겠습니까?");

        if (deleteChk) {
            $.ajax({
                type: "POST",
                url: "deleteReply",
                data: {
                    replyId: replyId
                },
                dataType: "json", // 응답 데이터 타입을 JSON으로 설정, 컨트롤러에서도 JSON으로 받을 수 있게 해야함
                success: function(response) {
                    if (response.success) {
                        alert("댓글이 삭제되었습니다.");
                        location.reload();
                    } else {
                        alert("댓글 삭제에 실패하였습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("댓글 삭제에 실패하였습니다.");
                }
            });
        }
    });
  	
 // 댓글 수정 버튼 클릭 시 모달 표시
    $(".replyUpdateBtn").on("click", function() {
        var replyId = $(this).attr("data-replyId");
        var replyContent = $(this).closest("li").find("p:last").text();

        $("#replyUpdateContent").val(replyContent); // 모달 내의 textarea에 댓글 내용을 로드합니다.
        $(".modal_update_btn").attr("data-replyId", replyId); // 수정 버튼에 댓글 ID 속성 추가
        $("#replyUpdateModal").show(); // 모달을 보이도록 설정
    });

    // 모달 수정 버튼 클릭 시 처리
    $(".modal_update_btn").on("click", function() {
        var replyId = $(this).attr("data-replyId");
        var newContent = $("#replyUpdateContent").val();

        var replyVO = {
            replyId: replyId,
            content: newContent
        };

        $.ajax({
            type: "POST",
            url: "updateReply",
            data: JSON.stringify(replyVO),
            contentType: "application/json",
            success: function(response) {
                alert("댓글이 수정되었습니다.");
                location.reload(); // 
            },
            error: function(xhr, status, error) {
                alert("댓글 수정에 실패하였습니다.");
            }
        });

        $("#replyUpdateModal").hide(); // 모달을 숨깁니다.
    });

    // 모달 닫기 버튼 클릭 시 처리
    $(".close").on("click", function() {
        $("#replyUpdateModal").hide();
    });
  	
  	
  	
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
  	
   </script>
</body>
</html> 