package com.kh.okkh.milestone.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.milestone.model.vo.Milestone;

@Service
public class MilestoneServiceImpl {
	
	@Autowired
	private IssueDao iDao;

	
	public Milestone getMilestoneByMno(String repository, HttpSession session, int mno) {
		
		String url = repository + "/milestones/" + mno;
		String milestoneResponse = iDao.getGitContentsByGet1(url, session);
		System.out.println("milestoneResponse : " + milestoneResponse);
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		
		try {
			jsonNode = obj.readTree(milestoneResponse);
			System.out.println("jsonNode" + jsonNode);
			if (!jsonNode.isEmpty()) {
	            JsonNode milestoneData = jsonNode;
	            
				String title = milestoneData.get("title").asText();
				String creator = milestoneData.get("creator").get("login").asText();
				String state = milestoneData.get("state").asText();
				String number = milestoneData.get("number").asText();
				String milestoneId = milestoneData.get("id").asText();
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
					
					System.out.println("due_on 제대로 바뀌나? " + dueOn );
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				String profile = milestoneData.get("creator").get("avatar_url").asText();
				int openedIssue = milestoneData.get("open_issues").asInt();
				int closedIssues = milestoneData.get("closed_issues").asInt();
				double finPercent = Math.round(((double)closedIssues / (double)(openedIssue + closedIssues) * 100.0) * 10.0) / 10.0;
				System.out.println("openedIssue" + openedIssue);
				System.out.println("closedIssues" + closedIssues);
				System.out.println("finPercent" + finPercent);
	            
	            return new Milestone(title, creator, state, number, milestoneId, createdAt, updatedAt, closedAt, profile, dueOn, openedIssue, closedIssues, finPercent);
	            
			}
		} catch (JsonProcessingException e){
			e.printStackTrace();
		}
		
			return null;
		

		
	}
	
	
}



