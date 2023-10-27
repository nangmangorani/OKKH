package com.kh.okkh.chat.model.vo;

import java.sql.Date;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatRoom {
//		private int roomNo;
//		private String roomId;
//		private String roomTitle;
//		private Date createDate;
//		private String status;
//		private String lastChat;
//		private Date lastDate;
//		private int fileNo;
	
	private String roomId;
	private String roomName;
	
	public static ChatRoom create(String name) {
		ChatRoom room = new ChatRoom();
		room.roomId = UUID.randomUUID().toString();
		room.roomName = name;
		return room;
	}
		
}
