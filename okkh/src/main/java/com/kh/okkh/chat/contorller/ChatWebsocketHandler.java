package com.kh.okkh.chat.contorller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.chat.model.service.ChatServiceImpl;
import com.kh.okkh.chat.model.vo.ChatMessage;
import com.kh.okkh.chat.model.vo.ChatRoom;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class ChatWebsocketHandler extends TextWebSocketHandler {
	//로그인 한 인원 전체
	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	
	// 1:1로 할 경우
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	@Autowired
	private ChatServiceImpl cService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { // 클라이언트와 서버가 연결 됐을 때
		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
		logger.info(session.getId() + "연결됨"); // 세션아이디 확인
		sessions.add(session); // 전달받은 webSocketSession을 set에 추가
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		logger.info("연결 종료");
		sessions.remove(session); // 웹소켓 연결이 종료되는 경우, sessions안에 저장되어있던 클라이언트의 session정보를 삭제
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 소켓에 메세지를 보낼 때
		logger.info("전달된 메세지 : " + message.getPayload()); 
		String payload = message.getPayload();
		ObjectMapper objectMapper = new ObjectMapper();
		ChatMessage chatMessage = objectMapper.readValue(payload, ChatMessage.class);
		ChatRoom room = cService.selectChatRoomRno(chatMessage.getRoomNo());
		Set<WebSocketSession> sessions = room.getSessions();
		
		if(chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
			sessions.add(session);
			chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");
			sendToEachSocket(sessions, new TextMessage(objectMapper.writeValueAsString(chatMessage)));
		}else if(chatMessage.getType().equals(ChatMessage.MessageType.QUIT)) {
			sessions.remove(session);
            chatMessage.setMessage(chatMessage.getSender() + "님이 퇴장했습니다..");
            sendToEachSocket(sessions,new TextMessage(objectMapper.writeValueAsString(chatMessage)) );
		}else {
			sendToEachSocket(sessions,message ); //입장,퇴장 아닐 때는 클라이언트로부터 온 메세지 그대로 전달.
		}
	}
	
	private void sendToEachSocket(Set<WebSocketSession> sessions, TextMessage message){
        sessions.parallelStream().forEach( roomSession -> {
            try {
                roomSession.sendMessage(message);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }

}




















