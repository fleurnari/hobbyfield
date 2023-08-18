<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능기부 상세정보</title>
<!-- CSS, JavaScript 등의 리소스를 포함시키는 부분 -->
</head>
<body>
	<div class="talent-info">
		<div class="talent-header">
			<div class="talent-image">
				<!-- 재능기부자가 업로드한 사진 표시 -->
			</div>
			<div class="talent-details">
				<h2>재능기부글 제목</h2>
				<p>재능기부 참여기간</p>
			</div>
		</div>
		<div class="talent-content">
			<h3>상세설명</h3>
			<p>재능기부자가 작성한 내용 표시</p>
		</div>
		<div class="talent-reviews">
			<div class="review-header">
				<select>
					<option value="recent">최근날짜순</option>
					<option value="old">오래된순</option>
				</select>
			</div>
			<table>
				<thead>
					<tr>
						<th>작성자</th>
						<th>댓글</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<!-- 댓글내용넣기 -->
				</tbody>
			</table>
			<div class="add-reply">
				<form>
					<input type="text" placeholder="댓글을 입력하세요"> <label><input
						type="checkbox">비밀댓글</label>
					<button type="submit">등록</button>
				</form>
			</div>
		</div>
		<div class="talent-review-button">
			<button>후기작성</button>
		</div>
		<div class="talent-reviews">
			<h3>후기</h3>
			<select>
				<option value="recent">최근날짜순</option>
				<option value="old">오래된순</option>
			</select>
			<div class="review">
				<div class="review-image">
					<!-- 후기 작성자가 업로드한 사진 표시 -->
				</div>
				<div class="review-content">
					<p>후기 내용 표시</p>
				</div>
			</div>
		</div>
	</div>
	<!-- CSS, JavaScript 등의 리소스를 포함시키는 부분 -->
</body>
</html>
