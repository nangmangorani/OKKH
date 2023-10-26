package com.kh.okkh.issue.model.dao;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.issue.model.vo.Issue;
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
		String response = webClient
				.get()
				.uri("https://api.github.com/repos/"+path)
				.header(HttpHeaders.AUTHORIZATION,"Bearer "+token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		return response;
		
	}
	
	public String getIssuesByMno(String repository, String token, String state, int mno) throws JsonMappingException, JsonProcessingException {
		// https://api.github.com/repos/nangmangorani/01_java-workspace/issues?milestone=6
		repository = repository + "/issues?milestone=" + mno;
		
		String response = webClient
						  .get()
						  .uri("https://api.github.com/repos/" + repository)
						  .header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
						  .header(HttpHeaders.ACCEPT, "")
						  .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
						  .retrieve()
						  .bodyToMono(String.class)
						  .block();
		

		return response;

	}
	
	

}
