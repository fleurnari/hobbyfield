package com.hobbyfield.app.chat.web;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결되었을떄
		System.out.println("연결됨 : " + session.getId());
		super.afterConnectionEstablished(session);
	}

}
