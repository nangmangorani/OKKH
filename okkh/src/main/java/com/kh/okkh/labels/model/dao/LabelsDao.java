package com.kh.okkh.labels.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.labels.model.vo.Labels;

@Repository
public class LabelsDao {
	
	public String toGitLabel(String url, String token, String method) {
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		String response = null;
		
		if(method.equals("get")) {
			response = client.get().uri(url).retrieve().bodyToMono(String.class).block();
		} else if (method.equals("delete")) {
			response = client.delete().uri(url).retrieve().bodyToMono(String.class).block();
		}
		
		
		return response;
	}
	
	public void toGitLabel(String url, String token, String method, Map<String, Object> requestBody) {
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		String response = null;
		
		if(method.equals("patch")) {
			response = client.patch().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve().bodyToMono(String.class).block();
		} else if(method.equals("post")) {
			response = client.post().uri(url).body(BodyInserters.fromValue(requestBody)).retrieve().bodyToMono(String.class).block();
		}
		
	}
}
