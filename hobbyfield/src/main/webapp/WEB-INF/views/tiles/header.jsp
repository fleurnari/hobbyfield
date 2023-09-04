<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#nemo{
		background-color : red;
		border-radius : 70%;
		width : 15px;
		height : 15px;
		text-align : center;
		color : white;
		font-size : 10px;
		font-weight : bold;
	}
</style>

<link href="${pageContext.request.contextPath}/resources/css/theme.css?after" rel="stylesheet">
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FIELD</span></span></a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/clubMain">소모임</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/fundingPostList">펀딩</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath }/prdt/prdtList">쇼핑몰</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/point/pointList">포인트샵</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-bold" href="${pageContext.request.contextPath}/talent/talentList">재능기부</a></li>
            </ul>
            
            	<c:if test = "${member == null}">
            		<div class="ms-lg-5"><a class="btn header-btn" href="${pageContext.request.contextPath}/member/login">로그인</a></div>
          		</c:if>
          		<c:if test = "${member != null}">
          			 <div class="ms-lg-5">
          			    <img src="${pageContext.request.contextPath}/resources/img/push.png" width="30px" onclick="pushList()" style="position: relative;">
          			    <div id="nemo" style="position: absolute; top: 0px;"></div>
						<span>${member.memberNm} 님 환영합니다.</span>
						<a href="#" id="chat" title="채팅">채팅</a>
						<a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a>
						<c:if test="${member.memberGrd eq 'A3'}">
							<a href="${pageContext.request.contextPath}/admin/memberList">관리자 페이지</a>
						</c:if>
						<form action="${pageContext.request.contextPath}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn header-btn">로그아웃</button>
						</form>
                    </div>
          		</c:if>
          </div>
        </div>
      </nav>
      
      <!-- 모달 창 추가 -->
		<div class="modal" id="pushModal" tabindex="-1" aria-labelledby="pushModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="pushModalLabel">알림</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                
		                
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		            </div>
		        </div>
		    </div>
		</div>
      <script>
      pushCount();
    function pushList() {
    	var memberEmail = "${member.memberEmail}";
    	$.ajax({
    		url : '${pageContext.request.contextPath}/push/selectPushList',
			type : 'get',
			data : {"memberEmail" : memberEmail},
			dataType : "json",
	        success : function(data){
	         	var a='';
	         	 $.each(data, function(key, value){
	 	         	var pushDatetime = new Date(value.pushDatetime);
		         	var formattedDate = pushDatetime.getFullYear() + '-' + ('0' + (pushDatetime.getMonth() + 1)).slice(-2) + '-' + ('0' + pushDatetime.getDate()).slice(-2);
	         		a += '<div>';
					a += '<div class="small text-gray-500">'+ formattedDate +'</div>';
					a += '<span class="font-weight-bold"><a href="' + value.pushUrl + '">' + value.pushCntn + '</a></span>';
					a += '<img src="${pageContext.request.contextPath}/resources/img/close.png" width="30px" onclick="deletePush(' + value.pushId + ');">';
					a += '</div><hr/>';	
					
	         		 
	         		 
	         	 });
	         	 
	         	 $(".modal-body").html(a);
	         	 
	        }
    	
    	
    	});
    	
    	
        // 모달 보이기
        var pushModal = new bootstrap.Modal(document.getElementById('pushModal'));
        pushModal.show();
    }
    
  //목록 끝

  	//알림 삭제
  	function deletePush(pushId, element){
  		event.target.parentNode.nextElementSibling.remove();
  		event.target.parentNode.remove();
  		$('#nemo').text(Number($('#nemo').text()) - 1);
  		$.ajax({
  	        url : '${pageContext.request.contextPath}/push/deletePush',
  	        type : 'post',
  	        data : {'pushId' : pushId},
  	        dataType : "json",
  	        success : function(){
  	        	
  	        	
  	        }
  	   	});
  	
  	
  	}


  //알림 수 
  function pushCount(){
	  var memberEmail = "${member.memberEmail}";
	  
  	 $.ajax({
  	        url : '${pageContext.request.contextPath}/push/selectPushCount',
  	        type : 'get',
  	        data : {"memberEmail" : memberEmail},
  	        dataType : "json",
  	      	contentType : 'application/json; charset=utf-8',
  	        success : function(push){
  	        	console.log(push);
  	        	$('#nemo').text(push);
  	        }
  	    
  	    });
  }
  
  
	$("#chat").on('click',function(e){
		e.preventDefault();
		window.open("${pageContext.request.contextPath}/chat/chatting","chat","width=500, height=800, top=200, left=200");
        // 경로, 파일, 너비, 높이, 위치 지정
	})
  
 
	</script>