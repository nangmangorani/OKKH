package com.kh.okkh.pullRequest.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.okkh.commit.model.vo.Branches;
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
	 * @컨트롤러 생성 윤관현 
	 * {@code 작성 유정(호빵)} dddd
	 */
	
	
	
	/**
	 * 나의 프로젝트에서 풀리퀘스트 누르자마자 실행되는 메소드
	 * 풀리퀘 생성을 위해서 브랜치도 조회해와야 함
	 *  ${mypro.myproTitle }/${ repoName }
	 * @return
	 */
	
	@Autowired
	private PullRequestServiceImpl pullService;

	@RequestMapping(value ="myPullRequest.pu" )
	public ModelAndView selectPullRequestList(@RequestParam(value="cpage",defaultValue = "1")int currentPage,  
			                           ModelAndView mv, HttpSession session, String state, String repository) throws IOException  {
		
		// 라벨과 토큰도 얻어오기 
		
		String repo;
		
		
		//String repository = "nangmangorani/OKKH";
		//String token = ((Member)session.getAttribute("loginMember")).getMemToken();
		
		// token 얻어올때 loginMember session에 있는 토큰 값이 아닌 
		// setAttribute("git",mToken)에 있는 token 값을 받아와야 함 
		String token = (String)session.getAttribute("token");
		
			if(repository != null) {
				session.setAttribute("repository", repository);				
			}
	
			repo = (String)session.getAttribute("repository");
	

		
		
		
		
		if(state == null) {
			state = "open" ;
		}
		
		
		
		
		// 일단 repository의 open_issues_count값을 가져와서 listCount
		
		// 페이지네이션
		// listCount는 총개수.. 근데 지금 열려있는거만이니까??? 이 레퍼지의 open_pullRequest_count값을 가져오는게 맞는듯?
		// pageLimit은 5
		// boardLimit은 10
		
		
		// 이젠 풀리퀘스트의 list 값을 페이징처리해서 가져오자 
		
		// 오픈
		int listCount = pullService.pullRequestCount(repo, token, session, state);
		
		// 클로즈
		int closeListCount = pullService.pullRequestCount1(repo, token, session, state);
		
		
		// 오픈
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage,5, 10);
		
		// 클로즈
		PageInfo closePi = PagiNation.getPageInfo(closeListCount, currentPage, 5, 10);
		
		// state가 open인 list
		ArrayList<PullRequest> plist = pullService.getPullRequest(repo,token,state, pi,session);
		
		// state가 close인 list
		ArrayList<PullRequest> closeList = pullService.getPullRequest1(repo, token, state, closePi,session);
		
		
		ArrayList<Branches> blist = pullService.getBranches(repo,token);
		
		
		
		
		
		mv.addObject("pi", pi);
		mv.addObject("plist", plist);
		mv.addObject("closeList", closeList);
		mv.addObject("closePi", closePi);
		mv.addObject("listCount",listCount);
		mv.addObject("closeListCount", closeListCount);
		mv.addObject("blist",blist);
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
		

		
		String repository = (String)session.getAttribute("repository");
		
		
		
		
		String token = (String)session.getAttribute("token");
		
		
		
		
		
		
		// 풀리퀘 상세내용!!
		PullRequest pull = pullService.getOpenPullRequestDetail(repository, token, pno);
		
		
		
		// 풀리퀘 리뷰도 얻어오자 (잘 받아짐)
		ArrayList<PullReview> pullReview = pullService.getpullRequestReview(repository, token, pno,session);
		
		
	
		// 이젠 커밋 리스트도 얻어오자 
		ArrayList<Commit> commit = pullService.getPullCommit(repository,token,pno);
		
		
		
		
		
		
		mv.addObject("pull", pull);
		mv.addObject("pullReview", pullReview);
		mv.addObject("commit", commit);
		mv.setViewName("pullRequest/pullRequestDetail");
	
		return mv;
		
	}
	
	
	/**
	 * 풀리퀘 새로 생성하는 메소드
	 * @param title
	 * @param body
	 * @param branches
	 * @param base
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "createPullRequest.pull"  )
	public String createPullRequest(
			@RequestParam String title,
			@RequestParam String body, 
			@RequestParam String branches,
			@RequestParam String base,
			HttpSession session) {
		
		String token = (String)session.getAttribute("token");
		String base1 =   base;  // 베이스는 어디에다가 머지 할건지 지정하는 거
		String head = branches  ;  // 이건 어느 브랜치에서 변화가 있는지 
		
		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> updateValue = new HashMap<>();
		updateValue.put("title", title);
		updateValue.put("body", body);
		updateValue.put("base", base1);
		updateValue.put("head", head);
		
		
		
		String response = pullService.enrollPullRequest(token,repository,updateValue);
		
		if(response.isEmpty() || response == null) {
			session.setAttribute("alertMsg", "풀리퀘스트 생성에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "풀리퀘스트 생성에 성공하였습니다.");
		}
		
		return "redirect:myPullRequest.pu";
		
		
	}
	
	
	
	
	
	
	
	/**
	 *  깃허브의 상태를 변경하는 메소드 (open->closed/ closed->open)
	 * @param pno
	 * @param state
	 * @param session
	 * @return
	 */
	@RequestMapping(value="updatePullState.pull" )
	public String updatePullState(int pno, String state, HttpSession session) {
		
		
		
		// 필요한 값 : 토큰, 레파지토리, 맵에다가 넘겨받은 값을 넣기!!
		
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> updateValue = new HashMap<>() ;
		
		updateValue.put("state", state);
		
		pullService.updatePull(token,repository,pno,updateValue);
		
		return "redirect:myPullRequest.pu";
		
	}
	
	
	
	/**
	 *  풀리퀘 리뷰 작성하는 메소드
	 * @param pno
	 * @param body
	 */
	@RequestMapping("enrollReview.pull")
	public String enrollPullReview(int pno, String body, HttpSession session) {
		
		
		// 레파지토리, 토큰, 맵 생성하기!
		
		// 작성 날짜
		 // 현재의 LocalDateTime 가져오기
        LocalDateTime now = LocalDateTime.now();

        // 날짜를 ISO 8601 형식의 문자열로 포맷
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'")
                .withZone(ZoneId.of("UTC")); // "Z"는 UTC(Zulu)를 나타냅니다.

        String formattedDate = now.format(formatter);
 
        
        
    
        String gitNick = ((Member)session.getAttribute("loginMember")).getGitNick();
        String profile = ((Member)session.getAttribute("loginMember")).getProfile();
		String token = (String)session.getAttribute("token");
		String repository = (String)session.getAttribute("repository");
		
		String state ="COMMENTED";
		String event = "COMMENT";  // 일반적인 리뷰를 달기위해선 이걸 작성해야함
		
		
		Map<String, Object> updateValue = new HashMap<>() ;
		
		updateValue.put("body", body);
		updateValue.put("state",state);
		updateValue.put("event", event);
		updateValue.put("submitted_at", formattedDate);
		
		
		pullService.enrollReview(token, repository, updateValue, pno);
		
		return "redirect:pullRequestDetail.pu?pno="+pno;
	}
	
	
	
	/**
	 * 풀리퀘스트 제목만 수정하는 메소드
	 * @param pno
	 * @param title
	 * @param session
	 * @return
	 */
	@RequestMapping("updatePullTitle.pull")
	public String updatePullTitle(int pno, String title, HttpSession session) {
		
		// 레파지토리, map, 토큰
		String repository = (String)session.getAttribute("repository");
		String token = (String)session.getAttribute("token");
		
		Map<String, Object>  updateValue = new HashMap<>() ;
		
		updateValue.put("title",title);
		
		pullService.updatePull(token, repository, pno, updateValue);
		
		return "redirect:pullRequestDetail.pu?pno="+pno;
		
	}
	
	
	
	
	/**
	 * 풀리퀘 내용만 수정하는 메소드
	 * @return
	 */
	@RequestMapping("updatePullBody.pull")
	public String updatePullBody(int pno,String body, HttpSession session) {
		
		
		
		// 레파지토리, map, 토큰
		        String repository = (String)session.getAttribute("repository");
				String token = (String)session.getAttribute("token");
				
				Map<String, Object>  updateValue = new HashMap<>() ;
				
				updateValue.put("body", body);
				
				pullService.updatePull(token, repository, pno, updateValue);
				
				return "redirect:pullRequestDetail.pu?pno="+pno;
		
		
	}
	
	
	
	/**
	 * 리뷰 수정하는 메소드
	 * @param pno
	 * @param body
	 */
	@RequestMapping("updatePullReview.pull")
	public String updatePullReview(int pno, String body, int reviewId, HttpSession session) {
		
		
		// 레파지토리, 멥, 토큰
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> updateValue = new HashMap<>() ;
		
		updateValue.put("body", body);
		
		
		pullService.updateReview(token,repository,updateValue, pno, reviewId );
		
		
		return "redirect:pullRequestDetail.pu?pno="+pno;
		
		
		
		
	}
	
	
	
	/**
	 * 리뷰 삭제하는 메소드 (리뷰는 삭제 못함.... 코멘트만 가능... 그래서 이거 안씀..ㄸㄹㄹ..ㅠㅠ)
	 * @param pno
	 * @param id
	 */
	@RequestMapping("deleteReview.pull")
	public String deleteReview(int pno, int id, HttpSession session) {
		
		// 토큰, 맵, 레파지토리
		String repository = (String)session.getAttribute("repository");
		String token = (String)session.getAttribute("token");
		String message="You are dismissed";
		String event ="DISMISS";
		
		
		
		Map<String, Object> updateValue = new HashMap<>();
		
		updateValue.put("id", id);
		updateValue.put("message", message);
		updateValue.put("event",event);
		
		
		
		pullService.deleteReview(repository, token, updateValue,pno, id);
		
		return "redirect:pullRequestDetail.pu?pno="+pno;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	//===================================== 구현 잘 안되는 구간 ㅠㅠㅠㅠㅠㅠㅠ ===============================
	
	/**
	 * 열린 풀리퀘 리뷰 개수 가져오는 메소드
	 * 아놔... 잘 안됨....하.... 아아아악 '외 않되'..?
	 * @param pno
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value= "openReviewCount.pull", produces="application/json; charset=UTF-8")
	public String openReviewCount(int pno, HttpSession session) {
		
		
		String repository = (String)session.getAttribute("repository");
		String token = (String)session.getAttribute("token");
		String state = "open";
		
		int openReviewCount =  pullService.getpullRequestOpenReviewCount(repository, token, session, state, pno);
	
		
	
	    return new Gson().toJson(openReviewCount);
				
	
		
	}
	
	
	
	/**
	 * 닫힌 풀리퀘 리뷰 개수 가져오는 메소드
	 * @param pno  이것도 개수 잘 안가져와지뮤ㅠㅠ
	 * 아아아아가가아아아ㅏㄱ아아ㅏㅇ가!
	 */
	
	/*
	@ResponseBody
	@RequestMapping(value="closeReviewCount.pull", produces="application/json; charset=UTF-8")
	public String closeReviewCount(int pno, HttpSession session) {
		
		String repository = (String)session.getAttribute("repository");
		String token = (String)session.getAttribute("token");
		String state = "closed";
		
		int closeReviewCount =  pullService.getpullRequestCloseReviewCount(repository, token, session, state, pno);
		

		
		
			return new Gson().toJson(closeReviewCount);
		
	}
	
	*/
	
	

}
