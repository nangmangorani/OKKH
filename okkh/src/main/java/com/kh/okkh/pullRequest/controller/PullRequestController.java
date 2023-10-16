package com.kh.okkh.pullRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PullRequestController {
	
	/**
	 * 풀-리퀘스트 조회용 컨트롤러
	 * 
	 * @author 윤관현
	 */
	@RequestMapping("myPullRequest.pu")
	public String selectPullRequestList() {
		
		return "pullRequest/myPullRequest";
		
	}

}
