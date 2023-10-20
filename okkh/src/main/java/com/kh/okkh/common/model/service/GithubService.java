package com.kh.okkh.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.dao.RepoDao;
import com.kh.okkh.repository.model.vo.Repo;

@PropertySource("classpath:git.properties")
@Service
public class GithubService {
	
	@Value("${git.id}")
	private String gitId;
	
	@Value("${git.secret}")
	private String gitSecret;
	
	@Autowired
	private WebClient webClient;
	
	@Autowired
	private RepoDao rdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String getToken(String code){
		String url = "https://github.com/login/oauth/access_token";

		String response = webClient.post().uri(url).header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
				.body(BodyInserters.fromFormData("client_id", gitId)
                        .with("client_secret", gitSecret)
                        .with("code",code))
				.retrieve().bodyToMono(String.class).block();

	    ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode;
	    
	    String token="";
	    
	    try {
			jsonNode = objectMapper.readTree(response);
			token = jsonNode.get("access_token").asText();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	    return token;
	}
	
	public Member getUserInfo(String token) {
		String response = webClient.get()
				.uri("https://api.github.com/user")
				.header(HttpHeaders.AUTHORIZATION, "Bearer "+token)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		ObjectMapper objecMapper = new ObjectMapper();
		JsonNode jsonNode = null;
		Member m = new Member();
		
		// login => nickname
		try {
			jsonNode = objecMapper.readTree(response);
			m.setMemId(jsonNode.get("id").asText());
			m.setGitNick(jsonNode.get("login").asText());
			m.setAvatarUrl(jsonNode.get("avatar_url").asText());
			m.setMemToken(token);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return m;
	}
	
	/**
	 * @param r => 화면에서 넘어온 레파지 값들 (레포 이름, 레포 내용, 공개여부)
	 * @return result => 0 or 1
	 */
	public void insertRepo(Repo r) {
		
		//int result = rdao.insertRepo(sqlSession, r);
		
		//return result;
		
	}
	
	/**
	 * 레파지토리 조회용 컨트롤러
	 * 
	 * @param token
	 * @return 
	 * @author 윤관현
	 */
	public void getRepository(String token) {
		
		/*
		curl -L \
		  -X POST \
		  -H "Accept: application/vnd.github+json" \
		  -H "Authorization: Bearer <YOUR-TOKEN>" \
		  -H "X-GitHub-Api-Version: 2022-11-28" \
		  https://api.github.com/user/repos \
		  -d '{"name":"Hello-World","description":"This is your first repo!","homepage":"https://github.com","private":false,"is_template":true}'
		  */
		
		String response = webClient.get()
				.uri("https://api.github.com/user")
				.header(HttpHeaders.AUTHORIZATION, "Bearer "+token)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		ObjectMapper objecMapper = new ObjectMapper();
		JsonNode jsonNode = null;
		Member m = new Member();
		
		// login => nickname
		try {
			jsonNode = objecMapper.readTree(response);
			m.setMemId(jsonNode.get("id").asText());
			m.setGitNick(jsonNode.get("login").asText());
			m.setAvatarUrl(jsonNode.get("avatar_url").asText());
			m.setMemToken(token);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		//return r;
		
	}
	
}
