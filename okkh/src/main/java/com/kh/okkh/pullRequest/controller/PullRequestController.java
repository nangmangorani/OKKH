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
import com.kh.okkh.commit.model.vo.Commit;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.vo.Milestone;
import com.kh.okkh.pullRequest.model.service.PullRequestServiceImpl;
import com.kh.okkh.pullRequest.model.vo.PullRequest;
import com.kh.okkh.pullRequest.model.vo.PullReview;



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
			                           ModelAndView mv, HttpSession session, String state/*, String owner, String repo*/) throws IOException  {
		
		// 라벨과 토큰도 얻어오기 
		
		//String repository = owner + "/" + repo;  // 낭만고라니가 오너 / okkh가 레포
		
		
		String repository = "nangmangorani/OKKH";
		//String token = ((Member)session.getAttribute("loginMember")).getMemToken();
		
		// token 얻어올때 loginMember session에 있는 토큰 값이 아닌 
		// setAttribute("git",mToken)에 있는 token 값을 받아와야 함 
		String token = (String)session.getAttribute("token");
		
		
		System.out.println(token  + "  : 토큰!!!!!!!!!!!!ㅃ");
		
		
		
		
		if(state == null) {
			state = "open" ;
		}
		
		
		// 이제 라벨을 조회해오자 
		//ArrayList<Labels> lList = pullService.getLables(repository, session);
		
		
		
		
		// 일단 repository의 open_issues_count값을 가져와서 listCount
		
		// 페이지네이션
		// listCount는 총개수.. 근데 지금 열려있는거만이니까??? 이 레퍼지의 open_pullRequest_count값을 가져오는게 맞는듯?
		// pageLimit은 5
		// boardLimit은 10
		
		
		
		// 이젠 풀리퀘스트의 list 값을 페이징처리해서 가져오자 
		
		// 오픈
		int listCount = pullService.pullRequestCount(repository, token, session, state);
		
		// 클로즈
		int closeListCount = pullService.pullRequestCount1(repository, token, session, state);
		
		
		// 오픈
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage,5, 10);
		
		// 클로즈
		PageInfo closePi = PagiNation.getPageInfo(closeListCount, currentPage, 5, 10);
		
		// state가 open인 list
		ArrayList<PullRequest> plist = pullService.getPullRequest(repository,token,state, pi);
		
		// state가 close인 list
		ArrayList<PullRequest> closeList = pullService.getPullRequest1(repository, token, state, closePi);
		
		
		System.out.println(closeList +  "    : 닫힘닫힘아아리스트 ");
		
		// 풀리퀘 리뷰리스트도 얻어오자
		// 풀리퀘 리뷰리스트 알려면 풀리퀘 번호가 필요함 
		
		// ArrayList<PullReview> pullReview = null;
		
		//ArrayList<PullReview> closeReview = null;
		
	
		/*
		ArrayList<PullReview> allCloseReviews = new ArrayList<PullReview>();
		ArrayList<PullReview> allOpenReviews = new ArrayList<PullReview>();
		
		for (PullRequest pullRequest : closeList) {
		    int pullRequestNumber = pullRequest.getNumber();  // 풀 리퀘스트 번호 추출
		    ArrayList<PullReview> closeReview = pullService.getpullRequestCloseReviewCount(repository, token, state, closePi, pullRequestNumber);
		    System.out.println(closeReview   +"   : 으악 제발아아아알 나와라랄라");
		    
		    
		    allCloseReviews.addAll(closeReview);
		}
		
		mv.addObject("allCloseReviews", allCloseReviews);
		
		//mv.addObject("closeReviewCount", closeReviewCount);
		
		for (PullRequest pullRequest : plist) {
			int pullRequestNumber = pullRequest.getNumber(); // 풀 리퀘스트 번호 추출
			ArrayList<PullReview> pullReview = pullService.getpullRequestOpenReviewCount(repository, token, state, pi, pullRequestNumber);
			
			
			allOpenReviews.addAll(pullReview);
			
		    
		    
		}
		
		
		System.out.println(allOpenReviews  +  "    : 이건 리뷰 개수를 반복문 돌려서...");
		mv.addObject("allOpenReviews", allOpenReviews);
		*/
		
		//mv.addObject("openReviewCount", openReviewCount);

		
		//System.out.println(closeReview  +  "   : 이건 닫힌 풀리퀘 리뷰다아앗");
		//System.out.println(pullReview +  "   : 진짜 나와라 개풀리퀘 리뷰개수");
		
		//System.out.println(plist + "  : 으아아앗 오픈 풀리퀘 목록이닷!!!!!!");
		
		mv.addObject("pi", pi);
		mv.addObject("plist", plist);
		mv.addObject("closeList", closeList);
		mv.addObject("closePi", closePi);
		//mv.addObject("lList", lList);
		mv.addObject("listCount",listCount);
		mv.addObject("closeListCount", closeListCount);
		
		mv.setViewName("pullRequest/myPullRequest");
		
		
		return mv;
		
	}
	
	
	
	
	
	/**
	 * 풀리퀘스트 상세조회하는 메소드
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("pullRequestDetail.pu")
	public ModelAndView selectPullRequestDetail(int pno,  HttpSession session, ModelAndView mv) throws IOException  {
		
		// 상세조회할 때 가져가야 할 것들
		// 풀리퀘 (open/close)     https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)
		// 리뷰 내용     https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)/reviews
		// 커밋 리스트    https://api.github.com/repos/nangmangorani/OKKH/pulls/5/commits
		//            (전체 커밋내용인데, 상세조회에서는 로그인멤버의 깃 닉네임과 login이 일치하는 커밋내용만 불러올 예정
		// 레파지토리 assignees도 조회하기   https://api.github.com/repos/nangmangorani/OKKH/assignees
		

		//System.out.println("이건 상세조회 번호 넘어옴dddd? : " +   pno);
		
		String repository = "nangmangorani/OKKH";
		
		
		String token = (String)session.getAttribute("token");
		
		
		//System.out.println(token  + "  : 토큰!!!!!!!!!!!!ㅃ");
		
		
		
		
		// 풀리퀘 상세내용!!
		PullRequest pull = pullService.getOpenPullRequestDetail(repository, token, pno);
		
		
		//System.out.println("컨트롤러에서 찍는 상세 : " + pull);
		
		// 풀리퀘 리뷰도 얻어오자 (잘 받아짐)
		ArrayList<PullReview> pullReview = pullService.getpullRequestReview(repository, token, pno);
		
		//System.out.println("풀리퀘 리뷰 :  " + pullReview);
		
	
		// 이젠 커밋 리스트도 얻어오자 
		ArrayList<Commit> commit = pullService.getPullCommit(repository,token,pno);
		
		
		
		
		
		
		mv.addObject("pull", pull);
		mv.addObject("pullReview", pullReview);
		mv.addObject("commit", commit);
		mv.setViewName("pullRequest/pullRequestDetail");
		
		
		return mv;
		
	}
	
	
	/**
	 * 열린 풀리퀘 리뷰 개수 가져오는 메소드
	 * 아놔... 잘 안됨....하....
	 * @param pno
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value= "openReviewCount.pull", produces="application/json; charset=UTF-8")
	public String openReviewCount(int pno, HttpSession session) {
		
		//System.out.println(pno  + "   : 풀리퀘 번호!!");
		
		String repository = "nangmangorani/OKKH";
		String token = (String)session.getAttribute("token");
		String state = "open";
		
		int openReviewCount =  pullService.getpullRequestOpenReviewCount(repository, token, session, state, pno);
	
		 System.out.println(openReviewCount  +  "   : 오픈 리뷰 개수!!!!!!!");
		
	
	    return new Gson().toJson(openReviewCount);
				
	
		
	}
	
	
	
	/**
	 * 닫힌 풀리퀘 리뷰 개수 가져오는 메소드
	 * @param pno
	 */
	
	/*
	@ResponseBody
	@RequestMapping(value="closeReviewCount.pull", produces="application/json; charset=UTF-8")
	public String closeReviewCount(int pno, HttpSession session) {
		
		String repository = "nangmangorani/OKKH";
		String token = (String)session.getAttribute("token");
		String state = "closed";
		
		int closeReviewCount =  pullService.getpullRequestCloseReviewCount(repository, token, session, state, pno);
		

		
		
			return new Gson().toJson(closeReviewCount);
		
	}
	
	*/
	
	

}
