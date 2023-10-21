package com.kh.okkh.issue.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.milestone.model.vo.Milestone;


public interface IssueService {

	//ArrayList<Issue> selectIssueList();
	
	ArrayList<Labels> getLabels(String repository, HttpSession session);
	
	ArrayList<Issue> getIssues(String repository, String token, String state) throws IOException;
	
	ArrayList<Milestone> getMilestone(String repository, HttpSession session);
	
	
}
