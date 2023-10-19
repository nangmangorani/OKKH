package com.kh.okkh.pr.model.vo;

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
public class PR {

	private int prNo; 
	private String prTitle;
	private String prContent;
	private String createDate;
	private int prTime;  // 하루에 프로젝트 가능한 시간
	private String status;
	private String stackName;
	private String prWriter; // memNo : pr작성자인데 닉네임보여줄거임
	private int count; // 조회수
	private int memNo;
}
