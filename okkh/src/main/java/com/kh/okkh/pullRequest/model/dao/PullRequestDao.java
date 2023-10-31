package com.kh.okkh.pullRequest.model.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.member.model.vo.Member;

/**
 * @author 유정(호빵) 
 *
 */
@Repository
public class PullRequestDao {

	@Autowired
	private WebClient webClient;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/**
	 * 여기는 라벨에 http요청해서 응답값을 반환하는 곳
	 * @param url
	 * @param session
	 * @return
	 */
	public String getGitContentsByGet1(String url, HttpSession session) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		
		
		// HTTP 요청을 만들기 위한 WebClient 인스턴스를 생성
		String response = webClient
				.get()        // HTTP GET 요청임을 지정합니다.
				.uri("https://api.github.com/repos/"+url) // 요청 URI를 설정합니다
				 
				 // GitHub 토큰을 사용하여 "Authorization" 헤더를 설정합니다.
				.header(HttpHeaders.AUTHORIZATION,"Bearer "+token) 
				
				 // 특정 미디어 유형을 요청하기 위해 "Accept" 헤더를 설정합니다.
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				
				// 응답 유형을 나타내기 위해 "Content-Type" 헤더를 설정합니다. (json)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				
				.retrieve()  // 요청을 시작하고 응답을 얻습니다.
				.bodyToMono(String.class)    // 응답 본문을 String Mono로 변환합니다.
				.block();  // 응답을 받아오고 처리할 때까지 실행을 차단합니다.

		
		return response;
		
	}
	
	
}
