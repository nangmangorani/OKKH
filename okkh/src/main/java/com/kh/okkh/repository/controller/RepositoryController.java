package com.kh.okkh.repository.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import static com.kh.okkh.common.model.service.GitHubTemplate.*;
import com.kh.okkh.common.model.service.GithubService;
import com.kh.okkh.common.model.vo.GitHub;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.service.RepoImpl;
import com.kh.okkh.repository.model.vo.GithubRepo;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

/**
 * 마이 프로젝트, 완료된 프로젝트, 레파지토리 컨트롤러
 * 
 * **프로젝트 모집은 projectController로 가주세용~!~!**
 * 
 * @author Target
 *
 */
@Controller
public class RepositoryController {
	
	@Autowired
	private RepoImpl rService;
	
	/**
	 * 내 프로젝트 조회용 컨트롤러
	 * 
	 */
	@RequestMapping("myProject.re")
	public String selectMyProjectList(HttpSession session, Model model) {
		
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
		
		model.addAttribute("pIngList", pIngList);
		model.addAttribute("pEndList", pEndList);
		
		return "repo/myProject";
		
	}
	
	/**
	 * 내 팀원 조회용 컨트롤러
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "selectTeamMateList.re", produces = "application/json; charset=UTF-8")
	public String selectTeamMateList(HttpSession session) {
		
		ArrayList<Member> teamMate = rService.selectTeamMateList(((Member)(session.getAttribute("loginMember"))).getMemNo());
		
		return new Gson().toJson(teamMate);
		
	}
	
	/**
	 * 내 프로젝트 추가용 컨트롤러
	 * 
	 * @param p => 내 프로젝트 추가에 필요한 객체
	 */
	@RequestMapping("insertMyProject.re")
	public String insertMyProject(MyProject p, HttpSession session, Model model) {
		
//		 System.out.println(p);
		 
		int result = rService.insertMyProject(p);
		
		if(result > 0) {
			return "redirect:myProject.re";
		}
		else {
			return "common/errorPage";
		}
		
		
	}
	
	/**
	 * 레파지토리 조회용 컨트롤러
	 *
	 * @param pno => 프로젝트 번호
	 * @throws IOException 
	 */
	@RequestMapping("repoList.re")
	public String selectRepoList(int pno, HttpSession session, Model model) throws IOException {
		
//		System.out.println(pno);
		
		// 레파지토리가 담겨있는 프로젝트의 이름 조회
		MyProject mypro = rService.selectMyProjectTitle(pno);
		
//		System.out.println(mypro.getMyproTitle());
		
		// api 사용을 위해 session에 있는 token 호출
		String token = (String)session.getAttribute("token");
		
//		System.out.println("selectRepoList token : " + token);
		
//		System.out.println(pno);
		
		// 서비스단으로 꼬고!!
//		ArrayList<GithubRepo> repoList = rService.getRepositoryList(pno, token);
		
		// URL에 들어갈 값들을 담아줄 객체 생성
		GitHub g = new GitHub();
		
		// 요청 방식
		g.setMethod("GET");
		// 토큰 가져옴
		g.setToken(token);
		// Base URL 뒤에 붙일 URI (조직에 속한 레포 조회 API)
		g.setUri("/orgs/" + mypro.getMyproTitle() + "/repos");
		// 파라미터 값 담기 (여러개가 올 경우에 누적합으로 담기 위해 변수에 따로 담은 후 객체에 저장)
		String param = "?direction=desc";
		param += "&type=all";
		g.setParam(param);
		
		// GitHubTemplate에서 넘어온 JSON 값을 받는다
		String response = getGitHubAPIValue(g);
		
		// Json을 변환하여 담을 ArrayList 준비
		Type type = new TypeToken<ArrayList<GithubRepo>>() {}.getType();
		
		// Gson 객체를 생성해서 Json을 ArrayList로 변환하여 차곡차곡 옮겨담기
		ArrayList<GithubRepo> repoList = new Gson().fromJson(response, type);
		
//		System.out.println(r);
		
//		model.addAttribute("r", r);
		
		// DB에서 조회한 프로젝트명과 깃허브에서 조회한 repoListd를 레포 조회 페이지로 보낸다잉
		model.addAttribute("mypro", mypro);
		model.addAttribute("repoList", repoList);
		
		// 레포 페이지로 이동
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
		
		 System.out.println(r);
		
//		gService.insertRepo(r);
		
	}
	
}
