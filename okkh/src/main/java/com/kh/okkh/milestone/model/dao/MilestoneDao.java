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

	public void enrollMilestone(String token, String url, String title, String dueOn, String content) {
		
		Map<String, Object> requestBody = new HashMap<>();
	    requestBody.put("title", title);
	    
	    if (dueOn != null) {
	        requestBody.put("due_on", dueOn);
	    }
	    
	    if (content != null) {
	        requestBody.put("description", content);
	    }
	    
	    System.out.println("title" + title);
	    System.out.println("token" + token);
	    System.out.println("dueOn" + dueOn);
	    System.out.println("content" + content);
		
		String response = webClient.post()
				.uri("https://api.github.com/repos/" + url)
				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(BodyInserters.fromValue(requestBody))
	            .retrieve()
	            .bodyToMono(String.class)
	            .block();
		
		System.out.println("response " + response);
	}
	
}
