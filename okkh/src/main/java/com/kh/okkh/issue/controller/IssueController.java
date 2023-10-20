package com.kh.okkh.issue.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.okkh.issue.model.service.IssueServiceImpl;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.service.LabelsServiceImpl;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.vo.Milestone;


@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;
	
	@Autowired 
	private LabelsServiceImpl lService;
	
	/**
	 * 이슈리스트 조회
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 */
	@RequestMapping("list.iss")
	public String selectIssueList(Model model, HttpSession session, String state) throws JsonMappingException, IOException {

		
		// repo.getUserName()+"/"+repo.getRepoName(); 
		String repository = "khFinal05/final05_html";
		
		// 페이지 처음 열었을 때는 open이 default라 ㅠ
		if(state == null) {
			state = "open";
		}
		
//		Integer page= 1;
		
		// 라벨만 받아온거잖아
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		String token = ((Member)(session.getAttribute("loginMember"))).getMemToken();
		
		ArrayList<Issue> list;
		
		list = iService.getIssues(repository, token, state);
		
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getState().equals("open")) {
				list.get(i).setState("진행중");
			} else {
				list.get(i).setState("진행완료");
			}
		}
		for(int i = 0; i<list.size(); i++) {
			System.out.println("이슈담당자 프로필이 나올까요~?" + list.get(i).getAssigneeProfiles());
		}

		model.addAttribute("list", list);
		model.addAttribute("lList", lList);
		
		
		return "issue/issueList";
		
	}
	
	@RequestMapping("enrollForm.iss")
	public String enrollIssueView(HttpSession session, Model model) {
		
		//repo.getUserName()+"/"+repo.getRepoName(); 

		String repository = "nangmangorani/01_java-workspace";
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);
		
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);

		return "issue/issueEnroll";
		
	}
	
	/**
	 * 이슈 등록
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "enroll.iss", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String enrollIssue(HttpSession session, Model model, 
			@RequestParam(required = false) String title, @RequestParam(required = false) String body, 
			@RequestParam(required = false) String assignee, @RequestParam(required = false) String label, 
			@RequestParam(required = false) String milestone) throws IOException{
		// js에서 문자열 ,로받고 여기서 split
		// js에서 배열로바꿔서 여기로 들고올지 고민중이야
		// jsp에서 한명을 select할때마다 늘어나야돼. 그럼 배열로 받는게맞나?
		String encodedMilestone = URLEncoder.encode(milestone, StandardCharsets.UTF_8.toString());

		String encodedMilestoneName = URLEncoder.encode(milestone, "UTF-8");
		String token = ((Member) session.getAttribute("loginMember")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues";
		System.out.println(apiUrl);
		System.out.println("나는 title" + title);
		System.out.println("나는 body" + body);
		System.out.println("나는 assignee" + assignee);
		System.out.println("나는 label" + label);
		System.out.println("나는 milestone" + milestone);
		JSONObject issueJson = new JSONObject();
		issueJson.put("title", title);
		issueJson.put("body", body);
		
		if (milestone != null && !milestone.isEmpty()) {
			issueJson.put("milestone", encodedMilestone);
	    }
		
		if (assignee != null && !assignee.isEmpty()) {
	        String[] assignees = assignee.split(",");
	        JSONArray assigneesArray = new JSONArray();
	        
	        // String Array -> JSONArray로 바꿔줌
	        for (String s : assignees) {
	            assigneesArray.add(s);
	        }
	        
	        // jsonObject 객체의 assignees에 넣어줌.
	        issueJson.put("assignees", assigneesArray);
	    }
		
		
		if (label != null && !label.isEmpty()) {
	        String[] labels = label.split(",");
	        JSONArray labelsArray = new JSONArray();
	        for (String s : labels) {
	            labelsArray.add(s);
	        }
	        issueJson.put("labels", labelsArray);
	    }
		System.out.println("issueJson에요" + issueJson);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer" + token);
		headers.set("Accept", "application/vnd.github+json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<String>(issueJson.toString(), headers);
		System.out.println("requestEntity에요" + requestEntity);
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity,
				String.class);
		
		HttpStatus responseStatus = responseEntity.getStatusCode();
		System.out.println("responseStatus에요 " + responseStatus);
		
		if (responseStatus != HttpStatus.CREATED) {
			throw new RuntimeException("Failed to create issue on GitHub API: " + responseStatus.toString());
		}
		
		return "redirect:list.iss";
	}
	
	
	@RequestMapping("detail.iss")
	public String detailIssue(HttpSession session, Model model, int bno) throws IOException {
		try {
		String token = ((Member) session.getAttribute("loginMember")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";
		
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + bno;
		
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer" + token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<String>("", headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,String.class);
		HttpStatus responseStatus = responseEntity.getStatusCode();
		
		if (responseStatus != HttpStatus.OK) {
			throw new RuntimeException(
					"Failed to retrieve issue data from GitHub API: " + responseStatus.toString());
		}
		
		Gson gson = new GsonBuilder().setLenient().create();
		JsonObject issueJson = gson.fromJson(responseEntity.getBody(), JsonObject.class);
		String title = issueJson.get("title").getAsString();
		
		JsonElement bodyElement = issueJson.get("body");
		String body = (bodyElement != null && !bodyElement.isJsonNull()) ? bodyElement.getAsString() : null;

		String state = issueJson.get("state").getAsString();
		
		JsonArray assigneesArray = issueJson.getAsJsonArray("assignees");
		ArrayList<Member> assignees = new ArrayList<Member>();
		
		if (assigneesArray != null) {
			for (JsonElement assigneeElement : assigneesArray) {
				JsonObject assigneeObject = assigneeElement.getAsJsonObject();

				String gitNick = assigneeObject.get("login").getAsString();
				String assigneeProfiles = assigneeObject.get("avatar_url").getAsString();

				Member assignee = new Member();
				assignee.setGitNick(gitNick);
				assignee.setProfile(assigneeProfiles);

				assignees.add(assignee);
			}
		}
		
		JsonArray labelsArray = issueJson.getAsJsonArray("labels");
		ArrayList<String> labels = new ArrayList<String>();

		if (labelsArray != null) {
			for (JsonElement labelElement : labelsArray) {
				JsonObject labelObject = labelElement.getAsJsonObject();
				String labelName = labelObject.get("name").getAsString();
				labels.add(labelName);
			}
		}
		
		JsonElement milestoneElement = issueJson.get("milestone");
		ArrayList<Milestone> milestoneList = new ArrayList<Milestone>();
		if (milestoneElement != null && !milestoneElement.isJsonNull()) {
			JsonObject milestoneObject = milestoneElement.getAsJsonObject();
			String milestoneTitle = milestoneObject.get("title").getAsString();
			String milestoneNumber = milestoneObject.get("number").getAsString();
			Milestone m = new Milestone();

			m.setTitle(milestoneTitle);
			m.setNumber(milestoneNumber);

			milestoneList.add(m);

		}
		
		model.addAttribute("title", title);
		model.addAttribute("body", body);
		model.addAttribute("state", state);
		model.addAttribute("bno", bno);
		model.addAttribute("assignees", assignees);
		model.addAttribute("labels", labels);
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);
		model.addAttribute("milestoneList", milestoneList);
		
		return "issue/issueDetail";
	} catch (Exception e) {
		e.printStackTrace();
		return "common/error500";
	}
}
	
	
	
	
	
	

	
	
	
	
	
}
