package com.kh.okkh.issue.model.vo;

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
public class Issue {
	
//	private int issNo; // 이슈번호
//	private String issTitle; //이슈제목
//	private String issContent; // 이슈내용
//	private Date createDate; // 이슈 생성일
//	private Date modifyDate; //이슈 수정일
//	private Date endDate; // 이슈 종료일
//	private String issAssignee; // 이슈 할당받은 사람
//	private String issStatus; // 이슈 진행상태(Y/N)
//	private String status; //이슈상태(Y/N)
//	private int memNo; // 이슈 작성자
//	private String labName; // 이슈가 속한 라벨번호 ,로 구분
//	private int milNo; // 이슈가 속한 마일스톤
//	private int repoNo; // 이슈가 속한 레퍼지토리 번호
	
	private String title;
	private String[] labels;  	// 라벨 배열
	private String state;	  	// open - closed - all
	private String milestone; 	// 마일스톤
	private int number;		  	// 이슈 생성 번호
	private int milestoneNum;

	private String fullName;    // 레파지토리 이름

	private String createdAt; 	// 생성일
	private String updatedAt; 	// 수정일
	private String closedAt;  	// 종료일
	private String id;   	// 이슈아이디
	private String user; 		// 작성자
	private String userId;		// 작성자의 숫자 id
	private String profile;		// 프로필
	
	
	private String[] assignees;    // 이슈 담당자 이름
	private String[] assigneeProfiles; // 이슈 담당자 프로필 경로
	
	private String login;
	
}
