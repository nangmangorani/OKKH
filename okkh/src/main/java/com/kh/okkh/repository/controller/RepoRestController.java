package com.kh.okkh.repository.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import static com.kh.okkh.common.model.service.GitHubTemplate.*;

import java.io.FileNotFoundException;
import java.io.IOException;

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
	public String titleCheck(String checkTitle, HttpSession session) throws IOException {
		
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
		
		// 결과를 담을 result 생성 및 초기화
		String result = "";
		
		try {
			// GitHubTemplate을 static으로 올려서 사용 => api url을 작성해주는 template
			// 조회한 결과를 result에 담는다
			result = getGitHubAPIValue(g);
		} catch (FileNotFoundException e) {
			// 오류 확인을 원할 때는 밑에 주석 제거
			// e.printStackTrace();
		}
		
//		System.out.println(result);
		
		return result;
		
	}
	
	/**
	 * 레포지토리에 속한 컨텐츠 조회용 Controller
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "selectRepoContents.re", produces = "application/json; charset=UTF-8")
	public String selectRepoContents(int mpno, String rnm, String path, HttpSession session, Model model) throws IOException {
		
		mypro = rService.selectMyProjectTitle(mpno);
		
		token = (String)session.getAttribute("token");
		
		g = new GitHub();
		
		g.setMethod("GET");
		g.setToken(token);
		g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/contents");
		
		String response = getGitHubAPIValue(g);
		
//		System.out.println(token);
//		System.out.println(response);

		return response;
		
	}

}
