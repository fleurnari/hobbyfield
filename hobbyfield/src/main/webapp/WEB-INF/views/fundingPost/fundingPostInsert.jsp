<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="../resources/css/prdt/bootstrap.min.css" rel="stylesheet">
<style>
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}
.option-box {
	width: 400px; /* 옵션창을 더 길게 만들기 */
	margin: 10px; /* 간격을 주기 위한 margin 추가 */
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 10px; /* 모서리 둥글게 설정 */
}

.option-box:hover {
	background-color: #f0f0f0;
}

.option-name {
	font-weight: bold;
	margin-top: 10px;
}

.option-description, .option-details {
	display: none;
	margin-top: 10px; /* 조금 더 큰 간격 */
}

.option-box.active .option-description, .option-box.active .option-details
	{
	display: block;
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
<Section>
	<div class="container">
			<h4>작성중인 프로젝트가 있습니다<a style="color: red">*</a></h4>
		<div class="container2">
			<c:forEach items="${fundingPostList }" var="fundingPost">
				<c:if test="${fundingPost.fndStatus eq '0' }">
				<c:if test="${fundingPost.memberEmail eq member.memberEmail }">
				
<form action="fundingPostDelete" method="post" id="deleteFnd">
    <div class="option-box text-center">
        <div class="row">
            <div class="col-sm-6">
                <div class="mb-2">
                	<p class="option-name">${fundingPost.fndCategory }</p>
                    <p class="option-name">${fundingPost.fndTitle}</p>
                    <input type="hidden" id="fndPostNumber" name="fndPostNumber" value="${fundingPost.fndPostNumber}">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="mb-2">
                    <p>
                            <button type="button" class="btn btn-dark" onclick="location.href='fundingPostInsert20?fndPostNumber=${fundingPost.fndPostNumber}'">이어서 작성 -></button>
                     </p>   
                      <p> 
                            <button type="submit" id="fndDelete" name="fndDelete" class="btn btn-dark">삭제</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
</form>
				</c:if>
				</c:if>
			</c:forEach>
		</div>
	</div>
</Section>
	<section>
		<div class="container">
			<div class="text-center">
				<form id="insertCateGory" name="insertPostForm" action="fundingPostInsert" method="post">
					<div>
						<h3>어떤 프로젝트를 계획중이신가요?</h3>
						<p>프로젝트의 카테고리를 선택해주세요</p>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<hr>
					<div class="container">
						
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 카테고리<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 성격과 가장 일치하는<br> 카테고리를 선택하세요.
								</p>
							</div>
							<div class="col-sm-6">
								<select class="form-select" name="fndCategory" aria-label="Default select example">
									<c:forEach items="${category}" var="cate">
										<option value="${cate.subcode}">${cate.literal}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					<br>
					<br>
					<hr>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 제목<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 제목을<br> 적어주세요.
								</p>
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text"
									placeholder="프로젝트 제목을 입력해 주세요."
									name="fndTitle"
									aria-label="default input example">
							</div>
						</div>
					<br>
					<hr>
						<div class="row">
							<div class="col-sm-6">
								<h4>
									프로젝트 대표이미지<a style="color:red">*</a>
								</h4>
								<p>
									프로젝트 주제와 창작물의<br> 특징에 알맞은 이미지를 등록해주세요.<br>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="profileSection">
         <label>첨부이미지</label>
         <div id="preview"></div>
			<input name="uploadFile" type="file" value="profileImg" onchange="readURL(this);" accept=".gif, .jpg, .png">
			<button type="button" id="uploadBtn">upload</button>
		</div>
								</div>
							</div>
						</div>
					</div>
					<br>
						<input type="hidden" name="fndStatus" value=0>
                        <button id="submitButton" type="submit" class="btn btn-primary" style="float:right;" disabled>확인</button>
                </form>
              </div>
             </div>
            </section>
                <script>
                /* 이미지 업로드 */
                function imgUploadHandler(list) {
              			for (i = 0; i < list.length; i++) {
              				let tag = `<input type="hidden" name="fndMainImg" value="\${list[i].UUID}">
              				           <input type="hidden" name="fndMainImgPath" value="\${list[i].url}">`
              				$('#insertCateGory').append(tag);
              			}
              		}
  
                
                
                
                
                var form = document.getElementById('frm');
                var submitButton = document.getElementById('submitButton');
                var fndCateGory = document.querySelector('[name="insertCateGory"]');

                function validateForm() {
                    var allInputs = form.querySelectorAll('select, input');
                    return Array.from(allInputs).every(function(input) {
                        return input.value.trim() !== '' || input.type === 'hidden';
                    });
                }
				
                var fileInput = document.querySelector('input[type="file"]');
                var uploadButton = document.getElementById('uploadBtn');
                var submitButton = document.getElementById('submitButton');
                var insertCateGory = document.getElementById('insertCateGory');
                var fndTitleInput = document.querySelector('input[name="fndTitle"]');

                function validateForm() {
                    return fileInput.files.length > 0 && uploadButton.clicked && insertCateGory.value !== "카테고리를 선택해주세요." && fndTitleInput.value.trim() !== '';
                }

                fileInput.addEventListener('change', function() {
                    submitButton.disabled = !validateForm();
                });

                insertCateGory.addEventListener('change', function() {
                    submitButton.disabled = !validateForm();
                });

                fndTitleInput.addEventListener('input', function() {
                    submitButton.disabled = !validateForm();
                });

                uploadButton.addEventListener('click', function() {
                    uploadButton.clicked = true;
                    submitButton.disabled = !validateForm();
                });

                submitButton.addEventListener('click', function() {
                    if (fndCateGory.value == '카테고리를 선택해주세요.') {
                        alert('카테고리를 선택해주세요.');
                        return;
                    }

                });
                
               
                $('#deleteFnd').on('submit', function(e){
            		e.preventDefault();
            		
            		
            		let fndPostNumber = $(this).find('input[name="fndPostNumber"]').val();
            		
            		$.ajax({
            			url : "fundingPostDelete",
            			method : "POST",
            			//비동기라고 json 방식으로 안보내도됨! 
            			data : {
            				 fndPostNumber: fndPostNumber
            			}
            		})
            		.done(data => {
            			Swal.fire('삭제되었습니다.');
            		})
            		.fail(reject => console.log(reject));

            		location.reload();
            		
            	});
            	
                $('#submitButton').click(function(event) {
                	event.preventDefault();
                    // 확인 대화 상자를 띄우고 사용자의 선택을 받습니다.
                    Swal.fire({
                        title: '프로젝트를 생성하시겠습니까?',
                        text: "",
                        icon: 'success',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: '확인',
                        cancelButtonText: '취소'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // 리다이렉션을 여기에 추가
                            Swal.fire({
                                icon: 'success',
                                title: '저장되었습니다',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(() => {
                                // 확인 대화 상자의 닫힘 이후에 폼을 제출합니다.
                                $('#insertCateGory').submit();
                            });
                        }
                    });
                });
	</script>
</body>
</html>