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

        <div class="container-lg">
          <div class="row justify-content-center">
            <div class="col-12">
              <h1 class="text-center lh-sm fs-lg-6 fs-xxl-7">회원 가입</h1>
            </div>
          </div>
          <div class="row h-100 justify-content-center">
            <div class="col-md-4 pt-6 px-sm-7 px-md-2 px-lg-3">
              <div class="card h-100 rounded-3 bg-soft-primary">
                <div class="bg-holder rounded-3" style="background-image:url(${pageContext.request.contextPath}/resources/img/pricing-primary.png);background-position:top right;background-size:auto;">
                </div>
                <!--/.bg-holder-->

                <div class="card-body z-index-2">
                  <div class="ms-4">
                     <h2 class="card-title mb-4 text-primary">일반 회원</h2>
                      <p class="card-text mb-4 fs-1 pe-xxl-8">소모임을 통한 자유로운 취미 활동을 할 수 있습니다.</p>
                  </div>
                  <div class="my-5 text-center">
                    <button onclick="location.href='generalMemberJoin'" class="btn btn-lg btn-outline-primary rounded-pill" type="button">가입하기</button>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-4 pt-6 px-sm-7 px-md-2 px-lg-3">
              <div class="card h-100 rounded-3 bg-soft-success">
                <div class="bg-holder rounded-3" style="background-image:url(${pageContext.request.contextPath}/resources/img/pricing-success.png);background-position:top right;background-size:auto;">
                </div>
                <!--/.bg-holder-->

                <div class="card-body z-index-2">
                  <div class="ms-4">
                      <h2 class="card-title mb-4 text-success">기업 회원</h2>
                      <p class="card-text mb-4 fs-1 pe-xxl-8">쇼핑몰에서 상품을 판매할 수 있습니다.</p>
                  </div>
                  <div class="my-5 text-center">
                    <button onclick="location.href='companyMemberJoin'" class="btn btn-lg btn-outline-success rounded-pill" type="button">가입하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div><!-- end of .container-->
      </section>
</body>
</html>