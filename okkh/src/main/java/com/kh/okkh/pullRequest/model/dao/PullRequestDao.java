package com.kh.okkh.pullRequest.model.dao;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.BodyInserters;
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
	
	
	/*
	 * 
	 * 	POST 메서드:
			사용자로부터 입력을 받아 서버에 새로운 데이터를 생성할 때 사용합니다.
			일반적으로 데이터를 서버로 제출하는 데 사용됩니다. 예를 들어, 새로운 블로그 게시물을 게시하거나 새로운 사용자 계정을 만드는 데 사용됩니다.
		
		
		PATCH 메서드:
			서버에서 이미 존재하는 데이터를 수정할 때 사용합니다.
			주로 부분 업데이트를 위해 사용됩니다. 예를 들어, 기존 게시물의 일부 내용을 수정하거나 프로필 정보의 일부를 업데이트할 때 사용됩니다.
		
		
		GET 메서드:
			서버로부터 데이터를 검색하고 조회할 때 사용합니다.
			데이터를 가져오는 데 사용되며, 서버의 데이터를 읽기만 하는 경우에 사용됩니다. 예를 들어, 특정 게시물의 내용을 가져오거나 사용자 프로필 정보를 읽을 때 사용됩니다.
	 * 
	 * 
	 * */
	
	
	
	
	/**
	 * 여기는 라벨에 http요청해서 응답값을 반환하는 곳
	 * @param url
	 * @param session
	 * @return
	 */
	public String getGitContentsByGet1(String url, HttpSession session) {
		
		String token = (String)session.getAttribute("token");
		
		
		System.out.println(token  + "   :  토큰");
		
		// HTTP 요청을 만들기 위한 WebClient 인스턴스를 생성
		String response = webClient
				.get()        // HTTP GET 요청임을 지정합니다. -> get은 조회할 때
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
	
	
	/**
	 *  풀리퀘스트 수정 / 등록하는 메소드
	 */
	public void toGitPullRequest(String token,String url,Map<String, Object> updateValue, String method) {
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		//String response = null;
		
		
		 if ("post".equals(method)) {
		          client.post()
		                .uri(url)
		                .body(BodyInserters.fromValue(updateValue))
		                .retrieve()
		                .bodyToMono(String.class)
		                .block();
		    } else if ("patch".equals(method)) {
		        client.patch()
		                .uri(url)
		                .body(BodyInserters.fromValue(updateValue))
		                .retrieve()
		                .bodyToMono(String.class)
		                .block();
		    } else if("put".equals(method)){
		    	client.put()
                .uri(url)
                .body(BodyInserters.fromValue(updateValue))
                .retrieve()
                .bodyToMono(String.class)
                .block();
		        
		    }else {
	
		    
		    	throw new IllegalArgumentException("Invalid HTTP method");
		    }
		 
		 
		//return response;
		
	}
	
	
	

	/**
	 *  풀리퀘스트 리뷰 삭제하는 메소드
	 */
	public void toGitPullRequestD(String token,String url,String method) {
		
		WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();
		
		//String response = null;
		
		
		 if ("delete".equals(method)) {
		    	client.delete()
                .uri(url)
                .retrieve()
                .bodyToMono(String.class)
                .block();
		    
		    
		    	throw new IllegalArgumentException("Invalid HTTP method");
		    }
		 
		 
		//return response;
		
	}
	
}
