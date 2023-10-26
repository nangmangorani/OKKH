package com.kh.okkh.milestone.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.milestone.model.vo.Milestone;

public interface MilestoneService {
	
	int milestoneCount(String repository, String token, HttpSession session, String state);

	Milestone getMilestoneByMno(String repository, HttpSession session, int mno);

	ArrayList<Milestone> getMilestone(String repository, HttpSession session, String state, PageInfo pi);
	
	void enrollMilestone(String token, String repository, String title, String dueOn, String content);
}
