package com.kh.okkh.common.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.common.model.vo.GitHub;
import com.kh.okkh.repository.model.vo.GithubRepo;

/**
 * @author 윤관현
 *
 */
@Service
public class GitHubTemplate {
	
	/**
	 * GitHub REST API를 사용하기 위한 Template (WebClient 방식)
	 * 
	 * @param g : API 호출에 필요한 매개변수들
	 * @return response : API로부터 받은 JSON 값
	 */
	public static String getGitHubAPIValue(GitHub g) {
		
		// WebClient를 사용해서 Header 세팅
		WebClient webClient = WebClient.builder()
				.baseUrl("https://api.github.com")
				.defaultHeader("Accept", "application/vnd.github+json")
				.defaultHeader("Authorization", "Bearer " + g.getToken())
				.defaultHeader("X-GitHub-Api-Version", "2022-11-28")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();
		
		// 결과를 받을 response 생성 및 초기화
		String response = "";
				
		// 요청 방식에 따라 구분
		switch(g.getMethod()) {
			case "GET" :
				// path parameter와 query parameter만 필요하기 때문에 uri에 같이 태운다
				response = webClient.get()
									.uri(g.getUri())
									.retrieve()
									.bodyToMono(String.class)
									.block();
				break;
			case "POST" :
				// body parameter로 요청값을 넘기기 때문에 bodyValue() 메소드를 사용한다
				response = webClient.post()
									.uri(g.getUri())
									.bodyValue(g.getParams())
									.retrieve()
									.bodyToMono(String.class)
									.block();
				break;
			case "PUT" :
				
				break;
			case "PATCH" :
				// body parameter로 요청값을 넘기기 때문에 bodyValue() 메소드를 사용한다
				response = webClient.patch()
									.uri(g.getUri())
									.bodyValue(g.getParams())
									.retrieve()
									.bodyToMono(String.class)
									.block();
				break;
			case "DELETE" :
				// path parameter와 query parameter만 필요하기 때문에 uri에 같이 태운다
				response = webClient.delete()
									.uri(g.getUri())
									.retrieve()
									.bodyToMono(String.class)
									.block();
		}
		
		// JSON값 반환
		return response;
		
	}
	
	/**
	 * 레파지토리 컨텐츠 조회용 템플릿
	 * 
	 * @return
	 */
	public static ArrayList<Object> getGitHubAPIRepoContents(GitHub g) {
		
		// WebClient를 사용해서 Header 세팅
		WebClient webClient = WebClient.builder()
				.baseUrl("https://api.github.com")
				.defaultHeader("Accept", "application/vnd.github+json")
				.defaultHeader("Authorization", "Bearer " + g.getToken())
				.defaultHeader("X-GitHub-Api-Version", "2022-11-28")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();
		
		// 결과값을 담을 ArrayList 세팅
		ArrayList<Object> list = new ArrayList<>();
		
		String response = "";
		
		// uri를 넘겨서 받은 결과값을 ArrayList 형식으로 받고 동기 처리
		list = webClient.get()
				.uri(g.getUri())
				.retrieve()
				.bodyToMono(ArrayList.class)
				.block();
		
//		System.out.println(list);
		
		// 컨트롤러로 반환
		return list;
		
	}
	
	/** HttpURLConnection 방식 => 실패작ㅠㅠ (POST 안됨,,)
	 * @param g => GithubTemplate Service 호출을 위해 필요한 매개변수 객체VO
	 * @return response => GitHub REST API에 접근해서 가져온 JSON 값
	 * @throws IOException
	 * @author Target
	 */
	/*
	public static String getGitHubAPIValue1(GitHub g) throws IOException {
		
		// 기본 URL 설정
		String url = "https://api.github.com";
		
		// 이어붙일 URI 세팅
		url += g.getUri();
		
		// url에 연결할 준비
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		// url header에 들어가는 설정
		urlConnection.setRequestMethod(g.getMethod());
		urlConnection.setRequestProperty("Accept", "application/vnd.github+json");
		urlConnection.setRequestProperty("Authorization", "Bearer " + g.getToken());
		urlConnection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28");
		
		// 요청한 url에서 넘어온 값을 읽을 준비
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
		
		// 넘어온 Json을 담을 String 준비
		String response = "";
		String line;
		
		// 읽을 값이 없어질 때까지 한 줄씩 읽어서 미리 준비한 responseText 객체에 차곡차곡 옮겨담기
		while((line = br.readLine()) != null) {
			
			response += line;
			
		}

		// reader와 urlConnector는 임무를 다했으니 귀가 하도록!!
		br.close();
		urlConnection.disconnect();
		
		return response;
		
	}
	*/

}
