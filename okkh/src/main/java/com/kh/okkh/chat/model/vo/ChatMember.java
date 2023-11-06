package com.kh.okkh.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatMember {
	private int roomNo;
	private int memNo;
	
	private String gitNick;
	private String profile;
}
