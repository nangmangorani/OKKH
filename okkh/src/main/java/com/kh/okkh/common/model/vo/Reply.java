package com.kh.okkh.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

	private int replyNo;
	private String replyWriter; // mem_no로 int형이지만 작성자 닉네임 보여줄거라 String으로 함 
	private String replyContent;
	private int refPno;
	private String repDate; // date형이지만 '2023-10-10' 이런 형태로 만들거라 String으로
	
	
}
