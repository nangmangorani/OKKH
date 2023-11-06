package com.kh.okkh.common.socket;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.kh.okkh.member.model.vo.Member;


import lombok.RequiredArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

@Controller
@RequestMapping(value="/websocket", produces="application/json; charset=UTF-8")
public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	
	// 접속시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		
	sessions.add(session);  // 이건 한번 해봤습니당!!
	String senderId = currentUserName(session);
		if(senderId != null) {
			userSessionsMap.put(senderId,session);
			
		}
		
	}
	
	
	// 메시지 보내는 곳
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
	
		
		logger.info("ssesion"+currentUserName(session));
		
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg (내가 ajax로 보낸 메시지)
		
		
		
		
		if (msg != null) {
			
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 8) {
				
				String cmd = strs[0];
				String wantWriter = strs[1];  // 친추나 프로젝트 참여의사를 보인 사람의 회원번호 담겨있음
				String boardWriter = strs[2];  // 게시글 작성자
				String bno = strs[3];  // 게시글 번호
				String title = strs[4];  // 게시글 제목 
				String nick = strs[5];  // 닉네임
				String team =  strs[6];  // 참여중인 프로젝트 게시글 번호
				String content = strs[7];
				
				
				// 내가 실시간 알람보낼 한 명의 user!
				WebSocketSession targetSession = userSessionsMap.get(boardWriter);
				
				// 여기서 친구 목록이나 프로젝트 참여 인원들 모두에게 소켓 메세지 보내려면 
				// 위에 있는 sessions 사용해야 할 듯
				// 내가 실시간 알람 보낼 다수의 user정보가 있고 이걸 통해서 보내면 될 듯 
				//WebSocketSession allSessions = sessions.get(Integer.parseInt(boardWriter));
				
				
				userSessionsMap.put(boardWriter,session);
				
				
				WebSocketSession replyWriterSession = userSessionsMap.get(wantWriter);
				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
				
				
				
				// 프로젝트 참여누르면 여기 메시지 보냄
				//if ("project".equals(cmd)) {
					if ("project".equals(cmd) && targetSession != null) {
						logger.info("onmessage되나?");
						
						// 변수를 하나하나 담아서 jsonObject에 담기
						String category = strs[0];
						String nickName = strs[5];
						int pno = Integer.parseInt(strs[3]);
						String title1 =  strs[4];
						int teamNo = Integer.parseInt(strs[6]);
						String contents = strs[7];
						
						// 이제 담자
						JSONObject obj = new JSONObject();
						obj.put("category", category);
						obj.put("nickName", nickName);
						obj.put("pno", pno);
						obj.put("title", title1);
						obj.put("teamNo", teamNo);
						obj.put("content",contents);
						
						String objString = obj.toString();
						
						// 이제 메시지에 담자
						TextMessage tmpMsg = new TextMessage(objString);
						
						
	//					TextMessage tmpMsg = new TextMessage(nickName + bno +  title);
						
						
						targetSession.sendMessage(tmpMsg);
						
					
				}
				
				// 친구 추가 / 삭제/ 차단 등등 했을 경우
				else if("friend".equals(cmd) && targetSession != null) {
					// targetSession = 메세지 받는 사람
					// 변수를 하나하나 담아서 jsonObject에 담기
					
					// 여기서 필요한 건 닉네임과 contents 뿐이지만 일단 모두 담아서 보냄
					// 필요한 거만 꺼내서 쓸거임
					String category = strs[0];
					String nickName = strs[5];  // 메세지 보내는 사람
					int pno = Integer.parseInt(strs[3]);
					String title1 =  strs[4];
					int teamNo = Integer.parseInt(strs[6]);
					String contents = strs[7];   // 메세지 내용
					
					// 이제 담자
					JSONObject obj = new JSONObject();
					obj.put("category", category);
					obj.put("nickName", nickName);
					obj.put("pno", pno);
					obj.put("title", title1);
					obj.put("teamNo", teamNo);
					obj.put("content",contents);
					
					String objString = obj.toString();
					
					// 이제 메시지에 담자
					TextMessage tmpMsg = new TextMessage(objString);

					targetSession.sendMessage(tmpMsg);
					
				}

				
				
					
				
			}
			
		}
	}
	
	
	// 연결해제하는 부분
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { //연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	//웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회해서 id를 얻는 함수
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginMember = (Member)httpSession.get("loginMember");
		String memNo = "0";
		if(loginMember != null) {
			
			memNo = loginMember.getMemNo() + "";
		}
			
			return memNo.equals("0") ? null:memNo;
		
		
		
	}
}