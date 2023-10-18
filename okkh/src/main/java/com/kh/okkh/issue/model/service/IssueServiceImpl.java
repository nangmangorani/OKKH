package com.kh.okkh.issue.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;

@Service
public class IssueServiceImpl implements IssueService{
	
	@Autowired
	private IssueDao iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	@Override
//	public ArrayList<Issue> selectIssueList() {
//		return iDao.selectIssueList(sqlSession);
//	}

	@Override
	public ArrayList<Labels> getLabels(String repository, HttpSession session){
		
		String url = repository + "/labels";
		System.out.println("url이 멀까? ㅋㅋㅎㅎ" + url);
		// 여기서 git.api url로 변환해줌
		// 라벨 전체url이 나올거임
		String labelResponse = iDao.getGitContentsByGet1(url, session);
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		ArrayList<Labels> lList = new ArrayList<Labels>();
		
		// json으로 변환????
		try {
			jsonNode = obj.readTree(labelResponse);
			for (int i = 0; i < jsonNode.size(); i++) {
				String id = jsonNode.get(i).get("id").asText();
				String name = jsonNode.get(i).get("name").asText();
				String color = jsonNode.get(i).get("color").asText();
				String description = jsonNode.get(i).get("description").asText();

				Labels l = new Labels(id, name, color, description);
				lList.add(l);
				System.out.println("내가 색이되어볼게 " + lList.get(i).getColor());
			}
			
			// 여기까지하면 Labels 객체에 라벨관련된 내용들이 담겨있겠지??
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(lList.get(0).getName() + "이 친구는 잘있나?");
		
		return lList;
	}

	@Override
	public ArrayList<Issue> getIssues(String repository, String token, String state, String assign, String label,
			Integer page) 
			throws IOException {
		
		String url = "";
		
		url = "https://api.github.com/repos/" + repository + "/issues?state=" + state + "&page=1";
		System.out.println("나는 url이야" + url);
		
		URL requestUrl = new URL(url);
	    HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();

	    //urlConnection.setRequestProperty("Authorization", "Bearer " + token);
	    urlConnection.setRequestMethod("GET");
		
	    System.out.println("requestUrl이야 " + requestUrl);
	    System.out.println("urlconnection이란다" + urlConnection);
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
	    System.out.println("나는 br ㅋㅋㅋ" + br);
	    String line;
	    String responseText = "";
	    
	    
	    while ((line = br.readLine()) != null) {
	      responseText += line;
	    }
		
	    System.out.println("나는 라인이라고해!!" + responseText);
	    
	    JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
	    ArrayList<Issue> list = new ArrayList<Issue>();
	    
	    for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         System.out.println("issueObj" + issueObj);
	         Issue git = createGitIssueFromJsonObject(issueObj);
	         System.out.println("git" + git.toString());
	         list.add(git);
	      }
	    return list;
	      
	}
	
	
	
	
	
	
	
	
	
	
	private Issue createGitIssueFromJsonObject(JsonObject issueObj) {
		Issue git = new Issue();
		
		// https://api.github.com/repos/nangmangorani/01_java-workspace/issues?state=open&page=1 이런데에서 데이터가져와 객체에 세팅
		
		// 제목
		git.setTitle(issueObj.get("title").getAsString());
		
		// 라벨
		JsonArray labelsArr = issueObj.get("labels").getAsJsonArray();
		String[] labels = new String[labelsArr.size()];
		
		for (int j = 0; j < labelsArr.size(); j++) {
	       labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
	       System.out.println("대가뤼딱대~" + labels[j]);
	       
	    }
		git.setLabels(labels);
		
		JsonElement milestoneElem = issueObj.get("milestone");
		if (!milestoneElem.isJsonNull()) {
	         JsonObject milestoneObj = milestoneElem.getAsJsonObject();
	         git.setMilestone(milestoneObj.get("title").getAsString());
	         git.setMilestoneNum(milestoneObj.get("number").getAsInt());
	    }
		
		git.setNumber(issueObj.get("number").getAsInt());
		
		JsonArray assigneesArr = issueObj.get("assignees").getAsJsonArray();
		
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
	    String createDateTimeString = issueObj.get("created_at").getAsString();
	    
	    // yyyy-MM-dd'T'HH:mm:ss, LocalDateTime 객체로 파싱
	    LocalDateTime createdDateTime = LocalDateTime.parse(createDateTimeString, DateTimeFormatter.ISO_DATE_TIME); 
	    
	    // 다시 객체형식 바꿔주면서~
	    String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    git.setCreatedAt(createdDateString);
	    
	    git.setUpdatedAt(issueObj.get("updated_at").getAsString());
	    
	    JsonElement closedAtElem = issueObj.get("closed_at");
	    
	    if (!closedAtElem.isJsonNull()) {
	         git.setClosedAt(closedAtElem.getAsString());
	    }
		
	    git.setId(issueObj.get("id").getAsString()); // 이슈 아이디

		JsonObject userObj = issueObj.get("user").getAsJsonObject();
		git.setUser(userObj.get("login").getAsString());
		git.setUserId(userObj.get("id").getAsString());
		
	    String userProfileUrl = userObj.get("avatar_url").getAsString();
		git.setProfile(userProfileUrl);
		
		return git;
	}

	
	
	
	
	

}
