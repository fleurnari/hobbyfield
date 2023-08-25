<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="talentInsert" class="talentInsert" method="post">
		<div>
			<h3>재능기부 등록</h3>
		</div>
		<div class="form-group">
			<select class="form-contol" id="tlntCate" name="tlntCate">
				<option select disabled>재능기부 카테고리</option>
				<option value="Y1">가족</option>
				<option value="Y2">스터디</option>
				<option value="Y3">취미(동호회)</option>
				<option value="Y4">운동</option>
				<option value="Y5">학교</option>
				<option value="Y6">팬밴드</option>
				<option value="Y7">회사</option>
			</select>
			<div>
				<h6>제목</h6>
				<input type="text" id="tlntTitle" name="tlntTitle"
					required="required" placeholder="재능기부 제목을 입력하세요.">
			</div>
			<div>
				<h6>내용</h6>
				<textarea id="tlntContent" name="tlntContent" required="required"
					rows="100" cols="100" placeholder="내용을 입력하세요."></textarea>
				
			</div>
			<div>
				<h6>신청기간</h6>
				<p>재능기부 신청시작일</p>
				<input type="date">
				<p>재능기부 신청마감일</p>
				<input type="date">
			</div>
			<div>
				<h6>참여인원</h6>
				<input type="number" value="최대인원 수">
			</div>
			<div class="buttonGroup">
				<button type="submit">등록</button>
				<button type="button" onclick="location.href='talentMain'">목록</button>
				<button type="reset" onclick="location.href='talentInsert'">초기화</button>
			</div>
		</div>
<!-- 	<!-- 재능기부 등록 --> -->
<!-- 	<insert id="insertTalent" parameterType="TalentVO"> -->
<!-- 		<selectKey keyProperty="tlntId" resultType="int" -->
<!-- 			order="BEFORE"> -->
<!-- 			SELECT NVL(MAX(notice_id), 0) + 1 -->
<!-- 			FROM TALENT -->
<!-- 		</selectKey> -->
<!-- 		INSERT INTO TALENT ( -->
<!-- 		TLNT_ID, -->
<!-- 		TLNT_CATE, -->
<!-- 		TLNT_TITLE, -->
<!-- 		TLNT_CONTENT, -->
<!-- 		TLNT_WRITER, -->
<!-- 		TLNT_WDATE, -->
<!-- 		TLNT_VIEW, -->
<!-- 		TLNT_STARTDAY, -->
<!-- 		TLNT_ENDDAY, -->
<!-- 		TLNT_CAP, -->
<!-- 		TLNT_STATUS, -->
<!-- 		TLNT_REGEND -->
<!-- 		) VALUES ( -->
<%-- 		#{tlntId}, --%>
<%-- 		#{tlntCate}, --%>
<%-- 		#{tlntTitle}, --%>
<%-- 		#{tlntContent}, --%>
<%-- 		#{tlntWriter}, --%>
<%-- 		#{tlntWdate}, --%>
<%-- 		#{tlntView}, --%>
<%-- 		#{tlntStartday}, --%>
<%-- 		#{tlntEndday}, --%>
<%-- 		#{tlntCap}, --%>
<%-- 		#{tlntStatus}, --%>
<%-- 		#{tlntRegEnd} --%>
<!-- 		) -->
	</insert>

	</form>

</body>
</html>