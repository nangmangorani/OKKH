package com.kh.okkh.repository.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.dao.RepoDao;
import com.kh.okkh.repository.model.vo.GithubRepo;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

/**
 * 마이 프로젝트, 완료된 프로젝트, 레파지토리 서비스
 * 
 * @author 윤관현
 *
 */
@Service
public class RepoImpl implements RepoService {
	
	@Autowired
	private RepoDao rdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<MyProject> selectMyProjectList(Member loginMember) {
		return rdao.selectMyProjectList(sqlSession, loginMember);
	}

	@Override
	public ArrayList<Member> selectTeamMateList(int memNo) {
		return rdao.selectTeamMateList(sqlSession, memNo);
	}
	
	@Override
	public int insertMyProject(MyProject p) {
		return rdao.insertMyProject(sqlSession, p);
	}
	
	/**
	 * @throws IOException 
	 * 레파지토리 전체조회용 서비스
	 * 
	 * @param pno => 레파지토리가 위치해있는 프로젝트 번호 / session => token 호출을 위한 session
	 * @return 
	 * @author 윤관현
	 */
	public ArrayList<GithubRepo> getRepositoryList(int myproNo, String token) throws IOException {
		
		/*
		// WebClient 방식
		String response = webClient
				.get()
				.uri("https://api.github.com/repos/YoonTarget/test")
				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		
		ObjectMapper objecMapper = new ObjectMapper();
		JsonNode jsonNode;
		Repo r = new Repo();
		
		// login => nickname
		try {
			jsonNode = objecMapper.readTree(response);
			
			r.setRepoTitle(jsonNode.get("name").asText());
			r.setRepoContent(jsonNode.get("description").asText());
			r.setRepoStatus(jsonNode.get("visibility").asText());
			r.setAvatar(jsonNode.get("owner").get("avatar_url").asText());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return r;
		*/
		
		// HttpURLConnection 방식
		// 요청할 url 설정
		String url = "https://api.github.com/orgs/kh05final/repos?direction=desc";
		
		// url에 연결할 준비
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		// url header에 들어가는 설정
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Accept", "application/vnd.github+json");
		urlConnection.setRequestProperty("Authorization", "Bearer " + token);
		urlConnection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28");
		
		// 요청한 url에서 넘어온 값을 읽을 준비
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		// 넘어온 Json을 담을 String 준비
		String responseText = "";
		String line;
		
		// 읽을 값이 없어질 때까지 한 줄씩 읽어서 미리 준비한 responseText 객체에 차곡차곡 옮겨담기
		while((line = br.readLine()) != null) {
			
			responseText += line;
			
		}
		

		// reader와 urlConnector는 임무를 다했으니 귀가 하도록!!
		br.close();
		urlConnection.disconnect();
		
		// Json을 변환하여 담을 ArrayList 준비
		Type type = new TypeToken<ArrayList<GithubRepo>>() {}.getType();
		
		// Gson 객체를 생성해서 Json을 ArrayList로 변환하여 차곡차곡 옮겨담기
		ArrayList<GithubRepo> repoList = new Gson().fromJson(responseText, type);
		
		
		return repoList;
		
	}

	/**
	 * WebClient 테스트용
	 *
	 */
	@Override
	public String synHttpRequest(String path, HttpSession session, String method) {
		return null; 
	}

	/**
	 * 레포가 담긴 프로젝트명 조회용 서비스
	 */
	@Override
	public MyProject selectMyProject(int myproNo) {
		return rdao.selectMyProject(sqlSession, myproNo);
	}

	@Override
	public int titleCheck(String checkTitle, HttpSession session) {
		return 0;

	}

	@Override
	public int updateIngToFin(int myproNo) {
		return rdao.updateIngToFin(sqlSession, myproNo);
	}

	@Override
	public int updateTeam(int memNo) {
		return rdao.updateTeam(sqlSession, memNo);
	}

}
