package com.kh.okkh.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {
	
	// 나중에 서비스 만들면 여기에 추가쓰
	
	/*
	 * repo 조회용
	 */
	@RequestMapping("repoList.re")
	public String selectRepoList() {
		
		return "repo/repoList";
		
	}

}
