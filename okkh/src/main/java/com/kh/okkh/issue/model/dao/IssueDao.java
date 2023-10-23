package com.kh.okkh.issue.model.dao;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.member.model.vo.Member;

@Repository
public class IssueDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WebClient webClient;
	
//	public ArrayList<Issue> selectIssueList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("issueMapper.selectIssueList");
//		
//	}
	
	
	public String getGitContentsByGet1(String path, HttpSession session) {
		
		
		//String token = "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";
					
		//String token = "ghu_UnnhXi2Ryq49opUWul5RNKcZoBsTFp3Balae";
		
		String token = ((Member)session.getAttribute("loginMember")).getMemToken();
		System.out.println("토큰인데 잘있거든?" + token);
		System.out.println("path" + path);
		String response = webClient
				.get()
				
				//GitHub API의 URI를 지정
				.uri("https://api.github.com/repos/"+path)
				
				//Authorization" 헤더를 설정하여 Bearer 토큰을 사용한 인증을 수행
				.header(HttpHeaders.AUTHORIZATION,"bearer"+token)
				
				//Accept" 헤더를 설정하여 클라이언트가 응답을 JSON 형식으로 예상
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				
				//Content-Type" 헤더를 설정하여 클라이언트가 JSON 요청
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				
				//API로부터 응답을 검색하기 위한 단계
				.retrieve()
				
				//응답 본문을 문자열로 처리하도록 지정
				.bodyToMono(String.class)
				
				//응답을 기다리고 차단하여, 비동기 작업을 동기 작업으로 변환
				.block();
		
		return response;
		
	}
	
	

}
