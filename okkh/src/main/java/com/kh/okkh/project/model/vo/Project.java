package com.kh.okkh.project.model.vo;

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
public class Project {

	private int proNo;
	private String proWriter;  // 회원의 닉네임을 보여줄 거임
	private String proStack;	// 기술 스택을 이미지로 보여줄 거임 
	private String proTitle;
	private String proContent;
	private int proMember; // 프로젝트 모집 인원수
	private String proPeriod; // 프로젝트 진행 기간 -> '2개월'
	private String proDeadLine; // 프로젝트 모집 마감기간인데 2023-10-23 형식으로 
	private String proStartDate; // 프로젝트 시작 예정일,  2023-10-23 형식으로 
	private String proPosition; // 프로젝트 모집포지션
	private String proStatus; // 프로젝트 모집 상태
	private String status; // 프로젝트 게시물 삭제여부
	private int count;
	private String createDate;
	private int memNo;
	private int bookmarkProNo;  
	private int bookmarkMemNo;
	private int team;
}
