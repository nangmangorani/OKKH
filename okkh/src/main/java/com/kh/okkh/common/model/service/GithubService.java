package com.kh.okkh.common.model.service;

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

@PropertySource("classpath:git.properties")
@Service
public class GithubService {
	
	@Value("${git.id}")
	private String gitId;
	
	@Value("${git.secret}")
	private String gitSecret;
	
	@Autowired
	private WebClient webClient;
	
	public String getToken(String code){
		String url = "https://github.com/login/oauth/access_token";

		String response = webClient
				.post()
				.uri(url)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
				.body(BodyInserters.fromFormData("client_id", gitId)
                .with("client_secret", gitSecret)
                .with("code",code))
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
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
		String response = webClient
				.get()
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
			m.setProfile(jsonNode.get("avatar_url").asText());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return m;
	}
	
}
