package com.kh.okkh.issue.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.milestone.model.vo.Milestone;
import com.kh.okkh.repository.model.vo.Repo;


public interface IssueService {

	//ArrayList<Issue> selectIssueList();
	
	ArrayList<Labels> getLabels(String repository, HttpSession session);
	
	ArrayList<Issue> getIssues(String repository, String token, String state, PageInfo pi) throws IOException;
	
	ArrayList<Milestone> getMilestone(String repository, HttpSession session);
	
	ArrayList<Issue> getIssuesByMno(String repository, HttpSession session, String state, int mno) throws IOException;
	
	int issueCount(String repository, String token, HttpSession session, String state);
	
}
