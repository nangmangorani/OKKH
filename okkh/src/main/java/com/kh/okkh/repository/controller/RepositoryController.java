package com.kh.okkh.repository.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
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

import com.kh.okkh.common.model.service.GitHubTemplate;
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
	
	private GitHub g;
	
	private String token;
	
	private MyProject mypro;
	
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
		
		try {
			
			ArrayList<Member> teamMate = rService.selectTeamMateList(((Member)(session.getAttribute("loginMember"))).getMemNo());

			return new Gson().toJson(teamMate);
			
		} catch (Exception e) {
			
			 System.out.println("로그인 안 하고 팀원 목록 조회에 접근");
			 
			 String exeption = "로그인 후에 이용 가능한 서비스입니다.";
			 
			 return exeption;
			
		}
		
		
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
			/*
			token = (String)session.getAttribute("token");
			
			String teamMate = p.getMyproMember();
			
			String[] teamArr = teamMate.split(",");
			
			g = new GitHub();
			
			g.setMethod("POST");
			g.setToken(token);
			g.setUri("/orgs/" + p.getMyproTitle() + "/invitations");
			
			System.out.println("/orgs/" + p.getMyproTitle() + "/invitations");
			
			ArrayList<Object> list = new ArrayList<Object>();

			for(int i = 0; i <teamArr.length; i++) {
				
				Map<String, Object> params = new LinkedHashMap<String, Object>();
				
				params.put("invitee_id", "nangmangorani");
				params.put("role", "admin");
				
				g.setParams(params);
				
				list.add(getGitHubValue(g));
				
			}
			*/
			return "redirect:myProject.re";
		}
		else {
			return "common/errorPage";
		}
		
		
	}
	
	/**
	 * 프로젝트 완료 처리하는 Controller
	 * 
	 * @param myproNo
	 * @return 내 프로젝트 페이지
	 */
	@RequestMapping("updateIngToFin.re")
	public String updateIngToFin(int myproNo) {
		
		int result = rService.updateIngToFin(myproNo);
		
		if(result > 0) {
			return "redirect:/myProject.re";
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
	public String selectRepoList(int pno, HttpSession session, Model model) {
		
//		System.out.println(pno);
		
		// 레파지토리가 담겨있는 프로젝트의 이름 조회
		mypro = rService.selectMyProject(pno);
		
//		System.out.println(mypro.getMyproTitle());
		
		// api 사용을 위해 session에 있는 token 호출
		token = (String)session.getAttribute("token");
		
//		System.out.println(pno);
		
		// 서비스단으로 꼬고!!
//		ArrayList<GithubRepo> repoList = rService.getRepositoryList(pno, token);
		
		g = new GitHub();
		
		// 요청 방식
		g.setMethod("GET");
		// 토큰 가져옴
		g.setToken(token);
		// Base URL 뒤에 붙일 URI (조직에 속한 레포 조회 API)
		g.setUri("/orgs/" + mypro.getMyproTitle() + "/repos");
		// 파라미터 값 담기 (여러개가 올 경우에 누적합으로 담기 위해 변수에 따로 담은 후 객체에 저장)
//		String param = "?direction=desc";
//		param += "&type=all";
		
		// GitHubTemplate에서 넘어온 JSON 값을 받는다
		String response = getGitHubValue(g);
		
		// Json을 변환하여 담을 ArrayList 준비
		Type type = new TypeToken<ArrayList<Object>>() {}.getType();
		
		// Gson 객체를 생성해서 Json을 ArrayList로 변환하여 차곡차곡 옮겨담기
		ArrayList<Object> repoList = new Gson().fromJson(response, type);
		
		// DB에서 조회한 프로젝트명과 깃허브에서 조회한 repoListd를 레포 조회 페이지로 보낸다잉
		model.addAttribute("mypro", mypro);
		model.addAttribute("repoList", repoList);
		
		// 레포 페이지로 이동
		return "repo/repoList";
		
	}
	
	/**
	 * 레파지토리 추가용 컨트롤러
	 * @throws IOException 
	 */
	@RequestMapping("insertRepo.re")
	public String insertRepo(int myproNo, Repo r, HttpSession session) {
		
		// 조직명(프로젝트명) 가져오기
		mypro = rService.selectMyProject(myproNo);
		// 토큰 뽑아오기
		token = (String)session.getAttribute("token");
		
		g = new GitHub();
		
		// 필요한 요소들 세팅
		g.setMethod("POST");
		g.setToken(token);
		g.setUri("/orgs/" + mypro.getMyproTitle() + "/repos");
		
		// 매개변수의 key, value를 담아줄 Map 세팅
		Map<String, Object> params = new LinkedHashMap<String, Object>();
		params.put("name", r.getRepoTitle());
		params.put("description", r.getRepoContent());
		params.put("visibility", r.getRepoStatus());
		params.put("auto_init", "true");
		
//		System.out.println(params);
		
		g.setParams(params);
		
		// 템플릿에서 얻은 결과값 받음
		String response = getGitHubValue(g);
		
		if(response != null) {
			return "redirect:repoList.re?pno=" + mypro.getMyproNo();
		}
		else {
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 팀원 초대용 컨트롤러
	 * 
	 * @param myproNo
	 * @param r
	 * @param session
	 * @return
	 */
	@RequestMapping("inviteMember.re")
	public String inviteMember(int myproNo, Repo r, HttpSession session) {
		
		// 조직명(프로젝트명) 가져오기
		mypro = rService.selectMyProject(myproNo);
		
		System.out.println(mypro);
		// 토큰 뽑아오기
		token = (String)session.getAttribute("token");
		
		// 팀원들을 조회해 "," 기준으로 배열로 정렬한다
		String teamMate = mypro.getMyproMember();
		
		String[] teamArr = teamMate.split(",");
		
		g = new GitHub();
		
		// 필요한 요소들 세팅
		g.setMethod("PUT");
		g.setToken(token);
		
		// 넘어올 값들을 담아줄 list
		ArrayList<Object> list = new ArrayList<Object>();
		
		for(int i = 0; i <teamArr.length; i++) {
			
			g.setUri("/repos/" + mypro.getMyproTitle() + "/" + r.getRepoTitle() + "/collaborators/" + teamArr[i]);
			
			list.add(getGitHubValue(g));
			
		}
		
		System.out.println(list);
		
		return "redirect:repoList.re?pno=" + mypro.getMyproNo();
		
	}
	
	/**
	 * 레포 수정용 Controller
	 * 
	 * @param mypro
	 * @param repoTitle
	 * @param session
	 * @return
	 */
	@RequestMapping("updateRepo.re")
	public String updateRepo(int myproNo, Repo r, HttpSession session) {
		
		// 조직명(프로젝트명) 가져오기
		mypro = rService.selectMyProject(myproNo);
		// 토큰 뽑아오기
		token = (String)session.getAttribute("token");
		
		g = new GitHub();
		
		// 필요한 요소들 세팅
		g.setMethod("PATCH");
		g.setToken(token);
		g.setUri("/repos/" + mypro.getMyproTitle() + "/" + r.getRepoTitle());
		
		// 매개변수의 key, value를 담아줄 Map 세팅
		Map<String, Object> params = new LinkedHashMap<String, Object>();
		params.put("name", r.getUpdateTitle());
		params.put("description", r.getRepoContent());
		params.put("visibility", r.getRepoStatus());
		
//				System.out.println(params);
		
		g.setParams(params);
		
		// 템플릿에서 얻은 결과값 받음
		String response = getGitHubValue(g);
		
		if(response != null) {
			return "redirect:repoList.re?pno=" + mypro.getMyproNo();
		}
		else {
			return "common/errorPage";
		}
				
	}
	
	/**
	 * 레포 삭제용 Controller
	 * 
	 * @param mypro : 내 프로젝트 번호, 내 프로젝트명
	 * @param repoTitle : 레포명
	 * @param session : token을 가져오기 위한 session
	 * @return : 레포 리스트 조회 페이지
	 */
	@RequestMapping("deleteRepo.re")
	public String deleteRepo(MyProject mypro, String repoTitle, HttpSession session) {
		
		// 토큰 뽑아오기
		token = (String)session.getAttribute("token");
		
		// 필요한 값들 담아서 옮길 GitHub 객체 생성
		g = new GitHub();
		
		// 요청 방식 => 삭제
		g.setMethod("DELETE");
		// api와 연결하기 위한 token
		g.setToken(token);
		// 레포 삭제 uri => /repos/{owner}/{repo}
		g.setUri("/repos/" + mypro.getMyproTitle() + "/" + repoTitle);
		
		// 템플릿에 객체를 보내서 delete 실행
		getGitHubValue(g);
		
		// repoList 페이지로 돌아감
		return "redirect:repoList.re?pno=" + mypro.getMyproNo();
		
	}
	
	/**
	 * 레파지토리 상세조회용 컨트롤러
	 * 
	 * @param pno => 프로젝트 번호, rnm => 레파지토리명, vis => public/private
	 * @throws IOException 
	 */
	@RequestMapping("repoDetail.re")
	public String selectRepo(int pno, String rnm, String vis, String ava, String path, HttpSession session, Model model) {
		
		// 가져온 프로젝트 번호를 통해 번호와 프로젝트명을 조회한다
		mypro = rService.selectMyProject(pno);
		
		// 세션에서 토큰을 가져온다
		token = (String)session.getAttribute("token");
		
		
		// 기본 uri는 레포의 컨텐츠를 모두 조회하는 것으로 한다
		String uri = "";
		
		// 만약에 path 값이 있다면 uri는 path에 해당하는 컨텐츠를 조회하는 것으로 한다
		if(path != null) {
			uri = "/" + path;
		}
		
		// 템플릿에 필요한 값들을 담아서 보낼 GitHub 객체 생성
		g = new GitHub();
		
		// 값들을 차곡차곡 담기
		g.setMethod("GET");
		g.setToken(token);
		g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/contents" + uri);
		
		// 템플릿에 보낸 후 다시 넘어온 결과값을 ArrayList에 담기
		ArrayList<Object> list = getGitHubList(g);
		
		// list에 값이 있다면 커밋, 브랜치 리스트 조회
		if(!list.isEmpty()) {
			
			// 커밋 리스트 조회용 uri 세팅
			g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/commits");
			
			// 결과값을 ArrayList로 받음
			ArrayList<Object> cList = getGitHubList(g);
			
			// 최신 커밋 내역만 추출
			Object recentCommit = cList.get(0);
			
			model.addAttribute("recentCommit", recentCommit);
			
			/*
			for(Object p : list) {
				
				String path = p.toString();
				
				pArr.add(path.substring(path.indexOf("path"), path.indexOf(", sha")));
			}
			
			path = path.substring(path.indexOf("path"), path.indexOf(", sha"));
			 */
			
			// 브랜치 조회용 uri 세팅
			g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/branches");
			
			// 브랜치 리스트
			ArrayList<Object> bList = getGitHubList(g);
			
			model.addAttribute("bList", bList);
			
		}
		
		// model로 세팅해서 view단으로 보냄
		model.addAttribute("mypro", mypro);
		model.addAttribute("repoName", rnm);
		model.addAttribute("visibility", vis);
		model.addAttribute("avatar_url", ava);
		model.addAttribute("list", list);
		
		// page 호출
		return "repo/repoDetail";
		
	}
	
	/**
	 * 컨텐츠 상세조회용 컨트롤러
	 * 
	 * @return
	 */
	@RequestMapping("contentDetail.re")
	public String contentDetail(int pno, String rnm, String vis, String ava, String path, HttpSession session, Model model) {
		
		System.out.println(path);
		
		// 가져온 프로젝트 번호를 통해 번호와 프로젝트명을 조회한다
		mypro = rService.selectMyProject(pno);
		
		// 세션에서 토큰을 가져온다
		token = (String)session.getAttribute("token");
		
		// 템플릿에 필요한 값들을 담아서 보낼 GitHub 객체 생성
		g = new GitHub();
		
		// 값들을 차곡차곡 담기
		g.setMethod("GET");
		g.setToken(token);
		g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/contents/" + path);
		
		// 템플릿에 보낸 후 다시 넘어온 JSON 결과값 받기
		String response = getGitHubValue(g);
		
		// Json을 변환하여 담을 Object 준비
		Type type = new TypeToken<Object>() {}.getType();
		
		// Gson 객체를 생성해서 Json을 Object로 변환하여 차곡차곡 옮겨담기
		Object content = new Gson().fromJson(response, type);
		
		// list에 값이 있다면 커밋 리스트 조회
		if(content != null) {
			
			// 커밋 리스트 조회용 uri 세팅
			g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/commits");
			
			// 결과값을 ArrayList로 받음
			ArrayList<Object> cList = getGitHubList(g);
			
			// 최신 커밋 내역만 추출
			Object recentCommit = cList.get(0);
			
			model.addAttribute("recentCommit", recentCommit);
			
			/*
			for(Object p : list) {
				
				String path = p.toString();
				
				pArr.add(path.substring(path.indexOf("path"), path.indexOf(", sha")));
			}
			
			path = path.substring(path.indexOf("path"), path.indexOf(", sha"));
			 */
			
		}
		
		// model로 세팅해서 view단으로 보냄
		model.addAttribute("mypro", mypro);
		model.addAttribute("repoName", rnm);
		model.addAttribute("visibility", vis);
		model.addAttribute("avatar_url", ava);
		model.addAttribute("content", content);
		
		// page 호출
		return "repo/contentDetail";
		
	}
	
	/**
	 * merge 테스트 컨트롤러
	 * 
	 * @return
	 */
	@RequestMapping("merge.re")
	public String mergeTest(HttpSession session) {
		
		g = new GitHub();
		
		g.setMethod("POST");
		g.setToken((String)session.getAttribute("token"));
		g.setUri("/repos/kh05final/nonfiction/merges");
		
		Map<String, Object> params = new LinkedHashMap<String, Object>();
		params.put("base", "main");
		params.put("head", "test");
		params.put("commit_message", "되나??");
		
		g.setParams(params);
		
		System.out.println(getGitHubValue(g));
		
		return "redirect:/";
		
	}
	
	@RequestMapping("commitList.re")
	public String selectCommitList(String owner, String repo, String vis, String avatar, HttpSession session, Model model) {
		
		g = new GitHub();
		
		g.setMethod("GET");
		g.setToken((String)session.getAttribute("token"));
		g.setUri("/repos/" + owner + "/" + repo + "/commits");
		
		ArrayList<Object> commitList = getGitHubList(g);
		
		model.addAttribute("owner", owner);
		model.addAttribute("repo", repo);
		model.addAttribute("visibility", vis);
		model.addAttribute("avatar_url", avatar);
		model.addAttribute("commitList", commitList);
		
		return "repo/commitList";
		
	}
	
}
