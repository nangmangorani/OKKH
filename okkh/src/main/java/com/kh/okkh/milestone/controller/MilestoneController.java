package com.kh.okkh.milestone.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.issue.model.service.IssueServiceImpl;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.service.MilestoneServiceImpl;
import com.kh.okkh.milestone.model.vo.Milestone;

import oracle.net.aso.s;

@Controller
public class MilestoneController {
	
	@Autowired
	MilestoneServiceImpl mService;
	
	@Autowired
	IssueServiceImpl iService;
	
	
	@RequestMapping("list.mile")
	public String milestoneList(HttpSession session, Model model, String state) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		
		if(state == null) {
			state = "open";
		}
		
		// open이 디폴트
		String repository = "nangmangorani/01_java-workspace";
		
		int listCount = mService.milestoneCount(repository, token, session, state);
		
		ArrayList<Milestone> mList;
		
		
		mList = mService.getMilestone(repository, session, state);
		
		
		model.addAttribute("mList", mList);
		
		return "milestone/milestoneList";
	}
	
	
	/**
	 * 마일스톤 상세페이지
	 * */
	@RequestMapping("detail.mile")
	public String milstoneDetail(Model model, HttpSession session, int mno, String state) throws IOException {
		
		String token = ((Member) session.getAttribute("git")).getMemToken();
		
		String repository = "nangmangorani/01_java-workspace";
		Milestone milestone = mService.getMilestoneByMno(repository, session, mno);
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		if(state == null) {
			state = "open";
		}
		ArrayList<Issue> iList = iService.getIssuesByMno(repository, session, state, mno);
		
		
		model.addAttribute("iList", iList);
		model.addAttribute("lList", lList);
		model.addAttribute("milestone", milestone);
		
		return "milestone/milestoneDetail";
	}
	
	
	
	@RequestMapping(value="ajaxDetail.mile", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> ajaxMilestoneDetail(Model model, HttpSession session, int mno, String state) throws IOException {
		


		String repository = "nangmangorani/01_java-workspace";
		if(state == null) {
			state = "open";
		}
		System.out.println("state" + state);
		ArrayList<Issue> iList = iService.getIssuesByMno(repository, session, state, mno);
		ArrayList<Labels> lList = iService.getLabels(repository, session);

		System.out.println(iList);		
		System.out.println(lList);


		Map<String, Object> response = new HashMap<>();
		response.put("iList", iList);
		response.put("lList", lList);

		return response;
	}
	
	@RequestMapping(value="enrollForm.mile")
	public String enrollFormMilestone(HttpSession session, Model model) {
		
		return "milestone/milestoneEnroll";
		
	}
	
	@RequestMapping(value="enroll.mile")
	public String enrollMilestone(HttpSession session,
		   @RequestParam String title,
		   @RequestParam(required = false) String dueOnDate,
		   @RequestParam(required = false) String content) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";
		String dueOn = null;
		
		if (dueOnDate != null && !dueOnDate.isEmpty()) {
	        // 현재 날짜와 시간 정보 얻기
	        LocalDateTime currentDateTime = LocalDateTime.now();

	        // 현재 시간에 5시간을 더하기
	        LocalDateTime dueOnDateTime = currentDateTime.plusHours(5);

	        // 분과 초를 0으로 설정
	        dueOnDateTime = dueOnDateTime.withMinute(0).withSecond(0);

	        // UTC(Z) 타임존 정보를 추가
	        ZonedDateTime zonedDateTime = dueOnDateTime.atZone(ZoneOffset.UTC);

	        // ISO 8601 형식으로 변환
	        dueOn = zonedDateTime.format(DateTimeFormatter.ISO_DATE_TIME);
	    }
		
		System.out.println("dueOn 봐줄만해..?" + dueOn);
		
		Map<String, Object> requestBody = new HashMap<>();
	    requestBody.put("title", title);
	    
	    if (dueOn != null) {
	        requestBody.put("due_on", dueOn);
	    }
	    
	    if (content != null) {
	        requestBody.put("description", content);
	    }
		
		mService.enrollMilestone(token, repository, requestBody);
		
		return "redirect:/list.mile";
	}
	
	
	
	
	@RequestMapping(value="editForm.mile")
	public String editFormMilestone(HttpSession session, Model model, int mno) {
		
		String token = ((Member) session.getAttribute("git")).getMemToken();
		
		String repository = "nangmangorani/01_java-workspace";
		Milestone milestone = mService.getMilestoneByMno(repository, session, mno);
		
		model.addAttribute("milestone", milestone);
		return "milestone/milestoneEdit";
		
	}
	
	
	
	@RequestMapping(value="edit.mile")
	public String editMilestone(Model model, HttpSession session, Integer mno,
			String title,
			@RequestParam(required = false) String state, 
			@RequestParam(required = false) String content,
			@RequestParam(required = false) String dueOnDate) {
			
		String token = ((Member) session.getAttribute("git")).getMemToken();
		System.out.println("mno인데 내가 없어도 너무 슬퍼하지마" + mno);
		String repository = "nangmangorani/01_java-workspace";
		
		System.out.println("state넘어옴? " + state);
		Map<String, Object> requestBody = new HashMap<>();
		requestBody.put("title", title);
		
		if(state == null) {
			state = "open";
		}
		
		if(content != null) {
			requestBody.put("content", content);
		}
		
		if(dueOnDate != null) {
			requestBody.put("dueOnDate", dueOnDate);
		}
		
		if(state.equals("closed")) {
			requestBody.put("state", state);
		}
		
		mService.editMilestone(repository, requestBody, token, mno);
		
		return "redirect:/detail.mile?mno=" + mno;
	}
	
	// @RequestMapping("enrollIssue.mile")
	// public String enrollIssueAtMile(HttpSession session, int mno, Model model) {
		
	// 	String repository = "nangmangorani/01_java-workspace";
		
		

		
	// 	return "milestone/enrollIssueByMile";
		
	// }
	
	@RequestMapping(value="ajaxMile.mile", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<Milestone> ajaxMile(HttpSession session, @RequestParam(required = false)String state) {

		String token = ((Member) session.getAttribute("git")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";

		if(state == null) {
			state = "open";
		}

		ArrayList<Milestone> mList = mService.getMilestone(repository, session, state);

		return mList;

	}
	
	
	
	
	

	
	
	
	

}
