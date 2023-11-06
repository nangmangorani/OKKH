package com.kh.okkh.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
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
	
	private int roomNo;
	private String roomId;		// 방 번호
	private String roomTitle;	// 방 제목
	private Date createDate;
	private String lastChat;
	private Date lastDate;
	private String status;
		
}
