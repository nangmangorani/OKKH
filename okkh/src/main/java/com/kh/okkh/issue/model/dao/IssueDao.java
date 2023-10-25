package com.kh.okkh.issue.model.dao;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.member.model.vo.Member;

@Repository
public class IssueDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WebClient webClient;
	
//	public ArrayList<Issue> selectIssueList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("issueMapper.selectIssueList");
//		
//	}
	
	
	public String getGitContentsByGet1(String path, HttpSession session) {
		
		String token = ((Member)(session.getAttribute("git"))).getMemToken();
		System.out.println("토큰인데 잘있거든?" + token);
		System.out.println("path" + path);
		String response = webClient
				.get()
				.uri("https://api.github.com/repos/"+path)
				.header(HttpHeaders.AUTHORIZATION,"Bearer "+token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		System.out.println("here!!!!! " + response);
		return response;
		
	}
	
	

}
