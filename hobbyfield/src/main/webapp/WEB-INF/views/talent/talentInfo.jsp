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
	<script>
	
	//시간계산
	function remaindTime() {
		 
		let today = new Date();
		

		var now = new Date(); //현재시간을 구한다. 
		console.log(now);
		var open = Date.parse("${point.pointEndterm}");
		console.log(open);
		
		var nt = now.getTime(); // 현재의 시간만 가져온다
		
	  	
		if(nt<open){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.   
			sec = parseInt(open - nt) / 1000;
			hour = parseInt(sec/60/60);
			sec = (sec - (hour*60*60));
			min = parseInt(sec/60);
			sec = parseInt(sec-(min*60));
	  
	    if(hour<10){hour="0"+hour;}
	    if(min<10){min="0"+min;}
	    if(sec<10){sec="0"+sec;}
			$("#d-day-hour").html(hour);
			$("#d-day-min").html(min);
			$("#d-day-sec").html(sec);
	    }else{ //현재시간이 종료시간보다 크면
		    $("#d-day-hour").html('00');
		    $("#d-day-min").html('00');
		    $("#d-day-sec").html('00'); 	   
			
		    setInterval(remaindTime,1000); 
	   }
	}
	</script>
</body>
</html>
