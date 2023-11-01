package com.kh.okkh.pullRequest.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

/**
 * @author 유정(호빵)
 *
 */
@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GitCommit {

	// 커밋에 대한 것들....이모저모
	private String committer;  // 커밋한 사람의 프로필....
	private String commitContent; // 커밋한 내용
	
}
