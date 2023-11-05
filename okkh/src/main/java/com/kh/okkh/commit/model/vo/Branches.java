package com.kh.okkh.commit.model.vo;

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
public class Branches {

	private String name; // 브랜치명 
	private String url; // 해당 브랜치에 저장된 커밋내용들이 담겨있음 .. 이건 혹시몰라서 뽑음 
	
	
}
