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

	/*
	private int pullNo; 
	private String pullTitle;
	private String pullContent;
	private String pullWriter; // 작성자 int형인데 여기서 닉네임보여줄거임
	private String pullManager; // 마찬가지로 닉네임보여주기
	private int repoNo; // 레파지토리 번호
	private int issNo; // 이슈 번호
	private int milNo; // 마일스톤 번호
	private String status;
	*/
	
	
	

	// 풀리퀘 주소 : https://api.github.com/repos/nangmangorani/OKKH/pulls/2
	// 커밋 주소 : https://api.github.com/repos/nangmangorani/OKKH/pulls/2/commits
	
	//======================== 풀리퀘에서 필요한 값들 ==================
	
	private int fullRequestNum ;// 풀리퀘 생성 번호
	private String title; // 풀 리퀘 제목...? -> 풀리퀘 작성한 작성자의 브랜치 이름
	private String body; // 풀리퀘 내용!
	private String state; // 풀리퀘 상태 -> open/close
	private int id ; // 풀리퀘 아이디
	private String createdAt; // 풀리퀘 생성일 
	private String updatedAt; // 풀리퀘 수정일 
	private String closedAt ; // 풀리퀘 마감한 날
	private String mergedAt; // 풀리퀘 머지한 날 
	private String head;  // 브랜치명 
	private String base; // 병합할 브랜치명 
	
	
	
	
	//===================== 풀리퀘의 작성자에 대한 내용
	private String user; // 풀리퀘 작성자의 깃허브닉네임
	private String userId; // 풀리퀘 작성자의 id(숫자로 이뤄짐)
	private String profile; // 풀리퀘 작성자의 프로필  -> avatar_url 값이 들어갈듯

	private String login; 
	
	
	
	//======================== 레파지토리 및 라벨..? =========================
	
	private String fullName; // 풀리퀘가 속한 레파지토리 이름 // 우린 nangmangorani/OKKH
	private String repoId; //  혹시 몰라서 레파지토리 id(숫자로 이뤄짐)도 일단 생성
    private String milestone;  // 마일스톤
    private int milestoneNum;  // 마일스톤 번호
	private String [] labels;// 라벨 배열 
	private int number;  // 풀리쿼 번호 혹은 이슈 마일스튼 번호..?
	
	

	//==================== 풀리퀘의 담당자 및 리뷰어들에 대한 곳  =======================

	private String [] assignees ;// 풀리퀘 담당자
	private String [] assigneeProfiles; // 풀리퀘 담당자의 프로필 -> avatar_url 값이 들어갈듯
	private String[] requestedReviewrs; // 풀리퀘 작성자가 리뷰 요청한 회원 
	private String[] requestedProfiles; // 풀리퀘 리뷰 담당자들 프로필 -> avatar_url 값이 들어갈듯

	
	
	//================= 커밋에 대한 이모저모... ===========================
	private String message; // 커밋 내용
	private String committer; // 커밋한 사람 닉네임 가져오기 
	private String commitUrl; // 커밋한 htmlURL... 일단 필요할 수도 있어서...
	
}
