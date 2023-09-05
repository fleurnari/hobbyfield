<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("URL을 직접 입력해서 접근하셨습니다.\n정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="${pageContext.request.contextPath}";
 </script>
<%
  return;
 }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/common.js"></script>
<style type="text/css">
.container2{
display:flex;
justify-content:space-between;
flex-wrap:wrap;
}

.item {
  width: 30%; 
  margin-bottom: 10px; 
}
#img{
	width: 333px;
	height: 333px;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

</head>
<body>
<Section>
    <br><br><br><br>
    <div class="container">
        <div class="text-center">
            <h4>
                <span onclick="location.href='${pageContext.request.contextPath}/fundingPostList'"><span class="fs-2 fw-bold text-primary ms-2">HOBBY<span class="text-warning">FUNDING</span></span></span>&nbsp;&nbsp;
                <span onclick="location.href='#'">카테고리</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">인기</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">마감임박</span>&nbsp;&nbsp;
                <span onclick="location.href='#'">공지사항</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingSupportList'" style="color:#5aa5db;">후원현황</span>&nbsp;&nbsp;
                <span onclick="location.href='${pageContext.request.contextPath}/fundingPostInsertForm'">프로젝트만들기</span>
            </h4>
        </div>
    </div>
    <br><br><br>
    <div class="text-center">
    <!-- 전체 리스트 다운로드 버튼 -->
   <a href="${pageContext.request.contextPath}/downloadExcel?fndPostNumber=${fundingSupport.fndPostNumber}" class="btn btn-success"> 전체 리스트 Excel 다운로드</a>
	</div>
    <div class="text-center">
        <table class="table table-condensed">
            <thead>
                <tr class="active">
                    <th>후원번호</th>
                    <th>총 결제 금액</th>
                    <th>구매자 ID</th>
                    <th>수신자</th>
                    <th>주문날짜</th>
                    <th>주문수량</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>요청사항</th>
                    <th>송장번호</th>
                    <th>주문상태</th>
                    <th>저장</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${supportManagement }" var="supportManagement">
            <form name="insertfundingInvoce" action="insertfundingInvoce" method="post">
                    <tr>
                        <td>${supportManagement.fndSupportNumber }</td>
                        <td>${supportManagement.fndTotalPrice }<span>원</span></td>
                        <td>${supportManagement.memberEmail }</td>
                        <td>${supportManagement.fndOrderRecipient }</td>
                        <td>${supportManagement.fndOrderDate }</td>
                        <td>${supportManagement.fndOrderAmount }</td>
                        <td>${supportManagement.fndZip } ${supportManagement.fndBaseAddr} ${supportManagement.fndDetaAddr }</td>
                        <td>${supportManagement.fndCntinfo }</td>
                        <td>${supportManagement.fndOrderRequest }</td>
                        <td><input type="text" name="fndInvoice" value="${supportManagement.fndInvoice }"></td>
                        <td name="fndOrderState">${supportManagement.fndOrderState }</td>
                        <td>
                                <input type="hidden" name="fndSupportNumber" value="${supportManagement.fndSupportNumber }">
                                <button type="submit" class="btn btn-primary">저장</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                			
            </tbody>
            
        </table>
    </div>
    			<div>
							<ul >
								<c:if test="${pageMaker.prev}">
				    			<li><a href="supportManagement${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				   				 </c:if> 
				
				    			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    			<li><a href="supportManagement${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    				</c:forEach>
				
				    			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    			<li><a href="supportManagement${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    			</c:if> 
									</ul>
						</div>
</Section>
				<input type="text" name="fndPostNumber" value="${fundingSupport.fndPostNumber}">
				<input type="text" name="fndPostNumber" value="${fndPostNumber}">
</body>
<script type="text/javascript">
function goToNextPage() {
    var fndPostNumber = document.getElementsByName("fndPostNumber")[0].value;
    window.location.href = "supportManagement?fndPostNumber=" + fndPostNumber;
}
$('#insertfundingInvoce').on('submit', function(e){
    e.preventDefault();
    
    // 모든 input 요소 중에서 name 속성이 'fndInvoice'인 요소를 선택
    var invoiceInputs = $('input[name="fndInvoice"]');
    
    // 각각의 입력 필드를 순환하면서 값을 가져와서 배열에 저장
    var invoices = [];
    invoiceInputs.each(function() {
        invoices.push($(this).val());
    });
    
    // invoices 배열을 JSON 문자열로 변환하여 데이터로 사용
    var jsonData = JSON.stringify(invoices);
    
    $.ajax({
        url: 'insertfundingInvoce',
        method: 'post',
        contentType: 'application/json', // JSON 데이터를 전송
        data: jsonData
    })
    .done(data => {
        if (data.result) {
            let message = '저장되었습니다.';
            alert(message);
            var fndPostNumber = document.getElementsByName("fndPostNumber")[0].value;
            window.location.href = "supportManagement?fndPostNumber=" + fndPostNumber;
        } else {
            alert('저장되지 않았습니다.\n정보를 확인해주세요');
        }
    })
    .fail(reject => console.log(reject));
    
});

$(document).ready(function() {
    // 페이지 로드 후 실행됩니다.
   $("td[name='fndOrderState']").each(function() {
        var state = $(this).text(); // 각 행의 fndOrderState 값을 가져옵니다.
        var text = "";
        
        // fndOrderState 값에 따라 표시할 문자열을 설정합니다.
        if (state === "1") {
            text = "주문접수";
        } else if (state === "2") {
            text = "배송중";
        } else if (state === "3") {
            text = "배송완료";
        } // 필요한 상태에 따라 추가적으로 설정할 수 있습니다.
        
        // 해당 문자열을 표시합니다.
        $(this).text(text);
    });
});
</script>
</html>