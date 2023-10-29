package com.kh.okkh.friend.model.vo;

import java.sql.Date;

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
public class Friend {
	private int memNo;
	private String memId;
	private String memToken;
	private String gitNick; // DB X
	private String profile; // DB X
	private String type; // DB X
	private String memIntro;
	private Date createDate;
	private String status;
	private int team;  // 참가 희망하는 프로젝트 번호
	private String teamStatus;  //참여상태 y확정, n임시 , 일단은 default 값이 n임
	private String bfGiver; // 친구 요청자 (닉네임보여줄거임)
	private String bfTaker; // 친구 요청받는자 (닉네임보여줄거임)
	private String fStatus; // 친구 요청 상태
	private String requestDate; // 친구 요청일
	private String isent;   // 내가 친구에게 친구관련 샹태를 보냄
	private String friSent;  // 친구가 나한테 친구관련 샹태를 보냄
	private int userNo;
	
}
