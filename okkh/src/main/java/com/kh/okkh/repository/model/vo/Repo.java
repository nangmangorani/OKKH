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
public class Repo {
	
	private int repoNo;			// 레파지토리 번호
	private String repoTitle;	// 레파지토리 이름
	private String updateTitle;	// 수정할 레파지토리 이름
	private String repoContent;	// 레파지토리 내용
	private String repoStatus;	// 레파지토리 공개여부
	private Date createDate;	// 레파지토리 생성일
	private String status;		// 레파지토리 삭제여부
	private String avatar;		// 레파지토리 주인의 프로필 사진
	
}
