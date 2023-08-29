package com.hobbyfield.app.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hobbyfield.app.member.service.MemberVO;

public class PushHandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessions= new ArrayList<WebSocketSession>();
	
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	// 클라이언트 - 서버 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId = currentUserName(session);
		userSessionMap.put(senderId, session);
	}
	
	// 메시지
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
				
	}
	
	// 연결 해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		
	}
	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO)httpSession.get("member");
		
		if (loginUser == null) {
			String sessionId = session.getId();
			return sessionId;
		}
		String memberEmail = loginUser.getMemberEmail();
		return memberEmail;
	}
			

}

	

	

