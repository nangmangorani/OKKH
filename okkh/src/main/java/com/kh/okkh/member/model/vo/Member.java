package com.kh.okkh.member.model.vo;

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
public class Member {
	
	private int memNo;
	private String memId;
	private String memToken;
	private String gitNick; // DB X
	private String profile; // DB X
	private String type; // DB X
	private String bio; // DB X
	private String memIntro;
	private String stackName;
	private Date createDate;
	private String status;
	private int team;  // 참가 희망하는 프로젝트 번호
	private String teamStatus;  //참여상태 y확정, n임시 , 일단은 default 값이 n임
	private String avatarUrl;
	
	public Member(String gitNick, String profile) {
		this.gitNick = gitNick;
		this.profile = profile;
	}
	
}


