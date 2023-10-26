package com.kh.okkh.milestone.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.service.MilestoneServiceImpl;
import com.kh.okkh.milestone.model.vo.Milestone;

@Controller
public class MilestoneController {
	
	@Autowired
	MilestoneServiceImpl mService;
	
	@Autowired
	IssueServiceImpl iService;
	
	
	@RequestMapping("list.mile")
	public String milestoneList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
	HttpSession session, Model model, String state) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		
		if(state == null) {
			state = "open";
		}
		
		// open이 디폴트
		String repository = "nangmangorani/01_java-workspace";
		
		int listCount = mService.milestoneCount(repository, token, session, state);
		System.out.println("listCount" + listCount);
		
		ArrayList<Milestone> mList;
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 20);
		
		mList = mService.getMilestone(repository, session, state, pi);
		
		for(int i = 0; i<mList.size(); i++) {
			if(mList.get(i).getState().equals("open")) {
				mList.get(i).setState("진행중");
			} else {
				mList.get(i).setState("진행완료");
			}
		}
		
		model.addAttribute("pi", pi);
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
		if(state == null) {
			state = "open";
		}
		ArrayList<Issue> iList = iService.getIssuesByMno(repository, session, state, mno);
		
		
		model.addAttribute("iList", iList);
		model.addAttribute("milestone", milestone);
		
		return "milestone/milestoneDetail";
	}
	
	
	
	@RequestMapping(value="ajaxDetail.mile", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ajaxMilestoneDetail(Model model, HttpSession session, int mno, String state) throws IOException {
		
		String repository = "nangmangorani/01_java-workspace";
		if(state == null) {
			state = "open";
		}
		ArrayList<Issue> iList = iService.getIssuesByMno(repository, session, state, mno);
		Gson gson = new Gson();
		String json = gson.toJson(iList);
		
		return json;
	}
	
	@RequestMapping(value="enrollForm.mile")
	public String enrollFormMilestone(HttpSession session, Model model) {
		
		return "milestone/milestoneEnroll";
		
	}
	
	@RequestMapping(value="enroll.mile")
	public String enrollMilestone(HttpSession session,
		   @RequestParam String title,
		   @RequestParam(required = false) String dueOn,
		   @RequestParam(required = false) String content) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";
		
		mService.enrollMilestone(token, repository, title, dueOn, content);
		
		
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
	
	
	
//	@RequestMapping(value="edit.mile")
//	public String editMilestone(HttpSession session, Model model, int mno) {
//		String token = ((Member) session.getAttribute("git")).getMemToken();
//
//		String repository = 
//	}
	
	
	
	
	

	
	
	
	

}
