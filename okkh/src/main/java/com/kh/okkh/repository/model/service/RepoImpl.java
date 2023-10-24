package com.kh.okkh.repository.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.dao.RepoDao;
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

	@Override
	public String synHttpRequest(String path, HttpSession session, String method) {
		String token = ((Member) session.getAttribute("loginMember")).getMemToken();

		WebClient client = WebClient.builder()
				.baseUrl("https://api.github.com/user")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();

		String response = null;

		if (method.equals("get")) {
			response = client.get().uri(path).retrieve().bodyToMono(String.class).block();
		} else if (method.equals("put")) {
			response = client.put().uri(path).retrieve().bodyToMono(String.class).block();
		} else if (method.equals("delete")) {
			response = client.delete().uri(path).retrieve().bodyToMono(String.class).block();
		}

		return response;
	}

}
