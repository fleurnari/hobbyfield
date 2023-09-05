<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .rating-stars {
        color: #FFD700; /* 부드러운 노란색을 사용 */
    }
</style>
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
	<!--상품상세정보  -->
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
			    <input type="number" name="rating" id="rating" min="1" max="5" step="1">
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
<button type="button" class="btn btn-primary" id="openReviewModal">후기 작성</button>

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
            <!-- 여기에 후기목록 출력 -->
            <li class="list-group-item" data-review-id="1">
                <button type="button" class="deleteRv_btn">삭제</button>
                <button type="button" class="updateRv_btn" data-review-id="1">수정</button>
            </li>
        </ul>
		</div>
		
		
			<div id="commentList">
			  <!-- 여기에 댓글이 동적으로 추가. -->
			</div>
		
				
	<!-- 모달 창(후기 수정) -->
	<div id="updateReviewModal" class="modal">
	    <div class="modal-content">
	        <span class="close" id="closeUpdateReviewModal">&times;</span>
	        <h4 class="modal-title">후기 수정</h4>
	        <form id="updateReviewForm">
	            <input type="hidden" name="reviewId" id="updateReviewId">
	            <div class="input_area">
	                <input type="text" name="reviewTitle" id="updateReviewTitle" placeholder="후기 제목">
	            </div>
	            <div class="input_area">
	                <textarea name="reviewContent" id="updateReviewContent"></textarea>
	            </div>
	            <div class="input_area">
	                <button type="button" id="updateReview_btn">수정하기</button>
	            </div>
	        </form>
	    </div>
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
         var rating = $("#rating").val();
         
         var data = {
        		    prdtId: prdtId,
        		    reviewTitle: reviewTitle,
        		    reviewContent: reviewContent,
        		    category: category,
        		    rating: rating,
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
                 getReviewsByCategory(category);

             },
             error: function() {
                 alert("리뷰 작성에 실패하였습니다.");
             }
         });
     });

</script>

<script>

function appendButtonsToReviewItem(reviewItem) {
    var deleteButton = document.createElement("button");
    deleteButton.textContent = "삭제";
    deleteButton.className = "deleteRv_btn";

    var updateButton = document.createElement("button");
    updateButton.textContent = "수정";
    updateButton.className = "updateRv_btn";

    reviewItem.appendChild(deleteButton);
    reviewItem.appendChild(updateButton);
}


	//후기
	$(document).ready(function() {
	    // 페이지 로딩 시에 '후기'에 해당하는 후기 먼저 출력
	    getReviewsByCategory('후기');
	    $(".categoryBtn").click(function() {
	        var category = $(this).data("category");
	        var prdtId = $("#prdtId").val();
	        
	        console.log("카테",category);
	        console.log("상품번호",prdtId);
	        getReviewsByCategory(category, prdtId);
	    });
	
	    
	    
	    function getReviewsByCategory(category) {
	    	  $.ajax({
	    	    url: 'getReviewsByCategory',
	    	    method: 'POST',
	    	    data: { category: category },
	    	    dataType: 'json',
	    	    success: function (data) {
	    	      var reviewList = data;
	    	      var reviewListContainer = $('#categoryReviewList').find('ul.list-group');
	    	      reviewListContainer.empty(); // 기존 데이터 초기화
	
	    	      for (var i = 0; i < reviewList.length; i++) {
	    	        var review = reviewList[i];
	    	        var reviewDate = new Date(review.reviewDate);
	    	        var options = { year: 'numeric', month: 'long', day: 'numeric' };
	    	        var formattedDate = reviewDate.toLocaleDateString('ko-KR', options);
	    	        var reviewListItem = document.createElement("li");
	    	        reviewListItem.className = "list-group-item";
	
	    	        // 별점 계산 및 HTML 생성
	    	        var ratingHtml = calculateRatingHtml(review.rating);
	
	    	        var commentInputHtml = '<div class="input_area">' +
	    	          '<textarea name="commentContent" id="commentContent_' + review.reviewId + '" placeholder="내용을 입력하세요"></textarea>' +
	    	          '</div>' +
	    	          '<button type="button" class="writeComment_btn" data-review-id="' + review.reviewId + '">댓글 작성</button>';
	
	    	        reviewListItem.innerHTML = '<h5 class="mb-1">' + review.reviewTitle + '</h5>' +
	    	          '<small class="text-muted">' + review.memberEmail + ' | ' + formattedDate + '</small>' +
	    	          '<p class="mb-1">' + review.reviewContent + '</p>' +
	    	          '<div class="rating-stars">' + ratingHtml + '</div>'
	    	          + commentInputHtml;
	
	    	        // 후기 목록 아이템에 버튼 추가
	    	        appendButtonsToReviewItem(reviewListItem);
	
	    	        reviewListContainer.append(reviewListItem);
	
	    	        // 리뷰 아이템에 대한 댓글을 가져오고 표시
	    	        getCommentsByReviewId(review.reviewId);
	    	      }
	    	    }
	    	  });
	    	}
		
	    
	    function getCommentsByReviewId(reviewId) {
	    	  $.ajax({
	    	    url: 'readComment',
	    	    type: 'POST',
	    	    data: { reviewId: reviewId },
	    	    dataType: 'json',
	    	    success: function (comments) {
	
	    	      var commentList = $('#commentList'); 
	
	    	      comments.forEach(function (comment) {
	    	      var commentHtml = '<li>' +
	    	      '<p>' + comment.commentContent + '</p>' +
	              '<p class="comment-author">작성자: ' + comment.memberEmail + '</p>' +
	              '<p class="comment-date">작성일: ' + comment.formattedDate + '</p>' +
	              '</li>';
	    	        commentList.append(commentHtml);
	    	      });
	    	    },
	    	    error: function () {
	    	      alert('댓글을 가져오는 데 실패했습니다.');
	    	    }
	    	  });
	    	}
	    
	    
	    
	    // 별점 계산
	    function calculateRatingHtml(rating) {
	        var ratingHtml = '';
	        for (var i = 0; i < 5; i++) {
	            if (i < rating) {
	                ratingHtml += '<span class="rating-stars">\u2605</span>'; // 채워진 별 아이콘
	            } else {
	                ratingHtml += '<span class="rating-stars">\u2606</span>'; // 비어있는 별 아이콘
	            }
	        }
	        return ratingHtml;
	    }
	    
	    
	 	// 댓글 작성 버튼에 대한 이벤트 핸들러를 추가합니다.
	    $(document).on("click", ".writeComment_btn", function () {
	        // 해당 리뷰의 ID를 가져옵니다.
	        var reviewId = $(this).data("review-id");
	
	        // 해당 리뷰의 댓글 내용을 가져옵니다.
	        var commentContent = $("#commentContent_" + reviewId).val();
	
	        // 필요한 데이터를 준비합니다.
	        var data = {
	            reviewId: reviewId,
	            commentContent: commentContent
	        };
	
	        // AJAX 요청을 보냅니다.
	        $.ajax({
	            url: "writeComment", // 댓글 작성을 처리할 서버 엔드포인트
	            type: "post",
	            contentType: "application/json",
	            data: JSON.stringify(data),
	            success: function (result) {
	                if (result === "success") {
	                    alert("댓글이 작성되었습니다.");
	                } else {
	                    alert("댓글 작성에 실패했습니다.");
	                }
	            },
	            error: function () {
	                alert("서버 오류로 인해 댓글 작성에 실패했습니다.");
	            }
	        });
	    });
		
	    
	    // 삭제
	    $(document).on("click", ".deleteRv_btn", function () {
	        let deleteChk = confirm("이 글을 삭제하시겠습니까?");
	        if (deleteChk) {
	            var reviewItem = $(this).closest("li");
	            var reviewId = reviewItem.data("review-id");
	            $.ajax({
	                url: "deleteReview",
	                type: "post",
	                data: { reviewId: reviewId },
	                success: function (result) {
	                    if (result === "success") {
	                        alert("리뷰가 삭제되었습니다.");
	                        reviewItem.remove(); 
	                    } else {
	                        alert("리뷰 삭제에 실패했습니다.");
	                    }
	                },
	                error: function () {
	                    alert("서버 오류로 인해 리뷰 삭제에 실패했습니다.");
	                },
	            });
	        }
	    });
	 });
</script>

<script>
    // 리뷰 수정 모달 창 열기
    $(document).on("click", ".updateRv_btn", function() {
        var reviewId = $(this).closest("li").data("review-id");
        var reviewTitle = $(this).siblings("h5").text(); // 리뷰 제목 가져오기
        var reviewContent = $(this).siblings("p").text(); // 리뷰 내용 가져오기

        // 모달 창에 리뷰 정보 채우기
        $("#updateReviewId").val(reviewId);
        $("#updateReviewTitle").val(reviewTitle);
        $("#updateReviewContent").val(reviewContent);

        // 모달 창 열기
        $("#updateReviewModal").css("display", "block");
    });

    // 리뷰 수정 모달 창 닫기
    $("#closeUpdateReviewModal").click(function() {
        $("#updateReviewModal").css("display", "none");
    });

 // 리뷰 수정 버튼 클릭 시
    $("#updateReview_btn").click(function() {
        var reviewId = $("#updateReviewId").val();
        var updatedReviewTitle = $("#updateReviewTitle").val(); // 리뷰 제목 가져오기
        var updatedReviewContent = $("#updateReviewContent").val(); // 리뷰 내용 가져오기

        // 값이 비어 있는지 확인
        if (!updatedReviewTitle || !updatedReviewContent) {
            alert("리뷰 제목과 내용을 모두 입력해주세요.");
            return;
        }

        var data = {
                reviewId: reviewId,
                reviewTitle: updatedReviewTitle,
                reviewContent: updatedReviewContent
            };
        
        $.ajax({
            url: "updateReview", // 리뷰 수정을 처리할 서버 엔드포인트
            type: "post",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(result) {
                if (result === "success") {
                    alert("리뷰가 수정되었습니다.");
                    // 모달 창 닫기
                    $("#updateReviewModal").css("display", "none");
                    location.reload();
                } else {
                    alert("리뷰 수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 오류로 인해 리뷰 수정에 실패했습니다.");
            }
        });
    });
</script>
</html>