package com.kh.okkh.milestone.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

@Repository
public class MilestoneDao {
	
	@Autowired
	private WebClient webClient;

	public void toGitMilestone(String token, String url, Map<String, Object> requestBody, String method) {
		
//		String response = webClient.post()
//				.uri("https://api.github.com/repos/" + url)
//				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
//				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
//				.body(BodyInserters.fromValue(requestBody))
//	            .retrieve()
//	            .bodyToMono(String.class)
//	            .block();
		
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		String response = null;
		
		if(method.equals("post")) {
			response = client.post().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve().bodyToMono(String.class).block();
		} else if(method.equals("patch")) {
			response = client.patch().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve().bodyToMono(String.class).block();
		}
		
	}
	
	
	
	
	
	
}
