package com.kh.okkh.repository.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.filters.SetCharacterEncodingFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import static com.kh.okkh.common.model.service.GitHubTemplate.*;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import com.kh.okkh.common.model.vo.GitHub;
import com.kh.okkh.repository.model.service.RepoImpl;
import com.kh.okkh.repository.model.vo.MyProject;

/**
 * GitHub REST API용 Rest Controller
 * => Controller + Response Body 형태
 * => 무조건 객체 반환
 * 
 * GitHub REST API를 사용하지만 View를 반환하는 Controller는 RepositoryController에 있당
 * 
 * @author Target
 *
 */
@RestController
public class RepoRestController {
	
	@Autowired
	private RepoImpl rService;
	
	private GitHub g;
	
	private String token;
	
	private MyProject mypro;
	
	/**
	 * 프로젝트 등록시 프로젝트명과 조직의 owner명이 일치하는지 대조하는 Controller
	 * 
	 * @param checkTitle => 대조할 프로젝트명(조직의 owner명)
	 * @param session => token 호출에 필요
	 * @return result => api에 접근해서 가져올 결과값
	 * @throws IOException 
	 * @author Target
	 */
	@ResponseBody
	@RequestMapping(value = "titleCheck.re", produces = "application/json; charset=UTF-8")
	public String titleCheck(String checkTitle, HttpSession session) {
		
		// api에 접근할 때 필요한 토큰
		token = (String)session.getAttribute("token");
		
		// 기본 url 뒤에 붙을 uri (조직 정보 조회 API)
		String uri = "/orgs/" + checkTitle;
		
		// GET => checkTitle에 들어있는 이름이 있는지 조회를 해야하기 때문
		String method = "GET";
		
		g = new GitHub();
		
		g.setToken(token);
		g.setUri(uri);
		g.setMethod(method);
		
		String result = "";
		
		try {
			// 해당 조직이 깃허브에 있는지 체크
			result = getGitHubValue(g);
			
			// 결과가 넘어오면 해당 조직의 멤버를 검색한다
			g.setUri("/orgs/" + checkTitle + "/members");
			
			// 프로젝트를 등록하고자 하는 사람이 조직 구성원인지 체크
			result = getGitHubValue(g);
			
		} catch (Exception e) {
			// 오류 발생시 콘솔에 띄워줄 메세지
		}
		
		
		// 결과값 반환
		return result;
		
	}
	
	public String selectTeamMate() {
		
		String response = "";
		
		return response;
		
	}
	
	/**
	 * 레포명 유효성 검사용 컨트롤러
	 * 
	 * @param checkTitle : 입력한 레포명
	 * @param myproTitle : 프로젝트명(조직명)
	 * @param session
	 * @return result : 결과값
	 */
	@RequestMapping(value = "repoTitleCheck.re", produces = "application/json; charset=UTF-8")
	public String repoTitleCheck(String checkTitle, String myproTitle, HttpSession session) {
		
		// api에 접근할 때 필요한 토큰
		token = (String)session.getAttribute("token");
		
		// 기본 url 뒤에 붙을 uri (레포 정보 조회 API)
		String uri = "/repos/" + myproTitle + "/" + checkTitle;
		
		// GET => checkTitle에 들어있는 이름이 있는지 조회를 해야하기 때문
		String method = "GET";
		
		g = new GitHub();
		
		g.setToken(token);
		g.setUri(uri);
		g.setMethod(method);
		
		String result = "";
		
		try {
			// 템플릿에 값들을 보내 결과값을 받는다
			result = getGitHubValue(g);
			
		} catch (Exception e) {
			// 오류 발생시 콘솔에 띄워줄 메세지
			System.out.println("사용 가능한 레포명!!");
		}
		
//				System.out.println(result);
		
		// 결과값 반환
		return result;
		
	}
	
	/**
	 * 코드 조회용 Controller (ajax 호출 방식)
	 * 
	 * @return response : 넘어온 코드 내용
	 * @throws IOException
	 */
	@RequestMapping(value = "selectCode.re", produces = "text/html; charset=UTF-8")
	public String selectRepoContents(int mpno, String rnm, String path, HttpSession session, Model model) {
		
		mypro = rService.selectMyProject(mpno);
		
		token = (String)session.getAttribute("token");
		
		g = new GitHub();
		
		g.setMethod("GET");
		g.setToken(token);
		// 코드를 가져오는 uri
		g.setUri("/" + mypro.getMyproTitle() + "/" + rnm + "/main/" + path);
		
		String response = getGitHubCode(g);
		
		return response;
		
	}
	
}
