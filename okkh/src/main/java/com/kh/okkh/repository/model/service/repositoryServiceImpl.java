package com.kh.okkh.repository.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.member.model.vo.Member;

import reactor.core.publisher.Mono;

public class repositoryServiceImpl {
	
	@Autowired
	private WebClient webClient;
	
	
	// 여기서 비동기처리를 해줌.. 왜징?
	// 
	public Mono<String> asynHttpRequest(String path, HttpSession session) {

		String token = ((Member)session.getAttribute("git")).getMemToken();

		Mono<String> responseMono = webClient
				.get()
				.uri("https://api.github.com/repos/" + path)
				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.retrieve()
				.bodyToMono(String.class);

		return responseMono;

	}

}
