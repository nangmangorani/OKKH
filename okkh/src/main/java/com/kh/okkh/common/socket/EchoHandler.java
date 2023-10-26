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
	System.out.println("야너언제타니");
		
	sessions.add(session);  // 이건 한번 해봤습니당!!
	String senderId = currentUserName(session);
		if(senderId != null) {
			System.out.println();
			userSessionsMap.put(senderId,session);
			
		}
		
	}
	
	
	// 메시지 보내는 곳
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg (내가 ajax로 보낸 메시지)
		
		System.out.println(msg + " 내가 보낸 메세지입니다!!!!");
		
		
		
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
				
				
				//System.out.println(nick);
				//System.out.println(boardWriter);
				
				//System.out.println(userSessionsMap.get(boardWriter));
				userSessionsMap.put(boardWriter,session);
				
				
				WebSocketSession replyWriterSession = userSessionsMap.get(wantWriter);
				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
				
				//System.out.println(boardWriterSession);
				
				//System.out.println(cmd + "프로젝트?");
				
				
				// 프로젝트 참여누르면 여기 메시지 보냄
				//if ("project".equals(cmd)) {
					if ("project".equals(cmd) && targetSession != null) {
						logger.info("onmessage되나?");
						
						// 변수를 하나하나 담아서 jsonObject에 담기
						String nickName = strs[5];
						int pno = Integer.parseInt(strs[3]);
						String title1 =  strs[4];
						int teamNo = Integer.parseInt(strs[6]);
						String contents = strs[7];
						
						// 이제 담자
						JSONObject obj = new JSONObject();
						obj.put("nickName", nickName);
						obj.put("pno", pno);
						obj.put("title", title1);
						obj.put("teamNo", teamNo);
						obj.put("content",contents);
						
						String objString = obj.toString();
						
						// 이제 메시지에 담자
						TextMessage tmpMsg = new TextMessage(objString);
						
						
	//					TextMessage tmpMsg = new TextMessage(nickName + bno +  title);
						
						System.out.println(team + "     이건 팀번호");
						System.out.println(cmd + "이건 프로젝트와 동일해야함");
						System.out.println(tmpMsg + " 메시지 보내지는 곳");
						
						targetSession.sendMessage(tmpMsg);
						
					
				}
				
				// 프로젝트 회원 상태변경 했을 경우
//				else if("updateTeamStatus".equals(cmd) && replyWriterSession != null) {
//					//replyWriter = 스크랩누른사람 , boardWriter = 게시글작성자
//					// 변수를 하나하나 담아서 jsonObject에 담기
//					String nickName = strs[5];
//					int pno = Integer.parseInt(strs[3]);
//					String title1 =  strs[4];
//					int teamNo = Integer.parseInt(strs[6]);
//					String contents = strs[7];
//					
//					// 이제 담자
//					JSONObject obj = new JSONObject();
//					obj.put("nickName", nickName);
//					obj.put("pno", pno);
//					obj.put("title", title1);
//					obj.put("teamNo", teamNo);
//					obj.put("content",contents);
//					
//					String objString = obj.toString();
//					
//					// 이제 메시지에 담자
//					TextMessage tmpMsg = new TextMessage(objString);
//
//					replyWriterSession.sendMessage(tmpMsg);
//					
//				}
				
//				//좋아요
//				else if("like".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");
//
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
				
				//DEV
//				else if("Dev".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 DEV했습니다!</a>");
//
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
				//댓글채택
//				else if("questionCheck".equals(cmd) && replyWriterSession != null) {
//					//replyWriter = 댓글작성자 , boardWriter = 글작성자
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 채택했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//					
//				}
				
				//댓글좋아요
//				else if("commentLike".equals(cmd) && replyWriterSession != null) {
//					logger.info("좋아요onmessage되나?");
//					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 추천했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
//				
				
				//댓글DEV
//				else if("commentDev".equals(cmd) && replyWriterSession != null) {
//					logger.info("좋아요onmessage되나?");
//					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 DEV했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
				
				
					
				
			}
			
		}
	}
	
	
	// 연결해제하는 부분
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
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
		//System.out.println("여기는 currentUserName : " + loginMember);
		String memNo = "0";
		if(loginMember != null) {
			
			memNo = loginMember.getMemNo() + "";
		}
			
			return memNo.equals("0") ? null:memNo;
		
		
		
	}
}