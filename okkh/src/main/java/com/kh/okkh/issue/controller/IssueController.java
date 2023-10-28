package com.kh.okkh.issue.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.issue.model.service.IssueServiceImpl;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.service.LabelsServiceImpl;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.milestone.model.vo.Milestone;
import com.kh.okkh.repository.model.vo.Repo;


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
	public String selectIssueList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session, String state) throws JsonMappingException, IOException {
		
		// repo.getUserName()+"/"+repo.getRepoName(); 
		String repository = "nangmangorani/01_java-workspace";
		
		// 페이지 처음 열었을 때는 open이 default라 ㅠ
		if(state == null) {
			state = "open";
		}
		
//		Integer page= 1;
		
		// 라벨만 받아온거잖아
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		String token = ((Member)(session.getAttribute("git"))).getMemToken();
		
		ArrayList<Issue> list;
		
		// 일단 repository의 open_issues_count값을 가져와서 listCon
		
		// 페이지네이션
		// listCount는 총개수.. 근데 지금 열려있는거만이니까??? 이 레퍼지의 open_issues_count값을 가져오는게 맞는듯?
		// pageLimit은 10
		// boardLimit은 20
		
		int listCount = iService.issueCount(repository, token, session, state);
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 20);
		
		list = iService.getIssues(repository, token, state, pi);
		
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getState().equals("open")) {
				list.get(i).setState("진행중");
			} else {
				list.get(i).setState("진행완료");
			}
		}
		
//		<span class="labelSpan"
//                style="background-color: #${l.color};">${
//                l.name }</span>
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lList", lList);
		
		
		return "issue/issueList";
		
	}
	
	
	@RequestMapping(value="ajaxIssue", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ajaxIssue(HttpSession session, Member m, Model model, 
			@RequestParam(value="cpage", defaultValue="1") int currentPage,
			@RequestParam(required = false) String state,
			@RequestParam(required = false) String label,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) String assign,
			@RequestParam(required = false) String authorName, @RequestParam(required = false) String newTitle,
			@RequestParam(required = false) String issueNumber, @RequestParam(required = false) String userObject) throws IOException {
		
		String repository = "nangmangorani/01_java-workspace";

		if(state == null) {
			state = "open";
		}
		
		String token = ((Member)(session.getAttribute("git"))).getMemToken();

		ArrayList<Issue> list;
		
		int listCount = iService.issueCount(repository, token, session, state);
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 5);
		
		list = iService.getIssues(repository, token, state, pi);

		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getState().equals("open")) {
				list.get(i).setState("진행중");
			} else {
				list.get(i).setState("진행완료");
			}
		}
		Gson gson = new Gson();
		String json = gson.toJson(list);
		

		return json;
	}
	
	
	@RequestMapping("enrollForm.iss")
	public String enrollIssueView(HttpSession session, Model model) {
		
		//repo.getUserName()+"/"+repo.getRepoName(); 
		
		String repository = "nangmangorani/01_java-workspace";
		
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);
		
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);

		for(Labels l : lList) {
		}
		
		return "issue/issueEnroll";
		
	}
	
	/**
	 * 이슈 등록
	 * */
	@RequestMapping(value = "enroll.iss", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String enrollIssue(HttpSession session, Model model, 
			@RequestParam String title, @RequestParam(required = false) String body, 
			@RequestParam String assignee, @RequestParam(required = false) String labelSet, 
			@RequestParam(required = false) String milestone) throws IOException{
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		String repository = "nangmangorani/01_java-workspace";
		
		Map<String, Object> requestBody = new HashMap<>();
		
		requestBody.put("title", title);
		requestBody.put("body", body);
		
		
		if (milestone != null && !milestone.isEmpty()) {
			requestBody.put("milestone", milestone);
	    }
		
		if (assignee != null && !assignee.isEmpty()) {
			String[] assignees = assignee.split(",");
			requestBody.put("assignees", assignees);
	    }
	       
		if (labelSet != null && !labelSet.isEmpty()) {
	        String[] labels = labelSet.split(",");
			requestBody.put("labels", labels);
	    }
		
		iService.enrollIssue(token, repository, requestBody);
		
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
		headers.set("Authorization","bearer"+token);
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
		String createDateTime = issueJson.get("created_at").getAsString();
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
		
		
		JsonElement userElement = issueJson.get("user");
		JsonObject userObject = userElement.getAsJsonObject();
		String userLogin = userObject.get("login").getAsString();
		String a = null;
		JsonElement milestoneElement = issueJson.get("milestone");
		ArrayList<Milestone> milestoneList = new ArrayList<Milestone>();
		if (milestoneElement != null && !milestoneElement.isJsonNull()) {
			JsonObject milestoneObject = milestoneElement.getAsJsonObject();
			String milestoneTitle = milestoneObject.get("title").getAsString();
			a = milestoneTitle;
			int milestoneNumber = milestoneObject.get("number").getAsInt();
			Milestone m = new Milestone();

			m.setTitle(milestoneTitle);
			m.setNumber(milestoneNumber);

			milestoneList.add(m);

		}
		
		model.addAttribute("createDateTime", createDateTime);
		model.addAttribute("userLogin", userLogin);
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
	
//	public String detailIssue(HttpSession session, Model model, int bno) {
//		String token = ((Member)session.getAttribute("git")).getMemToken();
//		String repository = "nangmangorani/01_java-workspace";
//		
//		Issue issue = iService.getIssueByBno(repository, token, bno);
//		
//		model.addAttribute("issue", issue);
//		
//		return "issue/issueDetail";
//	}
	
	
	@RequestMapping("editForm.iss")
	public String editIssueForm(HttpSession session, Model model, String state, Integer ino) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		
		String repository = "nangmangorani/01_java-workspace";
		
		
		
		return "issue/issueEdit";
	}
	
	
	
	
	

	
	
	
	
	
}
