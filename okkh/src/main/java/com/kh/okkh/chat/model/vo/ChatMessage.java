package com.kh.okkh.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {
	private int msgNo;
	private String chatContent;
	private Date createDate;
	private String invite;
	private String status;
	
	public enum MessageType {
		ENTER, TALK, QUIT
	}
	private int roomNo;
	private MessageType type;
	private String sender;
	private String message;
}
