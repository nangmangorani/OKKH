package com.kh.okkh.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.okkh.member.model.vo.Member;

@Component
public class ChatWebsocketHandler extends TextWebSocketHandler {
	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
    
    private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		i++;
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
		i--;
	}
	
	// 채팅방에서 전달 받은 메시지를 가공
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 전달 받은 메시지
		
		SimpleDateFormat stf = new SimpleDateFormat("HH:mm");
		String strDate = stf.format(new Date());
		
		String msg = currentUserName(session) + " : " + message.getPayload() + " : " + strDate;
		
		for (WebSocketSession sess : list) {
			sess.sendMessage(new TextMessage(msg));
		}
	}
	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		
		Member loginMember = (Member)httpSession.get("loginMember");
		String gitNick = "";
		if(loginMember != null) {
			gitNick = loginMember.getGitNick() + "";
		}
		
		return gitNick.equals("") ? null:gitNick;
	}
	
}
