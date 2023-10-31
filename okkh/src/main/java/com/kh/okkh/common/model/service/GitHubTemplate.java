package com.kh.okkh.common.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.common.model.vo.GitHub;

@Service
public class GitHubTemplate {
	
	private final WebClient webClient;
	
	public GitHubTemplate() {
		this.webClient = WebClient.builder()
								  .baseUrl("https://api.github.com")
								  .build();
	}
	
	public static String getGitHubAPIValue1(GitHub g) {
		
		return "";
		
	}
	
	/**
	 * @param g => GithubTemplate Service 호출을 위해 필요한 매개변수 객체VO
	 * @return response => GitHub REST API에 접근해서 가져온 JSON 값
	 * @throws IOException
	 * @author Target
	 */
	public static String getGitHubAPIValue(GitHub g) throws IOException {
		
		// 기본 URL 설정
		String url = "https://api.github.com";
		
		// 이어붙일 URI 세팅
		url += g.getUri();
		
//		if(g.getParam() != null) {
//			url += g.getParam();
//		}
		
		// parameter 세팅
//		Map<String, Object> params = new LinkedHashMap<String, Object>();
//		params.put("name", "test");
		
		// url에 연결할 준비
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		// url header에 들어가는 설정
		urlConnection.setRequestMethod(g.getMethod());
		urlConnection.setRequestProperty("Accept", "application/vnd.github+json");
		urlConnection.setRequestProperty("Authorization", "Bearer " + g.getToken());
		urlConnection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28");
		
		if(g.getParams() != null) {
			
			System.out.println(g.getParams());
			/*
			StringBuilder postParam = new StringBuilder();
			
			postParam.append("{");
			
			for(Map.Entry<String, Object> param : g.getParams().entrySet()) {
				
				if(postParam.length() != 0) {
					postParam.append(",");
				}
				
				postParam.append(URLEncoder.encode(param.getKey(), "UTF-8"));
				postParam.append(":");
				postParam.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
				
				System.out.println("postParam : " + postParam);
				
			}
			
			postParam.append("}");
			
			System.out.println(postParam);
			*/
			
			byte[] postParamBytes = g.getParams().toString().getBytes("UTF-8");
			
			System.out.println(postParamBytes);
			
			urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			urlConnection.setRequestProperty("Content-Length", String.valueOf(postParamBytes.length));
			
			// POST를 위한 설정
			urlConnection.setDoOutput(true);
			urlConnection.getOutputStream().write(postParamBytes);
			
		}
		
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

}
