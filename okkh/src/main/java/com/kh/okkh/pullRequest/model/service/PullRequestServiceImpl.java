package com.kh.okkh.pullRequest.model.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.pullRequest.model.vo.PullRequest;

/**
 * @author 유정(호빵)
 *
 */
@Service
public class PullRequestServiceImpl {

	// api 값이 출력되면 json 형으로 출력해야되서 여기서 파싱해주나봄
	private PullRequest createGitPullRequestFromJsonObject(JsonObject pullObj) {
		
		PullRequest git = new PullRequest();
		
		// https://api.github.com/repos/nangmangorani/OKKH/pulls?state=open&page=1 이런데에서 데이터가져와 객체에 세팅
		
		// 제목
		git.setTitle(pullObj.get("title").getAsString());
		
		 
	
		// 진행중 여부
		git.setState(pullObj.get("state").getAsString());
		
		// 라벨
		JsonArray labelsArr = pullObj.get("labels").getAsJsonArray();
		
		
		
		String[] labels = new String[labelsArr.size()];
		
		for (int j = 0; j < labelsArr.size(); j++) {
	       labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
	       
	    }
		git.setLabels(labels);
		
		JsonElement milestoneElem = pullObj.get("milestone");
		
		// 여기에서 milestone관련 필요한거만 쏙 넣어줌
		if (!milestoneElem.isJsonNull()) {
	         JsonObject milestoneObj = milestoneElem.getAsJsonObject();
	         git.setMilestone(milestoneObj.get("title").getAsString());
	         git.setMilestoneNum(milestoneObj.get("number").getAsInt());
	         
	    }
		
		git.setNumber(pullObj.get("number").getAsInt());
		
		JsonArray assigneesArr = pullObj.get("assignees").getAsJsonArray();
		
		String[] assignees = new String[assigneesArr.size()];
		String[] assigneeProfiles = new String[assigneesArr.size()];
		
		for(int j = 0; j<assigneesArr.size(); j++) {
			JsonObject assigneeObj = assigneesArr.get(j).getAsJsonObject();
			assignees[j] = assigneeObj.get("login").getAsString();
			assigneeProfiles[j] = assigneeObj.get("avatar_url").getAsString();
		}
		
		git.setAssignees(assignees);
	    git.setAssigneeProfiles(assigneeProfiles);
	    
	    // json객체로부터 문자열을 추출함
	    String createDateTimeString = pullObj.get("created_at").getAsString();
	    
	    // yyyy-MM-dd'T'HH:mm:ss, LocalDateTime 객체로 파싱
	    LocalDateTime createdDateTime = LocalDateTime.parse(createDateTimeString, DateTimeFormatter.ISO_DATE_TIME); 
	    
	    // 다시 객체형식 바꿔주면서~
	    String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    git.setCreatedAt(createdDateString);
	    
	    git.setUpdatedAt(pullObj.get("updated_at").getAsString());
	    
	    JsonElement closedAtElem = pullObj.get("closed_at");
	    
	    if (!closedAtElem.isJsonNull()) {
	         git.setClosedAt(closedAtElem.getAsString());
	    }
		
	    git.setId(pullObj.get("id").getAsInt()); // 이슈 아이디

		JsonObject userObj = pullObj.get("user").getAsJsonObject();
		git.setUser(userObj.get("login").getAsString());
		git.setUserId(userObj.get("id").getAsString());
		
	    String userProfileUrl = userObj.get("avatar_url").getAsString();
		git.setProfile(userProfileUrl);
		
		return git;
	}

	
}
