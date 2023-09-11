<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.list-group {
	margin-top : 3%;

}
.list-group-item {
    margin-left: 394px;
    margin-right: 394px;
    position: absolute;
}

#categoryBtn {
    position: relative;
    top: 50px; 
    left: 1350px;
}

#categoryBtn2 {
    position: relative;
    top: 50px;
    left: 1350px;
}

#openReviewModal {
    position: absolute;
    margin-top : 50px;
    left: 400px;
}

.rating-stars {
	padding-bottom : 10px;
    color: #FFD700;
}

.comment-list {
    list-style-type: none;
    padding: 10px 0 0 0; 
    margin-left: 20px;
    margin-right: 20px;
}

.comment-list li {
    margin-bottom: 20px;
    border: 1px solid #ddd;
    padding: 10px;
    background-color: #f9f9f9;
}

.comment-author {
    font-weight: bold;
    color: #333;
}

.comment-date {
    color: #777;
}

.comment-content {
    margin-top: 10px;
    font-size: 14px;
    line-height: 1.4;
    color: #333;
}

.editComment_btn, .deleteComment_btn {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 5px 10px;
    font-size: 12px;
    cursor: pointer;
    margin-right: 5px;
    position: relative;
    
}

.updateRv_btn, .deleteRv_btn{
  background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 5px 10px;
    font-size: 12px;
    cursor: pointer;
    margin-right: 5px;

}
#commentForm {
    margin-top: 20px;
    padding-top: 10px;
    border-top: 1px solid #ddd;
}

#newComment {
    width: 100%;
    padding: 5px;
}

#postCommentBtn {
    margin-top: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

#updateCommentModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal {
    display: none; 
    position: fixed; 
    z-index: 1000; 
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
}


.modal-content {
    background-color: #fff;
    margin: 10% auto; /* 모달을 수직 가운데로 정렬 */
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px; /* 모달의 최대 너비를 설정 */
}

.modal-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

/* 리뷰 제목 스타일 */
#reviewTitle {
    width: 100%; /
    padding: 10px; 
    margin-bottom: 10px; 
}

/* 리뷰 내용 스타일 */
#reviewContent {
    width: 100%; 
    height: 200px; 
    padding: 10px; 
    margin-bottom: 10px; 
}

#updateReviewTitle{
	 width: 100%; 
    padding: 10px; 
    margin-bottom: 10px; 


}

#updateReviewContent{
	width: 100%; 
    height: 200px; 
    padding: 10px; 
    margin-bottom: 10px; 

}

#updateCommentContent {
    width: 100%;
    padding: 5px;
}

#updateComment_btn {
    margin-top: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.close {
    float: right;
    cursor: pointer;
    font-size: 20px;
    font-weight: bold;
}
.container {
    margin-bottom: 50px;
}

.plus {
    background-color: #007bff; 
    color: #fff; 
    font-size: 18px; 
    border: none; 
    border-radius: 5px; 
    padding: 5px 10px; 
    cursor: pointer; 
    margin-bottom: 10px;
}

.minus {
    background-color: #dc3545;
    color: #fff; 
    font-size: 18px; 
    border: none; 
    border-radius: 5px; 
    padding: 5px 10px; 
    cursor: pointer; 
    margin-bottom: 10px;
}
 #like_icon {
    width: 35px;
    height: 35px;
}

  #like_button {
        padding: 0;  
        border: none; 
        background: none; 
        margin-bottom: 10px; 
    }
    #like_btn span {
        font-weight: bold; /* 굵은 텍스트 스타일을 적용 */
        margin-right: 5px; 
    }
   .box {
   	margin-top: 200px;
    margin-left: 10px;
    margin-right: 20%;
    max-width: 1400px;
    
   
   }
   
   .prdtDetail {
    width: 55%; 
    margin-top: 30px; 
    margin-bottom: 10px; 
    margin-left: 405px;
    font-size: 20px; 
}

    .button-container .btn {
        margin-right: 10px; /* 오른쪽 여백을 10px로 설정합니다. */
    }

</style>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
    rel="stylesheet">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdt/prdtInfo.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>상품 상세 정보</title>
</head>
<body>


    <div class="box">
        <div class="row">
            <div class="col-md-15">
	            <form name="prdtInfo" method="post">
							  <input type="hidden" name="prdtId" id="prdtId" value="${prdtInfo.prdtId}">
				</form>
				
				
				
				
                <h3>${prdtInfo.prdtName}</h3>  
                <p>${prdtInfo.prdtContents}</p>
                <div id="prdtImg">
				<img alt="" src="${pageContext.request.contextPath}${prdtInfo.prdtThumPath}${prdtInfo.prdtThum}" style="width: 250px; height: 300px;">
				</div>
                <br>
                <p><b>상품번호 : </b><span class="badge badge-info">${prdtInfo.prdtId}</span>
                <p><b>카테고리</b> : ${prdtInfo.prdtCate}<br>
                <b>상품가격 : ${prdtInfo.prdtPrice}원</b>  
                <div id="like_btn" style="display: inline-block;">
				    <span>좋아요 : </span>
				    <button type="button" id="like_button">
				        <img id="like_icon" src="${pageContext.request.contextPath}/resources/svg/disLike.svg" alt="DisLike">
				    </button>
				</div>
                
                
                <p><b>사이즈 :</b> <select id="sizeSelect" name="prdtOption">
				    <option value="선택하세요">선택하세요</option>
				    <option value="S">S</option>
				    <option value="M">M</option>
				    <option value="L">L</option>
				</select><br>
				<p><b>선택한 옵션: </b><span id="selectedOptionDisplay"></span></p>
                <b>구입 수량</b>
				 <button type="button" class="plus">+</button>
				 <input type="number" class="numBox" min="1" max="${prdtInfo.prdtCount}" value="1" readonly="readonly"/>
				 <button type="button" class="minus">-</button>
				<div>
                <p><a href="#" class="btn btn-primary" id="addCart_btn">장바구니에 담기 &raquo;</a> 
                <a href="<c:url value="prdtList"/>" class="btn btn-secondary">상품 목록 &raquo;</a>
                <a href="<c:url value="cartList"/>" class="btn btn-secondary">장바구니 &raquo;</a>
                </div>
            </div>
        </div>
       
        <hr>
  <div class="d-flex button-container">
    <button type="submit" class="btn btn-primary" id="delete_btn">삭제</button>
    <button type="submit" class="btn btn-primary" id="update_btn">수정</button>
</div>
    </div>
	    <script>
			var memberGrd = "${memberGrd}"; 
			
			var deleteBtn = document.getElementById("delete_btn");
			var updateBtn = document.getElementById("update_btn");
			
			// memberGrd가 "A1"인 경우에 안보이게
			if (memberGrd === "A1") {
			    deleteBtn.style.display = "none"; 
			    updateBtn.style.display = "none"; 
			} else {
			    deleteBtn.style.display = "block"; 
			    updateBtn.style.display = "block"; 
			}
	</script>
    </div>
		<div class="prdtDetail">
		<p>${prdtInfo.prdtDetail}</p>
		
		</div>
	 
	
   <!--리뷰 작성 폼  -->
<div id="reviewModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeReviewModal">&times;</span>
        <h4 class="modal-title">후기(문의) 작성</h4>
        <form id="reviewForm">
            <input type="hidden" name="prdtId" value="${prdtInfo.prdtId}">
            <input type="hidden" name="memberEmail" id="memberEmail" value="${member.memberEmail}">
            <div class="input_area">
                <input type="radio" name="category" value="후기" id="category" checked>
                <label for="category">후기</label>

                <input type="radio" name="category" value="상품문의" id="category2">
                <label for="category2">상품문의</label>
            </div>
            <div class="input_area" id="ratingInputArea">
                <label for="rating">평점:</label>
                <select name="rating" id="rating">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="input_area">
                <input type="text" name="reviewTitle" id="reviewTitle" placeholder="후기() 제목">
            </div>
            <div class="input_area">
                <textarea name="reviewContent" id="reviewContent" placeholder="내용을 작성해주세요"></textarea>
            </div>
            <div class="input_area">
                <button type="button" class="btn btn-primary" id="review_btn">작성하기</button>
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
                        <label for="reviewContent">후기 내용</label>
                        <textarea class="form-control" name="reviewContent" id="reviewContent" ></textarea>
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
		
		
		<!--클릭시 해당 카테고리에 해당하는 글 출력 -->
		<button class="btn btn-primary" id="categoryBtn"   data-category="후기">후기</button>
		<button class="btn btn-primary" id="categoryBtn2" data-category="상품문의">상품문의</button>

		<!-- 리뷰 목록과 댓글 목록 -->
		<div id="categoryReviewList">
		    <ul class="list-group">
		        <!-- 리뷰 목록 아이템 -->
		        <li class="list-group-item" data-review-id="1">
		            <button type="button" class="deleteRv_btn">삭제</button>
		            <button type="button" class="updateRv_btn" data-review-id="1">수정</button>
		            <ul class="comment-list">
		            </ul>
		        </li>
		    </ul>
		</div>
		
				
	<!-- 모달 창(후기 수정) -->
	<div id="updateReviewModal" class="modal">
	    <div class="modal-content">
	        <span class="close" id="closeUpdateReviewModal">&times;</span>
	        <h4 class="modal-title">후기(문의) 수정</h4>
	        <form id="updateReviewForm">
	            <input type="hidden" name="reviewId" id="updateReviewId">
	            <div class="input_area">
	                <input type="text" name="reviewTitle" id="updateReviewTitle" placeholder="후기 제목">
	            </div>
	            <div class="input_area">
	                <label for="updateRating">평점:</label>
		                <select name="updateRating" id="updateRating">
		                    <option value="1">1</option>
		                    <option value="2">2</option>
		                    <option value="3">3</option>
		                    <option value="4">4</option>
		                    <option value="5">5</option>
		                </select>
            	</div>
	            <div class="input_area">
	                <textarea name="reviewContent" id="updateReviewContent" ></textarea>
	            </div>
	            <div class="input_area">
	                <button type="button" id="updateReview_btn">수정하기</button>
	            </div>
	        </form>
	    </div>
	</div>
	
	<!-- 모달 창(댓글 수정) -->
	<div id="updateCommentModal" class="modal">
	    <div class="modal-content">
	        <span class="close" id="closeUpdateCommentModal">&times;</span>
	        <h4 class="modal-title">댓글 수정</h4>
	        <form id="updateCommentForm">
	            <input type="hidden" name="commentId" id="updateCommentId">
	            <div class="input_area">
	                <textarea name="commentContent" id="updateCommentContent"></textarea>
	            </div>
	            <div class="input_area">
	                <button type="button" id="updateComment_btn">수정하기</button>
	            </div>
	        </form>
	    </div>
	</div>

</body>
<script>

$(document).ready(function() {
    // 페이지 로드 시 좋아요 상태를 세션에서 복원
    var prdtId = $("#prdtId").val();
    var isLiked = sessionStorage.getItem("isLiked_" + prdtId);

    if (isLiked === "true") {
        // 세션에 저장된 좋아요 상태가 true인 경우, 하트 이미지로 설정
        $("#like_icon").attr("src", "${pageContext.request.contextPath}/resources/svg/Like.svg");
    } else {
        // 세션에 저장된 좋아요 상태가 false인 경우, 빈 하트 이미지로 설정
        $("#like_icon").attr("src", "${pageContext.request.contextPath}/resources/svg/disLike.svg");
    }

    // 좋아요 버튼 클릭 이벤트 처리
    $("#like_button").click(function() {
        var isLiked = ($("#like_icon").attr("src") === "${pageContext.request.contextPath}/resources/svg/Like.svg");

        var prdtId = $("#prdtId").val();
        var requestData = JSON.stringify({ "prdtId": prdtId });

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/prdt/prdtLike",
            data: requestData,
            contentType: "application/json",
            success: function(response) {
                if (response === "success") {
                    isLiked = !isLiked; // 좋아요 상태 반전

                    if (isLiked) {
                        // 좋아요가 추가된 경우 하트로
                        $("#like_icon").attr("src", "${pageContext.request.contextPath}/resources/svg/Like.svg");
                    } else {
                        // 좋아요가 취소된 경우 빈 하트로
                        $("#like_icon").attr("src", "${pageContext.request.contextPath}/resources/svg/disLike.svg");
                    }

                    // 세션 업데이트
                    sessionStorage.setItem("isLiked_" + prdtId, String(isLiked));
                }
            },
            error: function(error) {
                console.error("좋아요 처리 중 에러 발생:", error);
            }
        });
    });
});

  	// 상품 수정, 삭제 
   $(document).ready(function() {
    $(document).on("click", "#delete_btn", function() {
        Swal.fire({
            title: '등록된 상품을 삭제하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소',
        }).then((result) => {
            if (result.isConfirmed) {
                var formObj = $("form[name='prdtInfo']");
                formObj.prop("action", "prdtDelete");
                formObj.prop("method", "post");
                formObj.submit();
            }
        });
    });

    $(document).on("click", "#update_btn", function() {
        Swal.fire({
            title: '등록된 상품을 수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '수정',
            cancelButtonText: '취소',
        }).then((result) => {
            if (result.isConfirmed) {
                var formObj = $("form[name='prdtInfo']");
                formObj.prop("action", "prdtUpdate");
                formObj.prop("method", "get");
                formObj.submit();
            }
        });
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
  	$("#sizeSelect").change(function () {
    var selectedOption = $(this).val(); // 선택한 옵션 값 가져오기
    var displayArea = $("#selectedOptionDisplay"); // 옵션을 표시할 요소 선택

    // 선택한 옵션이 "선택하세요"가 아닌 경우에만 표시
    if (selectedOption !== "선택하세요") {
        // 선택한 옵션을 표시할 요소에 텍스트 업데이트
        displayArea.text( selectedOption);
    } else {
        // "선택하세요"를 선택한 경우, 표시 요소를 숨김
        displayArea.text(""); // 표시 내용 초기화
    }
});
  	
  	
  	
  	 $("#addCart_btn").click(function(){
	   var prdtId = $("#prdtId").val();
	   var cartStock = $(".numBox").val();
	   var prdtOption = $("#sizeSelect").val();
	   
	   var data = {
	     prdtId : prdtId,
	     cartStock: cartStock,
	     prdtOption: prdtOption,
	     };
   
	   $.ajax({
	        url: "addCart",
	        type: "post",
	        data: data,
	        success: function(result){
	            if(result == "1") {
	            	 Swal.fire(
	             			  '장바구니에 담겼습니다.',
	             			  '',
	             			  'success'
	             			)
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
             url: "${pageContext.request.contextPath}/prdt/writeReview",
             type: "post",
             contentType: "application/json",
             data: JSON.stringify(data),
             success: function(result) {
                 if (result === "success") {
                     alert("리뷰가 작성되었습니다.");
                     // 모달 닫기 추가 해야함
                 } else {
                     alert(result); 
                 }
             },
             error: function(xhr, status, error) { 
                 console.error(xhr.responseText); 
                 Swal.fire(
             			  '본인이 구매한 상품만 후기 작성이 가능합니다.',
             			  '',
             			  'error'
             			)
             }
         });
     });
	
  // 상품문의 라디오 버튼 클릭 시 별점 체크란 숨기기
     $("#category2").click(function() {
         $("#ratingInputArea").hide();
     });

     // 후기 라디오 버튼 클릭 시 별점 체크란 보이기
     $("#category").click(function() {
         $("#ratingInputArea").show();
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
	    $("#categoryBtn").click(function() {
	        var category = $(this).data("category");
	        var prdtId = $("#prdtId").val();
	        
	        getReviewsByCategory(category, prdtId);
	    });
		
	    // 상품문의 버튼 클릭 시
	    $("#categoryBtn2").click(function() {
	        var category = $(this).data("category");
	        var prdtId = $("#prdtId").val();
	        
	        getReviewsByCategory(category, prdtId);
	    });

	    
	    function getReviewsByCategory(category) {
	        var prdtId = $("#prdtId").val();
	        $.ajax({
	            url: '${pageContext.request.contextPath}/prdt/getReviewsByCategory',
	            method: 'POST',
	            data: { category: category,
	            		prdtId: prdtId },
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
	                    
	                    // 리뷰 목록 아이템 생성
	                    var reviewListItem = document.createElement("li");
	                    reviewListItem.className = "list-group-item";
	                    reviewListItem.setAttribute("data-review-id", review.reviewId);
	                    
	                    
	                    var writeCommentButton = document.createElement("button");
	                    writeCommentButton.className = "writeComment_btn";
	                    writeCommentButton.setAttribute("data-review-id", review.reviewId);
	                    writeCommentButton.textContent = "댓글 작성";
	                    reviewListItem.appendChild(writeCommentButton);
	                    
	                    
	                    // 리뷰 내용과 작성일 표시
	                   reviewListItem.innerHTML = '<h5 class="mb-1">' + review.reviewTitle + '</h5>' +
					    '<small class="text-muted">' + review.memberEmail + ' | ' + formattedDate + '</small>' +
					    '<p class="mb-1">' + review.reviewContent + '</p>';
						
						if (category === '후기') {
						    reviewListItem.innerHTML += '<div class="rating-stars">' + calculateRatingHtml(review.rating) + '</div>';
						}
						
						reviewListItem.innerHTML += '<button type="button" class="deleteRv_btn">삭제</button>' +
						    '<button type="button" class="updateRv_btn" data-review-id="' + review.reviewId + '">수정</button>';
	                        
	                    // 리뷰 목록 아이템을 리뷰 목록 컨테이너에 추가
	                    reviewListContainer.append(reviewListItem);

	                    // 댓글 목록을 가져와서 해당 리뷰 아이템 아래에 추가
	                    getCommentsByReviewId(review.reviewId, reviewListItem);
	                }
	            }
	        });
	    }

	    // 댓글 목록을 가져오는 함수
	    function getCommentsByReviewId(reviewId, reviewListItem) {
	        $.ajax({
	            url: '${pageContext.request.contextPath}/prdt/readComment',
	            type: 'POST',
	            data: { reviewId: reviewId },
	            dataType: 'json',
	            success: function (comments) {
	                var commentList = '<ul class="comment-list">';

	                comments.forEach(function (comment) {
	                    var commentDate = new Date(comment.commentDate); 
	                    var options = { year: 'numeric', month: 'long', day: 'numeric' };
	                    var formattedCommentDate = commentDate.toLocaleDateString('ko-KR', options); 

	                    commentList += '<li data-comment-id="' + comment.commentId + '">' + // 이 부분을 수정
	                        '<p>' + comment.commentContent + '</p>' +
	                        '<small class="text-muted">' + comment.memberEmail + ' | ' + formattedCommentDate + '</small><br>' +
	                        '<button type="button" class="editComment_btn">수정</button>' +
	                        '<button type="button" class="deleteComment_btn">삭제</button>' +
	                        '</li>';
	                });

	                commentList += '</ul>';
	                commentList += '<form id="commentForm">';
	                commentList += '<input type="text" id="newComment" placeholder="댓글 작성">';
	                commentList += '<button type="button" id="postCommentBtn" data-review-id="' + reviewId + '">댓글작성</button>';
	                commentList += '</form>';
	                commentList += '</li>';
	                // 리뷰 아이템에 댓글 목록 추가
	                $(reviewListItem).append(commentList);
	                
	            },
	            error: function () {
	                alert('댓글을 가져오는 데 실패했습니다.');
	            }
	        });
	    }
	    
	    
	    
	    // 별점 계산
	   // 별점 계산
function calculateRatingHtml(rating) {
    var ratingHtml = '';
    for (var i = 0; i < 5; i++) {
        var starSvgPath = (i < rating) ?
            "${pageContext.request.contextPath}/resources/svg/star.svg" : // 꽉 찬 별의 SVG 파일 경로
            "${pageContext.request.contextPath}/resources/svg/star2.svg"; // 비어있는 별의 SVG 파일 경로

        var starElement = '<img src="' + starSvgPath + '" alt="Star" width="20" height="20" />';
        ratingHtml += starElement;
    }
    return ratingHtml;
}
	    
	    
//댓글 작성 
	$(document).on("click", "#postCommentBtn", function () {
    var reviewId = $(this).data("review-id");
    var commentContent = $("#newComment").val();

    // 댓글 내용이 비어 있는지 확인
    if (!commentContent) {
    	Swal.fire(
    			  '내용을 작성해주세요',
    			  '',
    			  'error'
    			)
        return;
    }

    // 댓글 작성 요청 데이터 준비
    var data = {
        reviewId: reviewId,
        commentContent: commentContent,
    };

    $.ajax({
        url: "${pageContext.request.contextPath}/prdt/writeComment",
        type: "post",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (result) {
            if (result === "success") {
                Swal.fire(
          			  '댓글이 작성 되었습니다.',
          			  '',
          			  'success'
          			)
            } else {
                alert("댓글 작성에 실패했습니다.");
            }
        },
        error: function () {
            alert("서버 오류로 인해 댓글 작성에 실패했습니다.");
        }
    });
});
 	
 	//댓글삭제 
    $(document).on("click", ".deleteComment_btn", function () {
    var commentItem = $(this).closest("li");
    var commentId = commentItem.data("comment-id");
    
    var confirmDelete = confirm("삭제하시겠습니까?");

    if (confirmDelete) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/prdt/deleteComment/" + commentId,
            success: function (data) {
                console.log("댓글이 삭제되었습니다.");
                commentItem.remove();
            },
            error: function (error) {
                if (error.status === 403) {
                	Swal.fire(
              			  '본인이 작성한 댓글만 삭제 가능합니다.',
              			  '',
              			  'error'
              			)
                } else {
                    console.error("댓글 삭제에 실패했습니다.");
                }
            }
        });
    }
});
	 	 
 	
   
    
 	
 	
 	
 // 댓글 수정 모달 창 열기
    $(document).on("click", ".editComment_btn", function() {
        var commentItem = $(this).closest("li"); // 클릭한 버튼이 속한 댓글 아이템 가져오기
        var commentId = commentItem.data("comment-id"); // 해당 댓글의 ID 가져오기
        var commentContent = commentItem.find("p:first").text(); // 댓글 내용 가져오기

        // 모달 창에 댓글 정보 채우기
        $("#updateCommentId").val(commentId);
        $("#updateCommentContent").val(commentContent);

        // 모달 창 열기
        $("#updateCommentModal").css("display", "block");
    });

    // 댓글 수정 모달 창 닫기
    $("#closeUpdateCommentModal").click(function() {
        $("#updateCommentModal").css("display", "none");
    });

    // 댓글 수정 버튼 클릭 시
    $("#updateComment_btn").click(function() {
    var commentId = $("#updateCommentId").val();
    var updatedCommentContent = $("#updateCommentContent").val(); // 댓글 내용 가져오기

    // 값이 비어 있는지 확인
    if (!updatedCommentContent) {
        alert("댓글 내용을 입력해주세요.");
        return;
    }

    var data = {
        commentId: commentId,
        commentContent: updatedCommentContent
    };

    $.ajax({
        url: "${pageContext.request.contextPath}/prdt/updateComment", // 댓글 수정을 처리할 서버 엔드포인트
        type: "post",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function(result) {
            if (result === "success") {
                alert("댓글이 수정되었습니다.");
                // 모달 창 닫기
                $("#updateCommentModal").css("display", "none");
                location.reload(); // 페이지 새로고침
            } else {
                alert("댓글 수정에 실패했습니다.");
            }
        },
        error: function(jqXHR) {
            if (jqXHR.status === 403) {
                alert("본인이 작성한 댓글만 수정이 가능합니다.");
            } else {
                alert("서버 오류로 인해 댓글 수정에 실패했습니다.");
            }
        }
    });
});
    
 	
 	
	    
    // 후기(문의)글 삭제
    $(document).on("click", ".deleteRv_btn", function () {
        let deleteChk = confirm("이 글을 삭제하시겠습니까?");
        if (deleteChk) {
            var reviewItem = $(this).closest("li");
            var reviewId = reviewItem.data("review-id");
            $.ajax({
                url: "${pageContext.request.contextPath}/prdt/deleteReview",
                type: "post",
                data: { reviewId: reviewId },
                success: function (result) {
                    if (result === "success") {
                    	Swal.fire(
                    			  '삭제 되었습니다.',
                    			  '',
                    			  'success'
                    			)
                        reviewItem.remove(); 
                    } else {
                        alert("후기 삭제에 실패했습니다.");
                    }
                },
                error: function (jqXHR) {
                	if(jqXHR.status === 403){
                		Swal.fire(
                  			  '본인이 작성한 글만 삭제 가능합니다.',
                  			  '',
                  			  'error'
                  			)
                	} else{
                		alert("실패 ㅠ");
                	}
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

 // 후기 수정 버튼 클릭 시
    $("#updateReview_btn").click(function () {
    var reviewId = $("#updateReviewId").val();
    var updatedReviewTitle = $("#updateReviewTitle").val(); // 후기 제목 가져오기
    var updatedReviewContent = $("#updateReviewContent").val(); // 후기 내용 가져오기
    var updatedRating = $("#updateRating").val(); // 별점 가져오기

    // 값이 비어 있는지 확인
    if (!updatedReviewTitle || !updatedReviewContent) {
        alert("리뷰 제목과 내용을 모두 입력해주세요.");
        return;
    }

    var data = {
        reviewId: reviewId,
        reviewTitle: updatedReviewTitle,
        reviewContent: updatedReviewContent,
        rating: updatedRating,
    };

    $.ajax({
        url: "${pageContext.request.contextPath}/prdt/updateReview", 
        type: "post",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (result) {
            if (result === "success") {
                alert("리뷰가 수정되었습니다.");
                // 모달 창 닫기
                $("#updateReviewModal").css("display", "none");
                location.reload();
            } else if (result === "forbidden") {
                alert("리뷰 수정 권한이 없습니다.");
            } else {
                alert("리뷰 수정에 실패했습니다.");
            }
        },
        error: function (jqXHR) {
            if (jqXHR.status === 403) {
            	Swal.fire(
            			  '본인이 작성한 글만 수정 가능합니다.',
            			  '',
            			  'error'
            			)
            } else {
                alert("ㅠㅠ.");
            }
        },
    });
});
</script>
</html>