<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>

	//알림 목록
	function pushList(){
		var memberEmail = "${member.memberEmail}";
		 $.ajax({
		        url : '/push/selectPushList',
		        type : 'get',
		        data : {'memberEmail' : memberEmail },
		        dataType : "json", 
		        success : function(data){
		         	var a='';
		         	 $.each(data, function(key, value){ 
		         		var pushTyp = value.pushTyp;
		         		a += '<div>';
						a += '<div class="small text-gray-500">'+value.pushDatetime+'</div>';
						if(pushTyp == ""){
						a += '<span class="font-weight-bold"><a href="#"  onclick="deletePush('value.pushId');"></a></span>';
						}else if(pushTyp == ""){
						a += '<span class="font-weight-bold"><a href="#" onclick="deletePush('value.pushId');"></a></span>';
	
						}
						a += '</div><hr/>';	
						
		         		 
		         		 
		         	 });
		         	 
		         	 $("#pushList").html(a);
		         	 
		        }
		        
		    
		    });
		 }
	//목록끝
	
	//목록 클릭
	function deletePush(pushId){
		 $.ajax({
		        url : '/board/deletePush',
		        type : 'post',
		        data : {'pushId' : pushId },
		        dataType : "json", 
		        success : function(){
		        
		        }
		        
		    
		    });
		location.href=;
		
	}
	
	
	
	//알림 수
	function pushCount(){
		
		var memberEmail = "${member.memberEmail}";
		 $.ajax({
		        url : '/push/selectPushCount',
		        type : 'get',
		        data : {'memberEmail' : memberEmail },
		        dataType : "json", 
		        success : function(data){
		       $('#pushCount').text(data);
		        }
		    
		    });
	}

</script>
</html>