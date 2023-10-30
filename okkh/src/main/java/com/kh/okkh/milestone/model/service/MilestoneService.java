package com.kh.okkh.milestone.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.milestone.model.vo.Milestone;

public interface MilestoneService {
	
	int milestoneCount(String repository, String token, HttpSession session, String state);

	Milestone getMilestoneByMno(String repository, HttpSession session, int mno);

	ArrayList<Milestone> getMilestone(String repository, HttpSession session, String state, PageInfo pi);
	
	ArrayList<Milestone> getMilestone(String repository, HttpSession session, String state);

	void enrollMilestone(String token, String repository, Map<String, Object> requestBody);
	
	void editMilestone(String repository, Map<String, Object> requestBody, String token, int mno);

	
}
