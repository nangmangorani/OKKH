package com.kh.okkh.pullRequest.model.vo;

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
public class PullRequest {

	private int pullNo; 
	private String pullTitle;
	private String pullContent;
	private String pullWriter; // 작성자 int형인데 여기서 닉네임보여줄거임
	private String pullManager; // 마찬가지로 닉네임보여주기
	private int repoNo; // 레파지토리 번호
	private int issNo; // 이슈 번호
	private int milNo; // 마일스톤 번호
	private String status;
	
}
