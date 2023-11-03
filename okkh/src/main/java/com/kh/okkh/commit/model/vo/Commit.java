package com.kh.okkh.commit.model.vo;

import org.springframework.stereotype.Service;

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
public class Commit {

	private String login;  // 커밋한 사람의 깃닉네임
	private String massage ;  // 커밋 내용
	private String url ; // 커밋한 곳을 가기위한 htmlUrl 주소
	private String profile; // 커밋한 사람의 프로필 주소
	private String createDate; // 커밋한 날짜
	
}
