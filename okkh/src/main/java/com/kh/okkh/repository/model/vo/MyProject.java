package com.kh.okkh.repository.model.vo;

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
public class MyProject {
	
	private int myproNo;			// 프로젝트 번호
	private int refTeamNo;			// 참조 팀 번호(참조 프로젝트 번호)
	private String myproTitle;		// 프로젝트 제목
	private String myproType;		// 프로젝트 종류
	private String myproMember;		// 프로젝트 멤버
	private Date createDate;		// 프로젝트 생성일
	private String status;			// 프로젝트 상태(존재/삭제)
	private String myproStatus;		// 프로젝트 진행 상태(진행/완료)
	
}
