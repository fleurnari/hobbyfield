<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
    rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>상품 상세 정보</title>
</head>
<body>
    <nav class="navbar navbar-expand  navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="prdt/prdtList">Home</a>
            </div>
        </div>
    </nav>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 정보</h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
	            <form name="prdtInfo" method="post">
							  <input type="hidden" name="prdtId" id="prdtId" value="${prdtInfo.prdtId}">
				</form>
                <h3>${prdtInfo.prdtName}</h3>  
                <p>${prdtInfo.prdtContents}</p>
                <br>
                <p><b>상품번호 : </b><span class="badge badge-info">${prdtInfo.prdtId}</span>
                <p><b>카테고리</b> : ${prdtInfo.prdtCate}
                <h4>${prdtInfo.prdtPrice}원</h4>  
                <br>
                <span>구입 수량</span>
				 <button type="button" class="plus">+</button>
				 <input type="number" class="numBox" min="1" max="${prdtInfo.prdtCount}" value="1" readonly="readonly"/>
				 <button type="button" class="minus">-</button>
                <p><a href="#" class="btn btn-primary" id="addCart_btn">장바구니에 담기 &raquo;</a> 
                <a href="<c:url value="prdtList"/>" class="btn btn-secondary">상품 목록 &raquo;</a>  
                <a href="<c:url value="cartList"/>" class="btn btn-secondary">장바구니 &raquo;</a>  
            </div>
        </div>
        <hr>
        <button type="submit" class="delete_btn">삭제</button>
        <button type="submit" class="update_btn">수정</button>
    </div>
    
    
  <!--리뷰 작성 폼  -->
  <div id="reviewModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeReviewModal">&times;</span>
        <h4 class="modal-title">리뷰 작성</h4>
        <form id="reviewForm">
            <input type="hidden" name="prdtId" value="${prdtInfo.prdtId}">
            <input type="hidden" name="memberEmail" id="memberEmail" value="${member.memberEmail}">
            <div class="input_area">
                <input type="radio" name="category" value="후기" id="category">
                <label for="category1">후기</label>
                
                <input type="radio" name="category" value="상품문의" id="category2">
                <label for="category2">상품문의</label>
            </div>
            <div class="input_area">
            	<input type="text" name="reviewTitle" id="reviewTitle" placeholder="리뷰 제목">
        	</div>
            <div class="input_area">
                <textarea name="reviewContent" id="reviewContent"></textarea>
            </div>
            <div class="input_area">
                <button type="button" id="review_btn">작성하기</button>
            </div>
        </form>
    </div>
</div>

<!--리뷰 작성 모달창 불러오는 버튼  -->
<button type="button" class="btn btn-primary" id="openReviewModal">리뷰 작성</button>

<!-- 모달 창 -->
<div class="modal fade" id="writeReviewModal" tabindex="-1" role="dialog" aria-labelledby="writeReviewModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="writeReviewModalLabel">후기 작성</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="reviewForm">
                <div class="modal-body">
                    <input type="hidden" name="prdtId" value="${prdtInfo.prdtId}">
                    <div class="form-group">
                        <label for="category">카테고리 선택</label>
                        <div class="input_area">
                            <input type="radio" name="category" value="후기" id="category1">
                            <label for="category1">후기</label>
                            
                            <input type="radio" name="category" value="상품문의" id="category2">
                            <label for="category2">상품문의</label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="reviewContent">리뷰 내용</label>
                        <textarea class="form-control" name="reviewContent" id="reviewContent"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary" id="review_btn_modal">작성</button>
                </div>
            </form>
        </div>
    </div>
</div>

		<button class="categoryBtn" data-category="후기">후기</button>
		<button class="categoryBtn" data-category="상품문의">상품문의</button>
		
		<div id="categoryReviewList">
		    <ul class="list-group">
		        <!-- 리뷰 목록 데이터를 동적으로 추가 -->
		    </ul>
		</div>

</body>
<script>
  	// 상품 수정, 삭제 
    $(document).ready(function(){
        $(document).on("click", ".delete_btn", function(){
            let deleteChk = confirm("등록된 상품을 삭제하시겠습니까?");
            if (deleteChk) {
                var formObj = $("form[name='prdtInfo']");
                formObj.prop("action", "prdtDelete");
                formObj.prop("method", "post");
                formObj.submit();
            }
        });

        $(document).on("click", ".update_btn", function(){
            let updateChk = confirm("등록된 상품을 수정하시겠습니까?");
            if (updateChk) {
                var formObj = $("form[name='prdtInfo']");
                formObj.prop("action", "prdtUpdate");
                formObj.prop("method", "get");
                formObj.submit();
            }
        });
    });
  	
  	
  	//수량 조절
  	$(".plus").click(function(){
	   var num = $(".numBox").val();
	   var plusNum = Number(num) + 1;
   
	   if(plusNum >= ${prdtInfo.prdtCount}) {
	    $(".numBox").val(num);
	   } else {
	    $(".numBox").val(plusNum);          
	   }
	 });
  
  $(".minus").click(function(){
	   var num = $(".numBox").val();
	   var minusNum = Number(num) - 1;
   
	   if(minusNum <= 0) {
	    $(".numBox").val(num);
	   } else {
	    $(".numBox").val(minusNum);          
	   }
  });
  	
  	
  	//장바구니 담기
  	 $("#addCart_btn").click(function(){
	   var prdtId = $("#prdtId").val();
	   var cartStock = $(".numBox").val();
	      
	   var data = {
	     prdtId : prdtId,
	     cartStock: cartStock
	     };
   
	   $.ajax({
	        url: "addCart",
	        type: "post",
	        data: data,
	        success: function(result){
	            if(result == "1") {
	                alert("장바구니에 담겼습니다.");
	                $(".numBox").val("1");
	            } else {
	                alert("로그인 세션이 만료되었습니다. 로그인 후 이용해주세요.");
	                $(".numBox").val("1");
	            }
	        },
	        error: function(){
	            alert("장바구니 담기 실패");
	        }
	    });
	});
  	
  	
  	 // 모달 열기 버튼 클릭 이벤트
     $("#openReviewModal").click(function() {
         $("#reviewModal").css("display", "block");
     });
     
     // 모달 닫기 버튼 클릭 이벤트
     $("#closeReviewModal").click(function() {
         $("#reviewModal").css("display", "none");
     });
     
  // 리뷰 작성
     $("#review_btn").click(function() {
         var prdtId = $("input[name='prdtId']").val();
         var reviewContent = $("#reviewContent").val();
         var category = $("input[name='category']:checked").val();
         var reviewTitle = $("#reviewTitle").val();
         
         var data = {
        		    prdtId: prdtId,
        		    reviewTitle: reviewTitle,
        		    reviewContent: reviewContent,
        		    category: category,
        		    reviewDate: new Date().toISOString() // 날짜변환
        		};
         
         $.ajax({
             url: "writeReview",
             type: "post",
             contentType: "application/json",
             data: JSON.stringify(data),
             success: function(result) {
                 alert("리뷰가 작성되었습니다.");
                 $("#reviewTitle").val("");	//제목  초기화
                 $("#reviewContent").val("");	//후기 내용 초기화
                 $("#reviewModal").css("display", "none"); // 모달 닫기
                 showReviewList(result);
             },
             error: function() {
                 alert("리뷰 작성에 실패하였습니다.");
             }
         });
     });

</script>
<script>
	//리뷰목록(카테고리별)
   $(document).ready(function() {
    // 페이지 로딩 시에 '후기' 출력
    getReviewsByCategory('후기');

    $(".categoryBtn").click(function() {
        var category = $(this).data("category");
        var prdtId = $("#prdtId").val(); // 선택한 상품의 ID 가져오기
        getReviewsByCategory(category);
    });

    function getReviewsByCategory(category, prdtId) {
        $.ajax({
            url: 'getReviewsByCategory',
            method: 'POST',
            data: { category: category, prdtId: prdtId },
            dataType: 'json',
            success: function(data) {
                var reviewList = data;
                var reviewListContainer = $('#categoryReviewList').find('ul.list-group');
                reviewListContainer.empty(); // 기존 데이터 초기화

                for (var i = 0; i < reviewList.length; i++) {
                    var review = reviewList[i];
                    var reviewDate = new Date(review.reviewDate);
                    var options = { year: 'numeric', month: 'long', day: 'numeric' };
                    var formattedDate = reviewDate.toLocaleDateString('ko-KR', options);
                    var reviewListItem = '<li class="list-group-item">' +
                        '<h5 class="mb-1">' + review.reviewTitle + '</h5>' +
                        '<small class="text-muted">' + review.memberEmail + ' | ' + formattedDate + '</small>' +
                        '<p class="mb-1">' + review.reviewContent + '</p>' +
                        '</li>';
                    reviewListContainer.append(reviewListItem);
                }
            }
        });
    }
});
</script>
</html>