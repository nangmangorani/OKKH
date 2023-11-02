package com.kh.okkh.issue.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.issue.model.vo.Comments;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.milestone.model.vo.Milestone;


public interface IssueService {

	String enrollIssue(String token, String repository, Map<String, Object> requestBody);
	
	ArrayList<Labels> getLabels(String repository, HttpSession session);
	
	ArrayList<Issue> getIssues(String repository, String token, String state, PageInfo pi) throws IOException;
	
	ArrayList<Milestone> getMilestone(String repository, HttpSession session);
	
	ArrayList<Issue> getIssuesByMno(String repository, HttpSession session, String state, int mno) throws IOException;
	
	int issueCount(String repository, String token, HttpSession session, String state);
	
	String editIssue(String token, String repository, Map<String, Object> requestBody, int ino);
	
	int issueCount(String repository, String token, HttpSession session, String state, String labelToString);
	
	ArrayList<Issue> getIssuesByLabels(HttpSession session, String repository, String token, String state, PageInfo pi, String labelToString);

	String enrollComment(String repository, String token, Map<String, Object> requestBody, int ino);

	ArrayList<Comments> getComments(String repository, String token, int ino);
}
