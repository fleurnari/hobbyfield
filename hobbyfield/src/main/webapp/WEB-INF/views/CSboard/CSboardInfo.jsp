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
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
</head>
<body>
        <section id="cs">
            <div class="notice">
                <nav>
                    <div>
                        <p>
                            카테고리
                            <span>></span>
                            배송관련안내
                        </p>
                    </div>
                </nav>
                <section class="view">
                    <aside>
                        <h2>공지사항</h2>
                        <ul>
                            <li class="on">
                                <a href="#">카테고리</a>
                            </li>
                            <li>
                                <a href="#">상품목록</a>
                            </li>
                            <li>
                                <a href="#">장바구니</a>
                            </li>
                            <li>
                                <a href="#">주문목록</a>
                            </li>
                            <li>
                                <a href="#">배송안내</a>
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
                            ${CSboardInfo.csContents}
							</p>
                        </div>
                        <br>
                       	<div>
							<button type="submit" class="btn btn-primary" id="update_btn">수정</button>
							<button type="submit" class="btn btn-primary" id="delete_btn">삭제</button>
							<button type="submit" class="btn btn-primary" id="list_btn">목록</button>	
						</div>
    
	
	<script>
  	//게시글 수정, 삭제 , 목록, 댓글삭제
    $(document).ready(function(){
		var formObj = $("form[name='getCSboardInfo']");
		
		// 게시글수정 
		$("#update_btn").on("click", function(){
			formObj.prop("action", "CSboardUpdate");
			formObj.prop("method", "get");
			formObj.submit();				
		})
		
		// 게시글삭제
		$("#delete_btn").on("click", function(){
			
			let deleteChk = confirm("삭제하시겠습니까??");
			if(deleteChk == true){
			formObj.prop("action", "CSboardDelete");
			formObj.prop("method", "post");
			formObj.submit();
			
			}
		})
		
		// 게시글목록
		$("#list_btn").on("click", function(){
			
			location.href = "CSboardList"
				
		})
	})
  	
   </script>
</body>
</html> 