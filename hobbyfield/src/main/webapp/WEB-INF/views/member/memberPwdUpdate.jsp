<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section class="bg-100 py-7" id="packages">
     <form>
       <div class="container-lg">
          <div class="row justify-content-center">
            <div class="col-12">
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">비밀번호 변경</h1>
            </div>
          </div>
          <input type="hidden" id="memberEmail" name="memberEmail" value="${info.memberEmail}">
			<div>
				<p>변경하실 비밀번호를 입력해 주세요.</p>
				<div>
					<input type="password" id="memberPwd" name="memberPwd" placeholder="현재 비밀번호" />
				</div>
				<div>
					<input type="password" id="memberPwd1" name="memberPwd1" placeholder="새 비밀번호" />
				</div>
				<div>
					<input type="password" id="memberPwd2" name="memberPwd2" placeholder="새 비밀번호 확인" />
				</div>				
			</div>
        </div>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/memberUpdate'">뒤로 가기</button>
        </form>
   </section>
   <script>
   
   </script>
</body>
</html>