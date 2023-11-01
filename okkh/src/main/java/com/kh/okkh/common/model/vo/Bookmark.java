package com.kh.okkh.common.model.vo;

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
public class Bookmark {

	private int memNo;  // 북마크한 회원 번호
	private int proNo;  // 북마크한 게시글 번호 -> 프로젝트는 sequence가 1부터 시작, pr은 1000부터 시작
	
}
