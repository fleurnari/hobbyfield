// 에디터용
	ClassicEditor
	.create( document.querySelector( '#editorInsert' ), {
		language:"ko",
		ckfinder: {
			uploadUrl : 'ckeditor/upload'
		}
	})
	.then(editor => {
	    // 에디터 인스턴스가 생성되면 호출되는 콜백 함수
	    editor.isReadOnly = true; // 에디터를 읽기 전용으로 설정
	})
	.catch( error => {
	    console.error( error );
	});
	ClassicEditor
	.create( document.querySelector( '#editorRead' ), {
	 toolbar: []
	} )
	.then( editor => {
	const toolbarElement = editor.ui.view.toolbar.element;
	editor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
	    if ( isReadOnly ) {
	        toolbarElement.style.display = 'none';
	    } else {
	        toolbarElement.style.display = 'flex';
	    }
	});
	})
	.catch( error => {
	console.log( error );
	});    