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
public class Notice {

	
	private int notiNo;  // 알람번호
	private String categoryName; // 게시판 이름
	private String notiContent; // 알림내용
	private String ocuTime; // 알림발생시간
	private String status; // 알림상태
	private int memNo; // 회원번호
}
