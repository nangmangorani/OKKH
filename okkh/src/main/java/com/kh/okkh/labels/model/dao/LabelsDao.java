package com.kh.okkh.labels.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.labels.model.vo.Labels;

@Repository
public class LabelsDao {
	
	public String toGitLabel(String url, String token) {
		
		WebClient client = WebClient.builder().baseUrl("http://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		String response = null;
		
		response = client.get().uri(url).retrieve().bodyToMono(String.class).block();
		
		return response;
	}
}
