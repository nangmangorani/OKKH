package com.kh.okkh.chat.model.vo;

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
//	private int msgNo;
//	private String chatContent;
//	private Date createDate;
//	private String invite;
//	private String status;
//	private String today;
//	private String gitNick;
//	private int roomNo;
	
	private int roomNo;
	private String roomId;
	private String writer;
	private String message;
	
}
