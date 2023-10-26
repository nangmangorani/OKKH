package com.kh.okkh.milestone.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.milestone.model.vo.Milestone;

@Service
public class MilestoneServiceImpl implements MilestoneService {
	
	@Autowired
	private IssueDao iDao;
	
	
	@Override
	public int milestoneCount(String repository, String token, HttpSession session, String state) {
		
		if(state.equals("open")) {
			
			String repoState = repository + "/milestones";
			
			String repoResponse = iDao.getGitContentsByGet1(repoState, session);
			
			ObjectMapper obj = new ObjectMapper();
			JsonNode jsonNode;
			int count = 0;
			
			try {
				jsonNode = obj.readTree(repoResponse);
				count = jsonNode.size();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			return count;
		} else {
			
			String repoState = repository + "/milestones?state=closed";
			String repoResponse = iDao.getGitContentsByGet1(repoState, session);
			
			ObjectMapper obj = new ObjectMapper();
			JsonNode jsonNode;
			
			int count = 0;
			
			try {
				jsonNode = obj.readTree(repoResponse);
				count = jsonNode.size();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			return count;
		}
		
	}
	
	@Override
	public ArrayList<Milestone> getMilestone(String repository, HttpSession session, String state, PageInfo pi) {
		
		String url = repository + "/milestones?state=" + state + "&page=" + pi.getCurrentPage() + "&per_page=" + pi.getBoardLimit();
		String milestoneResponse = iDao.getGitContentsByGet1(url, session);
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		ArrayList<Milestone> mList = new ArrayList<Milestone>();
		
		try {
			jsonNode = obj.readTree(milestoneResponse);
			for(int i = 0; i< jsonNode.size(); i++) {
				
				String title = jsonNode.get(i).get("title").asText();
				String creator = jsonNode.get(i).get("creator").get("login").asText();
				String number = jsonNode.get(i).get("number").asText();
				String content = jsonNode.get(i).get("description").asText();
				String milestoneId = jsonNode.get(i).get("id").asText();
				SimpleDateFormat s1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
				SimpleDateFormat s2 = new SimpleDateFormat("yyyy-MM-dd");

				String createdAt = null;
				String updatedAt = null;
				String closedAt = null;
				String dueOn= null;
				
				try {
					String createdAtString = jsonNode.get(i).get("created_at").asText();
					if (!"null".equals(createdAtString)) {
						Date createdAtBefore = s1.parse(createdAtString);
						createdAt = s2.format(createdAtBefore);
					}

					String updatedAtString = jsonNode.get(i).get("updated_at").asText();
					if (!"null".equals(updatedAtString)) {
						Date updatedAtBefore = s1.parse(updatedAtString);
						updatedAt = s2.format(updatedAtBefore);
					}

					String closedAtString = jsonNode.get(i).get("closed_at").asText();
					if (!"null".equals(closedAtString)) {
						Date closedAtBefore = s1.parse(closedAtString);
						closedAt = s2.format(closedAtBefore);
					}

					String dueOnString = jsonNode.get(i).get("due_on").asText();
					if (!"null".equals(dueOnString)) {
						Date dueOnBefore = s1.parse(dueOnString);
						dueOn = s2.format(dueOnBefore);
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				String profile = jsonNode.get(i).get("creator").get("avatar_url").asText();
				int openedIssue = jsonNode.get(i).get("open_issues").asInt();
				int closedIssues = jsonNode.get(i).get("closed_issues").asInt();
				double finPercent = Math.round(((double)closedIssues / (double)(openedIssue + closedIssues) * 100.0) * 10.0) / 10.0;
				
				mList.add(new Milestone(title, creator, state, number, content, milestoneId, createdAt, updatedAt, closedAt, profile, dueOn, openedIssue, closedIssues, finPercent));

			}
			
			return mList;
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	

	@Override
	public Milestone getMilestoneByMno(String repository, HttpSession session, int mno) {
		
		String url = repository + "/milestones/" + mno;
		String milestoneResponse = iDao.getGitContentsByGet1(url, session);
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		
		try {
			jsonNode = obj.readTree(milestoneResponse);
			if (!jsonNode.isEmpty()) {
	            JsonNode milestoneData = jsonNode;
	            
				String title = milestoneData.get("title").asText();
				String creator = milestoneData.get("creator").get("login").asText();
				String state = milestoneData.get("state").asText();
				String number = milestoneData.get("number").asText();
				String milestoneId = milestoneData.get("id").asText();
				String content = milestoneData.get("description").asText();
				SimpleDateFormat s1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
				SimpleDateFormat s2 = new SimpleDateFormat("yyyy-MM-dd");
				
				String createdAt = null;
				String updatedAt = null;
				String closedAt = null;
				String dueOn= null;
				try {
					String createdAtString = milestoneData.get("created_at").asText();
					if (!"null".equals(createdAtString)) {
						Date createdAtBefore = s1.parse(createdAtString);
						createdAt = s2.format(createdAtBefore);
					}

					String updatedAtString = milestoneData.get("updated_at").asText();
					if (!"null".equals(updatedAtString)) {
						Date updatedAtBefore = s1.parse(updatedAtString);
						updatedAt = s2.format(updatedAtBefore);
					}

					String closedAtString = milestoneData.get("closed_at").asText();
					if (!"null".equals(closedAtString)) {
						Date closedAtBefore = s1.parse(closedAtString);
						closedAt = s2.format(closedAtBefore);
					}

					String dueOnString = milestoneData.get("due_on").asText();
					if (!"null".equals(dueOnString)) {
						Date dueOnBefore = s1.parse(dueOnString);
						dueOn = s2.format(dueOnBefore);
					}
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				String profile = milestoneData.get("creator").get("avatar_url").asText();
				int openedIssue = milestoneData.get("open_issues").asInt();
				int closedIssues = milestoneData.get("closed_issues").asInt();
				double finPercent = Math.round(((double)closedIssues / (double)(openedIssue + closedIssues) * 100.0) * 10.0) / 10.0;
	            
	            return new Milestone(title, creator, state, number, content, milestoneId, createdAt, updatedAt, closedAt, profile, dueOn, openedIssue, closedIssues, finPercent);
			}
		} catch (JsonProcessingException e){
			e.printStackTrace();
		}
		
			return null;
		

		
	}


	



	
}



