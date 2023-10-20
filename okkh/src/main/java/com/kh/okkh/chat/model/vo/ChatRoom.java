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
		private String roomTitle;
		private String roomMem;
		private Date createDate;
		private String status;
		private String lastChat;
		private Date lastDate;
		private int fileNo;
}
