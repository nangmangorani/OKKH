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
public class PullReview {

	private int pullReviewNo;
	private int refPull; // 참조 풀리퀘 번호
	private String pullReviewWriter; // 풀리퀘 리뷰 작성자를 닉네임으로 보여줄거임
	private String reviewContent;
	private String createDate; // String 형으로 할거임
	private int pullReviewCount;
	private String state;
	private String profile;
	private int id;  // 풀리퀘 리뷰 아이디
	
}
