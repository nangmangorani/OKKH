package com.kh.okkh.repository.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.kohsuke.github.GitHub;
import org.kohsuke.github.GitHubBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.common.model.service.GithubService;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.service.RepoImpl;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

/**
 * 마이 프로젝트, 완료된 프로젝트, 레파지토리 컨트롤러
 * 
 * **프로젝트 모집은 projectController로 가주세용~!~!**
 * 
 * @author 윤관현
 *
 */
@Controller
public class RepositoryController {
	
	// 깃허브에 붙는 작업들은 깃허브 서비스로 보냄
	@Autowired
	private GithubService gService;
	
	// local DB에 붙는 작업들은 레포 서비스로 보냄
	@Autowired
	private RepoImpl rService;
	
	/**
	 * 내 프로젝트 조회용 컨트롤러
	 * 
	 */
	@RequestMapping("myProject.re")
	public ModelAndView selectMyProjectList(HttpSession session, ModelAndView mv) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		//System.out.println(loginMember);
		
		ArrayList<MyProject> pList = rService.selectMyProjectList(loginMember);

		// 진행중인 프로젝트들을 담을 arrayList 준비
		ArrayList<MyProject> pIngList = new ArrayList<>();
		
		// 완료된 프로젝트들을 담을 arrayList 준비
		ArrayList<MyProject> pEndList = new ArrayList<>();
		
		for(MyProject p : pList) {
			
			if(p.getMyproStatus().equals("Y")) {
				// 진행중인 프로젝트라면 rIngList에 담기
				pIngList.add(p);
			}
			else {
				// 완료된 프로젝트라면 rEndList에 담기
				pEndList.add(p);
			}
			
		}
		
		mv.addObject("pIngList", pIngList).addObject("pEndList", pEndList).setViewName("repo/myProject");
		
		return mv;
		
	}
	
	/**
	 * 레파지토리 조회용 컨트롤러
	 *
	 * @param pno => 프로젝트 번호
	 */
	@RequestMapping("repoList.re")
	public String selectRepoList(int pno) {
		
		return "repo/repoList";
		
	}
	
	/**
	 * 레파지토리 상세조회용 컨트롤러
	 * 
	 * @param rno => 레파지토리 번호
	 */
	@RequestMapping("repoDetail.re")
	public String selectRepo(int rno) {
		
		return "repo/repoDetail";
		
	}
	
	/**
	 * 레파지토리에 속한 코드 조회용 컨트롤러
	 * 
	 * @param rno => 레파지토리 번호
	 */
	@RequestMapping("codeDetail.re")
	public String selectCode(int rno) {
		
		return "repo/codeDetail";
		
	}
	
	/**
	 * 레파지토리 추가용 컨트롤러
	 */
	@RequestMapping("insertRepo.re")
	public void insertRepo(Repo r) {
		
		// System.out.println(r);
		
		gService.insertRepo(r);
		
	}
	
}
