<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>	

<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	min-height: 100vh;
	margin-top: 150px;
}

h5{
	margin-top: 30px;
	font-weight: bold;

}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.pointItemType {
	width: 300px;
}

.pointContent{
	margin-bottom: 30px;
}

.capacity, .emoji {
	display: none;
}

.buttonGroup{
	margin-top: 30px;
}


</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<form action="pointInsert" class="pointInsert" method="post">
		<div>
			<h3>포인트상품등록</h3>
		</div>
		<div class="form-group">
			<h5>
				<label for="pointItemType">상품유형</label>
			</h5>
			<select class="form-control" id="pointItemType" name="pointItemType">
				<option selected disabled>상품유형</option>
				<option value="W2">소모임증원권</option>
				<option value="W1">이모티콘</option>
			</select>
		</div>
		<div>
			<h5>상품이름</h5>
			<input type="text" id="pointName" name="pointName"
				required="required" placeholder="상품이름을 입력하세요.">
		</div>

		<div>
			<input type="hidden" id="emojiId" name="emojiId">
		</div>

		<div class="pointContent">
			<h5>내용</h5>
			<textarea id="editor" name="pointContent"
				cols="40" rows="5" placeholder="내용을 입력하세요."></textarea>
		</div>


		<!-- 증원권 -->
		<div class="capacity mb-2">
			<h5>가격</h5>
			<input type="number" name="groupPrice">
		</div>

		<!-- 이모티콘 -->
		<div class="emoji">
			<div>
				<h5>상품판매 마감일</h5>
				<input type="date" id="pointEndterm" name="pointEndterm">
			</div>
			<div>
				7일<input type="hidden" name="pointOptionVO[0].pointPeriod" value="7"><span><input
					type="text" name="pointOptionVO[0].pointPrice"></span>
			</div>
			<div>
				14일<input type="hidden" name="pointOptionVO[1].pointPeriod"
					value="14"><span> <input type="text"
					name="pointOptionVO[1].pointPrice">
				</span>
			</div>
			<div>
				30일<input type="hidden" name="pointOptionVO[2].pointPeriod"
					value="30"><span><input type="text"
					name="pointOptionVO[2].pointPrice"></span>
			</div>
			<div>
				영구<input type="hidden" name="pointOptionVO[3].pointPeriod" value="0"><span><input
					type="text" name="pointOptionVO[3].pointPrice"></span>
			</div>
		</div>

		<div>
			<input type="file" name="uploadFile" multiple="multiple">
			<button type="button" id="uploadBtn">upload</button>
		</div>
		<div id="preview"></div>
		<div class="buttonGroup">
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='pointList'">목록</button>
			<button type="reset" onclick="location.href='pointInsert'">초기화</button>
		</div>
		<div id="emojiFile"></div>
	</form>


	<script>
	//editor
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	language:"ko",
    	ckfinder: {
    		uploadUrl : 'ckeditor/upload'
    	}
    })
    .then(editor => {
    	 editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
    })
    .catch( error => {
        console.error( error );
    });
	
	
	
		//등록 버튼 핸들러
		document.querySelector('form.pointInsert').addEventListener(
				'submit',
				function(e) {
					e.preventDefault();

					let pointName = document
							.querySelector('input[name="pointName"]');
					let emojiId = document
							.querySelector('input[name="emojiId"]');
					let pointContent = document
							.querySelector('textarea[name="pointContent"]');
					let pointRegdate = document
							.querySelector('input[name="pointRegdate"]');
					let pointEndterm = document
							.querySelector('input[name="pointEndterm"]');
				
					let list = [];
					let today = new Date();
					let year = today.getFullYear();
					let month = today.getMonth() + 1
					console.log(today);

					if (pointName.value == '') {
						alert('상품이름을 입력하세요.');
						pointName.focus();
						return;
					}
					if (pointContent.value == '') {
						alert('내용을 입력하세요.');
						pointContent.focus();
						return;
					}
					// 					if (pointimgname.value == '') {
					// 						alert('이미지를 등록하세요.');
					// 						pointimgname.focus();
					// 						return;
					// 					}

					this.submit();
				});

		document.querySelector('.capacity').style.display = "none";
		document.querySelector('.emoji').style.display = "none";

		//상품옵션 변경 핸들러
		document
				.querySelector('#pointItemType')
				.addEventListener(
						'change',
						function(e) {
							// div 둘다 안보이게
							let pointItemType = e.target.value;
							// if  w1보이게 else w2보이게
							if (pointItemType == 'W2') {
								document.querySelector('.capacity').style.display = "block";
								document.querySelector('.emoji').style.display = "none";
							} else if (pointItemType == 'W1') {
								document.querySelector('.emoji').style.display = "block";
								document.querySelector('.capacity').style.display = "none";
							}

						});

		function imgUploadHandler(list) {
			$('#emojiFile').empty();
			for (i = 0; i < list.length; i++) {
				let tag = `<input type="hidden" name="emojiVO[\${i}].emojiImgName" value="\${list[i].UUID}">
				<input type="hidden" name="emojiVO[\${i}].emojiImgPath" value="\${list[i].url}">`
				$('#emojiFile').append(tag);
			}
		}
	</script>
</body>
</html>
