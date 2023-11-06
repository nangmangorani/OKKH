package com.kh.okkh.repository.model.vo;

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
public class GithubRepo {
	
//	private String id;
	private String name;
	private String path;
	private String description;
//	private String visibility;
//	private Object owner;
	/*
	@AllArgsConstructor
	@Getter
	@Setter
	@ToString
	public class Object {
		
		private String avatar_url;
		
	}
	*/
}
