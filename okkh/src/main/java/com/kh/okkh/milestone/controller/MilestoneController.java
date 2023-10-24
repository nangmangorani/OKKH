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
	
	/**
	 * 마일스톤 상세페이지
	 * */
	@RequestMapping("detail.mile")
	public String milstoneDetail(Model model, HttpSession session, int mno, String state) throws IOException {
		
		String token = ((Member) session.getAttribute("loginMember")).getMemToken();
		
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
		System.out.println("state 넘어와유??" + state);
		if(state == null) {
			state = "open";
		}
		ArrayList<Issue> iList = iService.getIssuesByMno(repository, session, state, mno);
		Gson gson = new Gson();
		String json = gson.toJson(iList);
		
		return json;
	}
	
	
	@RequestMapping(value="editForm.mile")
	public String editFormMilestone(HttpSession session, Model model, int mno) {
		
		String token = ((Member) session.getAttribute("loginMember")).getMemToken();
		
		String repository = "nangmangorani/01_java-workspace";
		Milestone milestone = mService.getMilestoneByMno(repository, session, mno);
		
		model.addAttribute("milestone", milestone);
		return "milestone/milestoneEdit";
	}
	
	
	
	
	

	
	
	
	

}
