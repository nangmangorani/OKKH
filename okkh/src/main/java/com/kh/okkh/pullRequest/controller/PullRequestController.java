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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.okkh.issue.model.vo.Issue;
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
	public ModelAndView selectPullRequestList(ModelAndView mv) throws IOException {
		// 세션에서 토큰 얻어오기
		// 레파지토리도 얻어오기..
		// 커밋 리스트도 조회해오기
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
	       
	       
	       
	       
	        // 제이슨 배열로 파싱작업
		    JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
		    // arr을 추가할 issue 제네릭의 list
		    ArrayList<PullRequest> list = new ArrayList<PullRequest>();
		    
		    for (int i = 0; i < arr.size(); i++) {
		         JsonObject pullObj = arr.get(i).getAsJsonObject();
		         PullRequest git = pullService.
		         list.add(git);
		         System.out.println(list.get(i));
		      }
	       
	       
		
	       br.close();
	       urlConnection.disconnect();
	       
	       System.out.println(responseText + "   : 이건 컨트롤러 값이당아아아");
	       
	       
	      
	       mv.addObject("responseText", responseText).setViewName("pullRequest/myPullRequest");	
		 
		
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
