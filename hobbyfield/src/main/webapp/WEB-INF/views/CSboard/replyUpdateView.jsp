<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<section id="container">
<!-- 				<form name="updateForm"  method="post" action="replyUpdate"> -->
<%-- 					<input type="hidden" name="csNumber" value="${replyUpdate.csNumber}" readonly="readonly"/> --%>
<%-- 					<input type="hidden" id="replyId" name="replyId" value="${replyUpdate.replyId}" /> --%>
<!-- 					<table> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<td> -->
<%-- 									<label for="content">댓글 내용</label><input type="text" id="content" name="content" value="${replyUpdate.content}"/> --%>
<!-- 								</td> -->
<!-- 							</tr>	 -->
							
<!-- 						</tbody>			 -->
<!-- 					</table> -->
<!-- 					<div> -->
<!-- 						<button type="submit" class="update_btn">수정</button> -->
<!-- 						<button type="button" class="cancel_btn">취소</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
			<!-- 댓글 수정 폼 -->
<form name="updateForm" method="post" action="replyUpdate">
    <input type="hidden" name="csNumber" value="${replyUpdate.csNumber}" readonly="readonly"/>
    <input type="hidden" id="replyId" name="replyId" value="${replyUpdate.replyId}" />
    <table>
        <tbody>
            <tr>
                <td>
                    <label for="content">댓글 내용</label>
                    <input type="text" id="content" name="content" value="${replyUpdate.content}"/>
                </td>
            </tr>
        </tbody>
    </table>
    <div>
        <button type="submit" class="update_btn">수정</button>
        <button type="button" class="cancel_btn" onclick="closeModal()">취소</button>
    </div>
</form>

			</section>
		</div>
	</body>
</body>
<script >
//취소버튼
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		location.href = "CSboardInfo?csNumber=${replyUpdate.csNumber}";
	});
});	

</script>
</html>