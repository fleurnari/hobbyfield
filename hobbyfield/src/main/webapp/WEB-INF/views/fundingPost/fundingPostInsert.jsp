<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" name="insertPostForm" action="fundingPostInsert" method="post">
		<div>
			<h3>어떤 프로젝트를 계획중이신가요?</h3>
			<p>프로젝트의 카테고리를 선택해주세요</p>
		</div>
		<table>
			<tr>
				<th>프로젝트 아이디</th>
				<td><input type="text" name="fndPostNumber"></td>
			</tr>
			<tr>
				<th>프로젝트 제목</th>
				<td><input type="text" name="fndTitle"></td>
			</tr>
			<tr>
				<th>프로젝트 대표 이미지</th>
				<td><input type="text" name="fndMainImg"></td>
			</tr>
			<tr>
				<th>프로젝트 메인 이미지 등록</th>
				<td><input type="text" name="fndMainImgPath"></td>
			</tr>
			<tr>
				<th>프로젝트 목표 금액</th>
				<td><input type="text" name="fndTargetAmount"></td>
			</tr>
			<tr>
				<th>프로젝트 시작일</th>
				<td><input type="date" name="fndStartDate"></td>
			</tr>
			<tr>
				<th>프로젝트 종료일</th>
				<td><input type="date" name="fndEndDate"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
	<script>
	document.getElementById('fndStartDay').valueAsDate = new Date();
		document.querySelector('form[name="insertPostForm"]')
				.addEventListener('submit', function(e){
					e.preventDefault();
					
					let fndPostNumber = document.getElementsByName('fndPostNumber')[0];
					let fndTitle = document.getElementsByName('fndTitle')[0];
					let fndMainImg = document.getElementsByName('fndMainImg')[0];
					let fndMainImgPath = document.getElementsByName('fndMainImgPath')[0];
					let fndTargetAmount = document.getElementsByName('fndTargetAmount')[0];
					let fndCurrentAmount = document.getElementsByName('fndCurrentAmount')[0];
					let fndStartDate = document.getElementsByName('fndStartDate')[0];
					let fndEndDate = document.getElementsByName('fndEndDate')[0];
					
					
					if(fndTitle.value == ''){
						alert('제목을 입력해 주세요.');	
						fndTitle.focus();
						return;
					}
					if(fndMainImg.value == ''){
						alert('이미지를 등록해 주세요.');	
						fndMainImg.focus();
						return;
					}
					if(fndMainImgPath.value == ''){
						alert('이미지 위치를 등록해 주세요.');	
						fndMainImgPath.focus();
						return;
					}
					if(fndTargetAmount.value == ''){
						alert('펀딩 목표금액을 등록해 주세요.');	
						fndTargetAmount.focus();
						return;
					}
					if(fndStartDate.value == ''){
						alert('펀딩 시작 날짜를 입력해 주세요.');	
						fndStartDate.focus();
						return;
					}
					if(fndEndDate.value == ''){
						alert('펀딩 종료 날짜를 입력해 주세요.');	
						fndEndDate.focus();
						return;
					}
					//form태그에 대해서 중복만 되지 않는다면 바로 호출가능함
					insertPostForm.submit();
				});
				
	

	
	  
</script>
</body>
</html>