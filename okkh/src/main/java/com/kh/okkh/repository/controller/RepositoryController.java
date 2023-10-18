package com.kh.okkh.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {
	
	// 나중에 서비스 만들면 여기에 추가쓰
	
	/**
	 * 내 프로젝트 조회용 컨트롤러
	 * 
	 * @author 윤관현
	 */
	@RequestMapping("myProject.re")
	public String selectProjectList() {
		
		return "repo/myProject";
		
	}
	
	/**
	 * 레파지토리 조회용 컨트롤러
	 *
	 * @param pno => 프로젝트 번호
	 * @author 윤관현
	 */
	@RequestMapping("repoList.re")
	public String selectRepoList(int pno) {
		
		return "repo/repoList";
		
	}
	
	/**
	 * 레파지토리 상세조회용 컨트롤러
	 * 
	 * @param rno => 레파지토리 번호
	 * @author 윤관현
	 */
	@RequestMapping("repoDetail.re")
	public String selectRepo(int rno) {
		
		return "repo/repoDetail";
		
	}
	
	/**
	 * 레파지토리에 속한 코드 조회용 컨트롤러
	 * 
	 * @param rno => 레파지토리 번호
	 * @author 윤관현
	 */
	@RequestMapping("codeDetail.re")
	public String selectCode(int rno) {
		
		return "repo/codeDetail";
		
	}

}
