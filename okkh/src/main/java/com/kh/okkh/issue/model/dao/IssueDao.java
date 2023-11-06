package com.kh.okkh.issue.model.dao;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.server.ResponseStatusException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.common.errorPage.CustomClientException;
import com.kh.okkh.common.errorPage.CustomServerException;
//import com.kh.okkh.common.errorPage.ErrorPageController;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.member.model.vo.Member;

import reactor.core.publisher.Mono;

@Repository
public class IssueDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WebClient webClient;
	
//	@Autowired
//	private ErrorPageController err;
	
//	public ArrayList<Issue> selectIssueList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("issueMapper.selectIssueList");
//		
//	}
	
	
	public String getGitContentsByGet1(String path, HttpSession session) {
		
		String token = (String)session.getAttribute("token");
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
		repository = repository + "/issues?milestone=" + mno + "&state=" + state;
		
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
	
	public String toGitIssue(String token, String url, Map<String, Object> requestBody, String method) {
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		String response = null;
		
		
		if(method.equals("post")) {
			response = client.post().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve()
					.onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.just(new CustomClientException("잘좀하징 ㅠㅠ")))
		    		.onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.just(new CustomServerException("Custom server error message")))
		    		.bodyToMono(String.class).block();
		} else if(method.equals("patch")) {
			response = client.patch().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve().bodyToMono(String.class).block();
		}
		
		return response;
	}
	
	
	public String toGitGetIssue(String url, String token, String method) {
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		String response = null;
		
		if (method.equals("get")) {
		    response = client.get().uri(url).retrieve().bodyToMono(String.class).block();
		} else if (method.equals("delete")) {
		    response = client.delete().uri(url).retrieve()
		    		.onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.just(new CustomClientException("잘좀하징 ㅠㅠ")))
		    		.onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.just(new CustomServerException("Custom server error message")))
		    		.bodyToMono(String.class).block();
		    
		   
		    
		}
		
		
		return response;
	}
	
	public String getOrgsMember(String url, String token) {
		
		String response = webClient
				  .get()
				  .uri("https://api.github.com/orgs/" + url)
				  .header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				  .header(HttpHeaders.ACCEPT, "")
				  .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				  .retrieve()
				  .bodyToMono(String.class)
				  .block();
		

		return response;
		
		
		
	}
	
	
	

}
