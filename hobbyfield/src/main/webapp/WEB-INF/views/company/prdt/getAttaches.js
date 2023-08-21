function makeHtmlcode_read(data) {
	var img = checkImgType(data) ? "/resources/upload/" + data : "/resources/esc.png";
	var originalName = getOriginalName(data);
	var imgLink = getImageLink(data);
	
	if(checkImgType(data)){
	
		var str = `<li class="col-xs-3"><div><a target='_blank' href="/displayFile?filename=${imgLink}"><img src="${img}"></a><p class="oriName"> ${originalName}</p></div></li>`;
		return str;
	
	} else {
	
		var str = `<li class="col-xs-3"><div><a href="/displayFile?filename=${imgLink}"><img src="${img}"></a><p class="oriName"> ${originalName}</p></div></li>`;
		return str;	
		
	}
}
	
function makeHtmlcode(data) { /* 동적으로 생성되는 썸네일과 파일명을 화면에 띄우는 함수 */
	var img = checkImgType(data) ? "/resources/upload/" + data : "/resources/esc.png";
	var originalName = getOriginalName(data);
	var imgLink = getImageLink(data);
	
	if(checkImgType(data)){
	    /* 파일이 이미지 파일이면 만들어둔 썸네일을 가져와 표시 */
		var str = `<li class="col-xs-3"><div><a target='_blank' href="/displayFile?filename=${imgLink}"><img src="${img}"></a><p class="oriName"><span data-src="${data}" class="glyphicon glyphicon-trash delbtn" aria-hidden="true"></span> ${originalName}</p></div></li>`;
		return str;
	
	} else {
	    /* 파일이 일반 파일이면 미리 설정해둔 썸네일을 가져와 표시 */
		var str = `<li class="col-xs-3"><div><a href="/displayFile?filename=${imgLink}"><img src="${img}"></a><p class="oriName"><span data-src="${data}" class="glyphicon glyphicon-trash delbtn" aria-hidden="true"></span> ${originalName}</p></div></li>`;
		return str;	
		
	}
	
}

function checkImgType(data) { /* 업로드 한 데이터가 이미지파일인지 아닌지 확인하는 코드 */
	var idx = data.lastIndexOf(".") + 1;
	var type = data.substring(idx).toUpperCase();

	if (type == "PNG" || type == "JPG" || type == "JPEG" || type == "GIF") {
		return true;
	} else {
		return false;
	}
}

function getImageLink(data) {
    /* data로 넘겨받은 파일 링크는 이미지파일의 경우 썸네일의 링크이므로 따로 원본 링크를 찾아주는 코드 */
	if (checkImgType(data)) {
		var pre = data.substring(0, 12);
		var suf = data.substring(14);

		return pre + suf;
	} else {
		return data;
	}
}

function getOriginalName(data) {
    /* UUID 없이 원본파일의 이름을 찾아주는 코드 */
	if (checkImgType(data)) {
		var idx = data.indexOf("_"); 
		idx = data.indexOf("_", idx + 1) + 1; 
		return data.substring(idx);
	} else {
		var idx = data.indexOf("_") + 1;
		return data.substring(idx);
	}
}