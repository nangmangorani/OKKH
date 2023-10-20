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
	private int refProNo;			// 프로젝트 모집번호
	private String myproTitle;		// 프로젝트 제목
	private String myproType;		// 프로젝트 종류
	private Date createDate;		// 프로젝트 생성일
	private String status;			// 프로젝트 삭제여부
	private String myproStatus;		// 프로젝트 완료여부
	private String owner;			// 프로젝트 담당자
	private String[] teamMate;		// 프로젝트 팀원

}
