package com.hobbyfield.app.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hobbyfield.app.member.service.MemberVO;
 
public class WebSocketHandler extends TextWebSocketHandler{
	
	// 로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	
	// 클라이언트가 웹 소켓 생성
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	sessions.add(session);
    	String senderId = currentUserEmail(session);
    	userSessionsMap.put(senderId, session);
    	
    }
    
    // JS에서 메시지 받을 때
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	String msg = message.getPayload();
    	
    	if (StringUtils.isNotEmpty(msg)) {
    		String[] strs = msg.split(",");
    		
    		if (strs != null & strs.length == 6) {
    			
    		}
    		
    	}
    	
    }
 
    
    // 웹 소켓 연결 종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	sessions.remove(session);
    	userSessionsMap.remove(currentUserEmail(session), session);
    }
    

	private String currentUserEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO)httpSession.get("member");
		
		if (loginUser == null) {
			String memberEmail = session.getId();
			return memberEmail;
		}
		String memberEmail = loginUser.getMemberEmail();
		return memberEmail;
		
	}

}
