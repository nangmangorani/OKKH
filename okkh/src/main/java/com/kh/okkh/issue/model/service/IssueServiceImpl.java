package com.kh.okkh.issue.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.vo.Milestone;
import com.kh.okkh.repository.model.vo.Repo;

/**
 * @author user1
 *
 */
@Service
public class IssueServiceImpl implements IssueService{
	
	@Autowired
	private IssueDao iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WebClient webClient;

	
//	@Override
//	public ArrayList<Issue> selectIssueList() {
//		return iDao.selectIssueList(sqlSession);
//	}

	@Override
	public ArrayList<Labels> getLabels(String repository, HttpSession session){
		
		String url = repository + "/labels";
		// 여기서 git.api url로 변환해줌
		// 라벨 전체url이 나올거임
		// 2333333333
		String labelResponse = iDao.getGitContentsByGet1(url, session);
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		ArrayList<Labels> lList = new ArrayList<Labels>();
		// json으로 변환????
		try {
			jsonNode = obj.readTree(labelResponse);
			for (int i = 0; i < jsonNode.size(); i++) {
				int id = jsonNode.get(i).get("id").asInt();
				String name = jsonNode.get(i).get("name").asText();
				String color = jsonNode.get(i).get("color").asText();
				String description = jsonNode.get(i).get("description").asText();

				Labels l = new Labels(id, name, color, description);
				lList.add(l);
			}
			
			// 여기까지하면 Labels 객체에 라벨관련된 내용들이 담겨있겠지??
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		return lList;
	}
	
	/**
	 * issue리스트 페이징 처리위한 count 추출
	 * 
	 * */
	@Override
	public int issueCount(String repository, String token, HttpSession session, String state) {

		
		if(state.equals("open")) {
			
			String repoState = repository;
			
			String repoResponse = iDao.getGitContentsByGet1(repoState, session);
			
			ObjectMapper obj = new ObjectMapper();
			JsonNode jsonNode;
			int count = 0;
			try {
				jsonNode = obj.readTree(repoResponse);
				
				count = jsonNode.get("open_issues_count").asInt();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			return count;
		} else {
			String repoState = repository + "/issues?state=closed";	
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
	public ArrayList<Issue> getIssues(String repository, String token, String state, PageInfo pi) 
			throws IOException {
		
		String url = "";
		
		url = "https://api.github.com/repos/" + repository + "/issues?state=" + state + "&page=" + pi.getCurrentPage() + "&per_page=" + pi.getBoardLimit();
		
		URL requestUrl = new URL(url);
	    HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();

	    urlConnection.setRequestProperty("Authorization","Bearer "+token);
	    urlConnection.setRequestMethod("GET");
		
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
	    String line;
	    String responseText = "";
	    
	    
	    while ((line = br.readLine()) != null) {
	      responseText += line;
	    }
	    
		
	    // 제이슨 배열로 파싱작업
	    JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
	    // arr을 추가할 issue 제네릭의 list
	    ArrayList<Issue> list = new ArrayList<Issue>();
	    
	    for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         Issue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }
	    return list;
	      
	}
	
		
	
	@Override
	public ArrayList<Milestone> getMilestone(String repository, HttpSession session) {
		
		String url = repository + "/milestones";
		String milestoneResponse = iDao.getGitContentsByGet1(url, session);
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		ArrayList<Milestone> mList = new ArrayList<Milestone>();
		
		try {
			jsonNode = obj.readTree(milestoneResponse);
			for (int i = 0; i < jsonNode.size(); i++) {
	            int id = jsonNode.get(i).get("id").asInt();
	            String title = jsonNode.get(i).get("title").asText();
	            int number = jsonNode.get(i).get("number").asInt();
	            String state = jsonNode.get(i).get("state").asText();
	            Milestone m = new Milestone(id, title, number, state);
	            mList.add(m);
	         }
			
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return mList;
		
	}
	
	/**
	 * 이슈 상세보기
	 * */
//	public Issue getIssueByBno(String repository, String token, int bno) {
//	    String url = repository + "/issues/" + bno;
//	    String response = iDao.toGitGetIssue(url, token, bno);
//	    System.out.println(response);
//	    ObjectMapper obj = new ObjectMapper();
//	    JsonNode jsonNode;
//	    Issue issue = null;
//
//	    try {
//	        jsonNode = obj.readTree(response);
//
//	        String title = jsonNode.has("title") ? jsonNode.get("title").asText() : "";
//	        
//	        // "labels" 키의 값을 JSON 배열로 가져옵니다.
//	        JsonNode labelsNode = jsonNode.has("labels") ? jsonNode.get("labels") : null;
//	        ArrayList<String> labels = new ArrayList<>();
//
//	        if (labelsNode != null && labelsNode.isArray()) {
//	            for (JsonNode labelNode : labelsNode) {
//	                labels.add(labelNode.asText());
//	            }
//	        }
//	        String[] labelsArray = labels.toArray(new String[0]);
//	        
//	        String state = jsonNode.has("state") ? jsonNode.get("state").asText() : "";
//	        String milestone = jsonNode.has("milestone") ? jsonNode.get("milestone").asText() : "";
//	        int number = jsonNode.has("number") ? jsonNode.get("number").asInt() : 0;
//	        int milestoneNum = 0;
//
//	        if (jsonNode.has("milestone") && jsonNode.get("milestone").has("number")) {
//	            milestoneNum = jsonNode.get("milestone").get("number").asInt();
//	        }
//	        
//	        int id = jsonNode.has("id") ? jsonNode.get("id").asInt() : 0;
//	        String user = jsonNode.has("user") ? jsonNode.get("user").asText() : "";
//	        String userId = jsonNode.has("id") ? jsonNode.get("id").asText() : "";
//	        String profile = jsonNode.has("user") && jsonNode.get("user").has("avatar_url") ? jsonNode.get("user").get("avatar_url").asText() : "";
//
//	        JsonNode assigneesNode = jsonNode.has("assignees") ? jsonNode.get("assignees") : null;
//	        ArrayList<String> assignees = new ArrayList<>();
//
//	        if (assigneesNode != null && assigneesNode.isArray()) {
//	            for (JsonNode assignee : assigneesNode) {
//	                assignees.add(assignee.asText());
//	            }
//	        }
//
//	        String[] assigneesArray = assignees.toArray(new String[0]);
//
//	        JsonNode assigneeProfilesNode = jsonNode.has("assigneeProfiles") ? jsonNode.get("assigneeProfiles") : null;
//	        ArrayList<String> assigneeProfiles = new ArrayList<>();
//
//	        if (assigneeProfilesNode != null && assigneeProfilesNode.isArray()) {
//	            for (JsonNode assignee : assigneeProfilesNode) {
//	                assigneeProfiles.add(assignee.asText());
//	            }
//	        }
//
//	        String[] assigneesProArray = assigneeProfiles.toArray(new String[0]);
//
//	        String login = jsonNode.has("login") ? jsonNode.get("login").asText() : "";
//	        SimpleDateFormat s1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
//	        SimpleDateFormat s2 = new SimpleDateFormat("yyyy-MM-dd");
//
//	        String createdAt = null;
//	        String updatedAt = null;
//	        String closedAt = null;
//
//	        if (jsonNode.has("created_at") && !"null".equals(jsonNode.get("created_at").asText())) {
//	            try {
//	                Date createdAtBefore = s1.parse(jsonNode.get("created_at").asText());
//	                createdAt = s2.format(createdAtBefore);
//	            } catch (ParseException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//	        if (jsonNode.has("updated_at") && !"null".equals(jsonNode.get("updated_at").asText())) {
//	            try {
//	                Date updatedAtBefore = s1.parse(jsonNode.get("updated_at").asText());
//	                updatedAt = s2.format(updatedAtBefore);
//	            } catch (ParseException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//	        if (jsonNode.has("closed_at") && !"null".equals(jsonNode.get("closed_at").asText())) {
//	            try {
//	                Date closedAtBefore = s1.parse(jsonNode.get("closed_at").asText());
//	                closedAt = s2.format(closedAtBefore);
//	            } catch (ParseException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//	        issue = new Issue(title, labelsArray, state, milestone, number, milestoneNum, createdAt, updatedAt, closedAt, id, user, userId, profile, assigneesArray, assigneesProArray, login);
//
//	    } catch (JsonProcessingException e) {
//	        e.printStackTrace();
//	    }
//
//	    return issue;
//	}

	
	
	/**
	 * 이슈 등록
	 * */
	public void enrollIssue(String token, String repository, Map<String, Object> requestBody) {
		
		String url = repository + "/issues";
		
		String method = "post";
		
		iDao.toGitIssue(token, url, requestBody, method);
		
	}
	
	
	
	private Issue createGitIssueFromJsonObject(JsonObject issueObj) {
		Issue git = new Issue();
		
		// https://api.github.com/repos/nangmangorani/01_java-workspace/issues?state=open&page=1 이런데에서 데이터가져와 객체에 세팅
		
		// 제목
		git.setTitle(issueObj.get("title").getAsString());
	
		// 진행중 여부
		git.setState(issueObj.get("state").getAsString());
		
		// 라벨
		JsonArray labelsArr = issueObj.get("labels").getAsJsonArray();
		
		
		
		String[] labels = new String[labelsArr.size()];
		
		for (int j = 0; j < labelsArr.size(); j++) {
	       labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
	       
	    }
		git.setLabels(labels);
		
		JsonElement milestoneElem = issueObj.get("milestone");
		
		// 여기에서 milestone관련 필요한거만 쏙 넣어줌
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
		
	    git.setId(issueObj.get("id").getAsInt()); // 이슈 아이디

		JsonObject userObj = issueObj.get("user").getAsJsonObject();
		git.setUser(userObj.get("login").getAsString());
		git.setUserId(userObj.get("id").getAsString());
		
	    String userProfileUrl = userObj.get("avatar_url").getAsString();
		git.setProfile(userProfileUrl);
		
		return git;
	}

	
	
	/**
	 * 마일스톤상세페이지 마일스톤 번호에 따른 이슈리스트 조회
	 * @throws IOException 
	 * 
	 * */
	@Override
	public ArrayList<Issue> getIssuesByMno(String repository, HttpSession session, String state, int mno) throws IOException {
		
		String token = ((Member)(session.getAttribute("git"))).getMemToken();
		
		String iListAll = iDao.getIssuesByMno(repository, token, state, mno);
		
		 // 제이슨 배열로 파싱작업
	    JsonArray arr = JsonParser.parseString(iListAll).getAsJsonArray();
	    // arr을 추가할 issue 제네릭의 list
	    ArrayList<Issue> list = new ArrayList<Issue>();
	    
	    for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         Issue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }
	    return list;
	}



	
	
	
	
	
	
	
	
	


	
	
	
	
	

}
