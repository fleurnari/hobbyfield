<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/chat.css" />
<title>Chat Application</title>
<style>
div.header {
	position: sticky;
	top: 0;
	background-color: blue;
}
</style>
</head>
<body>
	<div class="chat_wrap">
		<div class="header">
			<h3>채팅방(${member.memberEmail})</h3>
		</div>
		<div id="chat"></div>
		<!-- 채팅저장출력 -->
		<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
       <div class="{{printLeftRight sender}}">
          <div class="sender">{{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{regdate}}</div>
       </div>
		{{/each}}
       </script>
		<!-- 새로운채팅출력 -->
		<script id="temp1" type="text/x-handlebars-template">
       <div class="{{printLeftRight sender}}">
          <div class="sender">{{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{regdate}}</div>
       </div>
       </script>
		<div class="input-div">
			<textarea id="txtMessage" cols="30" rows="10"
				placeholder="메시지를 입력한 후에 엔터키를 누르세요."></textarea>
		</div>
	</div>
</body>
<!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
<script>
	var member = "${member.memberEmail}";
	Handlebars.registerHelper("printLeftRight", function(sender) {
		if (member != sender) {
			return "left";
		} else {
			return "right";
		}
	});
</script>
<script>
	var member = "${member.memberEmail}";
	getList();
	$("#txtMessage").on("keypress", function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $("#txtMessage").val();
			if (message == "") {
				alert("메시지를 입력하세요.");
				$("#txtMessage").focus();
				return;
			}

			// 서버로 메시지 보내기
			sock.send(member + "|" + message);
			$("#txtMessage").val("");
		}
	})
	
	// 웹소캣 생성
	var sock = new SockJS("http://localhost:80/app/echo");
</script>
</html>