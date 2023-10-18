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
	private String profile;
	private String gitNick;
	private String okkhNick;
	private String memIntro;
	private Date createDate;
	private String status;
	
}
