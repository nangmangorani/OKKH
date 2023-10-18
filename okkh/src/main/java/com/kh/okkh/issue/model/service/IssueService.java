package com.kh.okkh.issue.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;


public interface IssueService {

	//ArrayList<Issue> selectIssueList();
	
	ArrayList<Labels> getLabels(String repository, HttpSession session);
	
	ArrayList<Issue> getIssues(String repository, String token, String state, String assign, String label, Integer page) throws IOException;
	
}
