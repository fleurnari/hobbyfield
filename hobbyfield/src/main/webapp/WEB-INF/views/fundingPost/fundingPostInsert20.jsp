<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<style>
.ck.ck-editor {
	width: 100%;
	margin: 0 auto;
}
.ck-editor__editable {
	height: 30vh;
}

</style>
</head>
<body>
	<br><br><br><br>
	<div class="container">
			<div class="text-center">
			  <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
            </div>
            <br>
            <br>
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
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/ParticipantsList'">   |  인기</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/endDateList'"> |  마감임박</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/notice/noticeList?noticeCate=AA3'"> |  공지사항</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingSupportList'"> |  후원현황</span>&nbsp;&nbsp;
              <span onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostInsertForm'"> |  프로젝트만들기</span>
           	  <c:if test="${member.memberGrd eq 'A3'}">
                	<span onclick="location.href='${pageContext.request.contextPath}/fundingPost/adminAccept'"> |  프로젝트 승인</span>
                </c:if>
            </div>
        </div>
   <section>
         <div class="text-center">
            <h4><span style="color:red;">프로젝트 설정</span><span> | </span><span  onclick="location.href='${pageContext.request.contextPath}/fundingPost/fundingPostGoods?fndPostNumber=${fundingPostInsert20.fndPostNumber}'">옵션 구성</span></h4>
                  <p>프로젝트를 설정해주세요</p>
               </div>
               <br>
               <hr>
         <div class="text-center">
            <form id="frm" name="fundingPostUpdate" action="fundingPostUpdate"
               method="post">
            
               <div class="container">   
                  <div class="row">
                     <div class="col-sm-6">
                        <h4>
                           목표금액<a style="color: red">*</a>
                        </h4>
                        <p>
                           프로젝트를 완수하기 위해 필요한 금액을 설정해주세요. <br>
                        </p>
                        <a tabindex="0" class="btn btn-lg btn-danger" role="button"
                           data-bs-toggle="popover" data-bs-trigger="focus"
                           title="Dismissible popover"
                           data-bs-content="●종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.<br>●후원 취소 및 결제 누락을 대비해 10% 이상 초과 달성을 목표로 해주세요.<br>●제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.">▼
                           목표 금액 설정시 꼭 알아두세요!</a>
                     </div>
                     <div class="col-sm-6">
                        <div class="input-group mb-3">
                           <input type="text" class="form-control"
                              aria-label="Recipient's username" name="fndTargetAmount" value="${fundingPostInsert20.fndTargetAmount }"
                              aria-describedby="basic-addon2" > <span
                              class="input-group-text" id="basic-addon2">원</span>
                        </div>
                     </div>
                  </div>
                  <br> 
                  <hr>
                  <br>
                  <div class="row">
                     <div class="col-sm-6">
                        <h4>
                           펀딩 일정<a style="color: red">*</a>
                        </h4>
                        <p>
                           설정한 일시가 되면 펀딩이 자동 시작됩니다.<br> 펀딩 시작 전까지 날짜를 변경할 수 있고<br>
                           즉시 펀딩을 시작할 수 있습니다.<br>
                        </p>
                     </div>
                    <div class="col-sm-6">
  <div class="mb-3">
    시작 날짜: 
    <input type="date" name="fndStartDate" value="${fundingPostInsert20.fndStartDate}" id="startDate">
  </div>
  <br>
  <div class="mb-3">
    종료 날짜: 
    <input type="date" name="fndEndDate" value="${fundingPostInsert20.fndEndDate}" id="endDate">
  </div>
</div>
                  </div>
                  <hr>
                  <div class="row">
                     <div class="col-sm-6">
                        <h4>
                           펀딩 내용<a style="color: red">*</a>
                        </h4>
                        <p>
                           펀딩을 설명하는 상세 내용을 자유롭게 등록해주세요.<br> 펀딩 내용은 상세보기의 하단에 위치하며<br>
                           이미지와 텍스트로 자유롭게 프로젝트를 설명할 수 있습니다.<br>
                        </p>
                     </div>
                     <div class="col-sm-6">
                        <textarea class="form-control" name="fndContent" id="fndContent" width=610px >${ fundingPostInsert20.fndContent }</textarea>
                     </div>
                  </div>
               </div>
               <br>
               <input type="hidden" name="fndStatus" value="0">
               <input type="hidden" name="fndPostNumber" value="${ fundingPostInsert20.fndPostNumber}">
               <button type="submit" class="btn btn-primary"
                  style="float: right;">저장</button>
            </form>
         
         </div>

   </section>
</body>

<script type="text/javascript">
ClassicEditor
.create( document.querySelector( '#fndContent' ), {
   language:"ko",
   ckfinder: {
      uploadUrl : '${pageContext.request.contextPath}/ckeditor/upload'
   }
})
.then(editor => {
    // 에디터 인스턴스가 생성되면 호출되는 콜백 함수
    editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
})
.catch( error => {
    console.error( error );
});
    $('form').on('submit', function(e){
      e.preventDefault();
      const url = '${pageContext.request.contextPath}/fundingPost/fundingPostInsert20?fndPostNumber=${fundingPostInsert20.fndPostNumber}';
      

       // 필수 입력 필드가 모두 채워져 있을 때, AJAX 요청을 보냅니다.
       let objData = serializeObject();
      
      $.ajax({
         url : 'fundingPostUpdate',
         method : 'post',
         //비동기라고 json 방식으로 안보내도됨! 
         data : objData
      })
      .done(data => {
         if(data.result){
            Swal.fire({
                  title: '저장되었습니다', // 제목 추가
                    text: 'success' // 텍스트 추가
                    }).then(function () {

                    window.location.href = url;
                });
         }else{
            alert('저장되지 않았습니다.\n정보를 확인해주세요');
         }
      })
      .fail(reject => console.log(reject));
      
      return false;
   });
   

   function serializeObject(){
      let formData = $('form').serializeArray();
      // serialize는 폼태그에서만 사용가능하고 
      // 이런방식으로 [ { name : 'tilte, value='Hello'}, {name : 'writer', value : '여행자'}, ...]
      
      let formObject = {};
      $.each(formData, function(idx, obj){
         let field = obj.name;
         let val = obj.value;
         
         formObject[field] = val;
      })
      
      return formObject;
   };
   var today = new Date().toISOString().split("T")[0];
   document.getElementById("startDate").setAttribute("min", today);
   document.getElementById("endDate").setAttribute("min", today);
   
   document.addEventListener('DOMContentLoaded', function () {
       // 서버에서 받아온 날짜 데이터 (예: "2023-09-11 00:00:00")
//시작날짜와 종료일자를 가져옵니다.
const startDateString = "${fundingPostInsert20.fndStartDate}".split(" ")[0];
const endDateString = "${fundingPostInsert20.fndEndDate}".split(" ")[0];

//시작날짜와 종료일자 input 요소에 설정
document.querySelector('input[name="fndStartDate"]').value = startDateString;
document.querySelector('input[name="fndEndDate"]').value = endDateString;
   });
</script>
</html>