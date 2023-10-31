package com.kh.okkh.pullRequest.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.vo.Milestone;
import com.kh.okkh.pullRequest.model.service.PullRequestServiceImpl;
import com.kh.okkh.pullRequest.model.vo.PullRequest;



@Controller
public class PullRequestController {
	
	/**
	 * 풀-리퀘스트 조회용 컨트롤러
	 * 
	 * @author 윤관현 
	 * {@code 유정(호빵)} 
	 */
	
	
	
	/**
	 * 나의 프로젝트에서 풀리퀘스트 누르자마자 실행되는 메소드
	 * @return
	 */
	
	@Autowired
	private PullRequestServiceImpl pullService;

	@RequestMapping(value ="myPullRequest.pu" )
	public ModelAndView selectPullRequestList(@RequestParam(value="cpage",defaultValue = "1")int currentPage,  
			                           ModelAndView mv, HttpSession session, String state) throws IOException  {
		
		// 라벨과 토큰도 얻어오기 
		
		String repository = "nangmangorani/OKKH";
		
		//String token = ((Member)session.getAttribute("loginMember")).getMemToken();
		
		// token 얻어올때 loginMember session에 있는 토큰 값이 아닌 
		// setAttribute("git",mToken)에 있는 token 값을 받아와야 함 
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		
		
		
		if(state == null) {
			state = "open" ;
		}
		
		
		// 이제 라벨을 조회해오자 
		ArrayList<Labels> lList = pullService.getLables(repository, session);
		
		
		
		
		// 일단 repository의 open_issues_count값을 가져와서 listCon
		
		// 페이지네이션
		// listCount는 총개수.. 근데 지금 열려있는거만이니까??? 이 레퍼지의 open_pullRequest_count값을 가져오는게 맞는듯?
		// pageLimit은 5
		// boardLimit은 10
		
		
		
		// 이젠 풀리퀘스트의 list 값을 페이징처리해서 가져오자 
		int listCount = pullService.pullRequestCount(repository, token, session, state);
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage,5, 10);
		
		ArrayList<PullRequest> plist = pullService.getPullRequest(repository,token,state, pi);
		
		// 풀리퀘 리뷰리스트도 얻어오자
		
		
		mv.addObject("pi", pi);
		mv.addObject("plist", plist);
		mv.addObject("lList", lList);
		
		mv.setViewName("pullRequest/myPullRequest");
		
		return mv;
		
	}
	
	
	/**
	 * 풀리퀘스트 목록 조회하는 메소드
	 * @throws IOException 
	 */
	/*
	@ResponseBody
	@RequestMapping(value="selectPullRequest.pull", produces = "application/json; charset=UTF-8")
	public String selectPullRequest() throws IOException {
		String repository = "nangmangorani/OKKH";  
		// 레파지토리는 나중에 머지하면 그때 세션에 담긴 값으로 바꿔치기 하기
		
		
		String url = "https://api.github.com/repos";
	           url += "/" + repository;
	           url += "/pulls";
	           
	   
	      //System.out.println(url  +" 유알레에에에에엥");     
	           
	           
	           
	     // url 객체 생성 
	       URL requestUrl = new URL(url);    
	    
	     // urlConnection 
	      HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
	       
	       urlConnection.setRequestMethod("GET");
	       
	       BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	           
	       String line;
	       String responseText = "";
	       
	       while((line = br.readLine()) != null) {
	    	   responseText += line;
	       }
	       
		
	       br.close();
	       urlConnection.disconnect();
	       
	       System.out.println(responseText + "   : 이건 컨트롤러 값이당아아아");
	       
	       
	       return responseText;
	       
	       
	       
	       
	}
	
	*/
	
	
	/**
	 * @return
	 */
	@RequestMapping("pullRequestDetail.pu")
	public String selectPullRequestDetail() {
		
		return "pullRequest/pullRequestDetail";
		
	}
	
	
	
	
	
	
	
	
	
	

}
