package com.kh.okkh.issue.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.kh.okkh.issue.model.vo.Comments;
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
	public String selectIssueList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session, String state,
		   String repository) throws JsonMappingException, IOException {
		
//		String repository = owner + "/" + repo;
		session.setAttribute("repository", repository);
//		session.getAttribute("repository", repository);
		if(state == null) {
			state = "open";
		}
		
//		Integer page= 1;
		
		// 라벨만 받아온거잖아
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		String token = (String)session.getAttribute("token");
		
		ArrayList<Issue> list;
		
		// 일단 repository의 open_issues_count값을 가져와서 listCon
		
		// 페이지네이션
		// listCount는 총개수.. 근데 지금 열려있는거만이니까??? 이 레퍼지의 open_issues_count값을 가져오는게 맞는듯?
		// pageLimit은 10
		// boardLimit은 20
		
		int listCount = iService.issueCount(repository, token, session, state);
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 20);
		
		list = iService.getIssues(repository, token, state, pi);
		
		System.out.println("리스트컨트롤러 list" + list);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lList", lList);
		
		
		return "issue/issueList";
		
	}
	
	
	@RequestMapping(value="ajaxIssue", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> ajaxIssue(HttpSession session, Member m, Model model, 
			@RequestParam(value="cpage", defaultValue="1") int currentPage,
			@RequestParam(required = false) String state,
			@RequestParam(required = false) String label,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) String assign,
			@RequestParam(required = false) String authorName, @RequestParam(required = false) String newTitle,
			@RequestParam(required = false) String issueNumber, @RequestParam(required = false) String userObject) throws IOException {
		
		System.out.println("cpage받아지긴함? " + currentPage);
		String repository = (String)session.getAttribute("repository");

		if(state == null) {
			state = "open";
		}
		
		String token = (String)session.getAttribute("token");
		ArrayList<Issue> list;
		
		int listCount = iService.issueCount(repository, token, session, state);

		ArrayList<Labels> lList = iService.getLabels(repository, session);
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 20);
		
		
		System.out.println("pi입니다 " + pi);
		
		list = iService.getIssues(repository, token, state, pi);

		
		
		Map<String, Object> response = new HashMap<>();
	    response.put("issues", list);
	    response.put("pagination", pi);	   
		response.put("lList", lList);


		return response;
	}
	
	
	@RequestMapping("enrollForm.iss")
	public String enrollIssueView(HttpSession session, Model model) {
		
		String token = (String)session.getAttribute("token");
		String repository = (String)session.getAttribute("repository");
		
		String orgs = repository.substring(0,repository.indexOf("/"));			
		
		System.out.println("등록할때 이거 받아짐???" + repository);
		
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);
		
		ArrayList<Member> memList = iService.getOrgsMember(orgs, token); 
		
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);
		model.addAttribute("memList", memList);

		
		return "issue/issueEnroll";
		
	}
	
	/**
	 * 이슈 등록
	 * */
	@RequestMapping(value = "enroll.iss", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String enrollIssue(HttpSession session, Model model, 
			@RequestParam String title, @RequestParam(required = false) String body, 
			@RequestParam String memList, @RequestParam(required = false) String labelSet, 
			@RequestParam(required = false) String milestone) throws IOException{
		
		String token = (String)session.getAttribute("token");		
		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> requestBody = new HashMap<>();
		
		requestBody.put("title", title);
		requestBody.put("body", body);
		
		
		if (milestone != null && !milestone.isEmpty()) {
			requestBody.put("milestone", milestone);
	    }
		
		if (memList != null && !memList.isEmpty()) {
			String[] assignees = memList.split(",");
			System.out.println("assignees 잘 받아짐? 등록컨" + assignees);
			requestBody.put("assignees", assignees);
	    }
	       
		if (labelSet != null && !labelSet.isEmpty()) {
	        String[] labels = labelSet.split(",");
			requestBody.put("labels", labels);
	    }

		String response = iService.enrollIssue(token, repository, requestBody);
		
		if(response.isEmpty() || response == null) {
			session.setAttribute("alertMsg", "이슈등록에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "이슈등록에 성공하였습니다.");
		}
		
		
		
		return "redirect:list.iss?repository=" + repository;
	}

	
	@RequestMapping("detail.iss")
	public String detailIssue(HttpSession session, Model model, Integer ino) throws IOException {
		try {
		String token = (String)session.getAttribute("token");
		String repository = (String)session.getAttribute("repository");
		
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);

//		Issue issue = new Issue();
//		issue = iService.getComments(repository, token, ino);
//		System.out.println("여기로 말할것같으면 컨트롤러 겟커멘트" + issue);
		
		ArrayList<Comments> cList = iService.getComments(repository, token, ino);
		
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;
		
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","bearer "+token);
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
		ArrayList<Labels> labels = new ArrayList<Labels>();

		if (labelsArray != null) {
			for (JsonElement labelElement : labelsArray) {
				JsonObject labelObject = labelElement.getAsJsonObject();
				int labelId = labelObject.get("id").getAsInt();
				String labelName = labelObject.get("name").getAsString();
				String labelColor = labelObject.get("color").getAsString();
				String labelDescription = labelObject.get("description").getAsString();
				
				Labels lab = new Labels(labelId, labelName, labelColor, labelDescription);
				labels.add(lab);
			}
		}
		System.out.println("labels란다" + labels);
		
		
		JsonElement userElement = issueJson.get("user");
		JsonObject userObject = userElement.getAsJsonObject();
		String userLogin = userObject.get("login").getAsString();
		JsonElement milestoneElement = issueJson.get("milestone");
		Milestone milestoneOne = new Milestone();
		
		if (milestoneElement != null && !milestoneElement.isJsonNull()) {
			JsonObject milestoneObject = milestoneElement.getAsJsonObject();
			String milestoneTitle = milestoneObject.get("title").getAsString();
			int milestoneNumber = milestoneObject.get("number").getAsInt();
			

			milestoneOne.setTitle(milestoneTitle);
			milestoneOne.setNumber(milestoneNumber);

		}
		
		System.out.println("milestoneOne" + milestoneOne);
		
		model.addAttribute("createDateTime", createDateTime);
		model.addAttribute("userLogin", userLogin);
		model.addAttribute("title", title);
		model.addAttribute("bodyMain", body);
		model.addAttribute("state", state);
		model.addAttribute("ino", ino);
		model.addAttribute("assignees", assignees);
		model.addAttribute("labels", labels);
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);
		model.addAttribute("milestoneOne", milestoneOne);
		model.addAttribute("cList", cList);
		
		return "issue/issueDetail";
		} catch (Exception e) {
			e.printStackTrace();
			return "common/error500";
		}
	}
	
	
	@RequestMapping("editForm.iss")
	public String editIssueForm(HttpSession session, Model model, Integer ino) throws IOException {
		
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");

		String orgs = repository.substring(0,repository.indexOf("/"));		
		ArrayList<Member> memList = iService.getOrgsMember(orgs, token); 


		
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		ArrayList<Milestone> mList = iService.getMilestone(repository, session);
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;
		
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","bearer "+token);
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
		
		ArrayList<Labels> labels = new ArrayList<Labels>();
		JsonArray labelsArray = issueJson.getAsJsonArray("labels");

		if (labelsArray != null) {
			for (JsonElement labelElement : labelsArray) {
				JsonObject labelObject = labelElement.getAsJsonObject();
				int labelId = labelObject.get("id").getAsInt();
				String labelName = labelObject.get("name").getAsString();
				String labelColor = labelObject.get("color").getAsString();
				String labelDescription = labelObject.get("description").getAsString();
				
				Labels lab = new Labels(labelId, labelName, labelColor, labelDescription);
				labels.add(lab);
			}
		}
		
		
		JsonElement userElement = issueJson.get("user");
		JsonObject userObject = userElement.getAsJsonObject();
		String userLogin = userObject.get("login").getAsString();
		String a = null;
		JsonElement milestoneElement = issueJson.get("milestone");
		Milestone milestoneOne = new Milestone();
		
		if (milestoneElement != null && !milestoneElement.isJsonNull()) {
			JsonObject milestoneObject = milestoneElement.getAsJsonObject();
			String milestoneTitle = milestoneObject.get("title").getAsString();
			int milestoneNumber = milestoneObject.get("number").getAsInt();
			

			milestoneOne.setTitle(milestoneTitle);
			milestoneOne.setNumber(milestoneNumber);

		}
		
		model.addAttribute("memList", memList);
		model.addAttribute("createDateTime", createDateTime);
		model.addAttribute("userLogin", userLogin);
		model.addAttribute("title", title);
		model.addAttribute("body", body);
		model.addAttribute("state", state);
		model.addAttribute("ino", ino);
		model.addAttribute("assignees", assignees);
		model.addAttribute("labels", labels);
		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);
		model.addAttribute("milestoneOne", milestoneOne);
		
		return "issue/issueEdit";
	}
	
	@RequestMapping(value="edit.iss", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String editIssue(HttpSession session, 
			@RequestParam(required = false) Integer ino,
			@RequestParam String title,
			@RequestParam(required = false) String body,
			@RequestParam(required = false) String memList,
			@RequestParam String labelSet, 
			@RequestParam(required = false) String milestone) {
		
		String token = (String)session.getAttribute("token");
		
		System.out.println("수정페이지 ino 결국보내지냐?" + ino);
		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> requestBody = new HashMap<>();
		
		requestBody.put("title", title);
		requestBody.put("body", body);
		
		
		if (milestone != null && !milestone.isEmpty()) {
			requestBody.put("milestone", milestone);
	    }
		
		if (memList != null && !memList.isEmpty()) {
			String[] assignees = memList.split(",");
			requestBody.put("assignees", assignees);
			System.out.println("잘있을까요? " + assignees.length);
	    }
	       
		if (labelSet != null && !labelSet.isEmpty()) {
	        String[] labels = labelSet.split(",");
			requestBody.put("labels", labels);
			System.out.println("잘있을까요? " + labels.length);
	    }
		
		System.out.println("잘있을까요? " + milestone);
		
		
		String response = iService.editIssue(token, repository, requestBody, ino);
		
		if(response.isEmpty() || response == null) {
			session.setAttribute("alertMsg", "이슈 수정에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "이슈 수정에 성공하였습니다.");
		}

		return "redirect:/detail.iss?ino=" + ino;
	}
	
	
	
	@RequestMapping(value="AjaxIssueByLabels.iss", produces = "application/json; charset=utf-8", method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> ajaxIssueByLabels(HttpSession session, String state,
	@RequestParam(value = "cpage", defaultValue = "1") int currentPage, @RequestParam(value="selectedValues[]", required = false) ArrayList selectedValuesList) {
		
		String token = (String)session.getAttribute("token");

		String repository = (String)session.getAttribute("repository");

		if(state == null) {
			state = "open";
		}
		
		String labelToString = new String();
		if(selectedValuesList != null) {
			for(int i = 0; i<selectedValuesList.size(); i++) {
				if(i == 0 && labelToString != null) {
					labelToString += selectedValuesList.get(0);
				} else if(labelToString != null && i != 0){
					labelToString += ","+selectedValuesList.get(i);
				}
			}
		}
		
		
		int listCount = iService.issueCount(repository, token, session, state, labelToString);
		
		System.out.println("라벨로 찍을때 카운트야" + listCount);
		
		PageInfo pi = PagiNation.getPageInfo(listCount, currentPage, 10, 20);

		ArrayList<Labels> lList = iService.getLabels(repository, session);
		
		ArrayList<Issue> iList = new ArrayList<Issue>();		
		iList = iService.getIssuesByLabels(session, repository, token, state, pi, labelToString);
		
		Map<String, Object> response = new HashMap<>();
	    response.put("issues", iList);
	    response.put("pagination", pi);
		response.put("lList", lList);


		return response;
	}
	

	@RequestMapping("state.iss")
	public String stateChangeIssue(HttpSession session, int ino, String state) {

		String token = (String)session.getAttribute("token");

		String repository = (String)session.getAttribute("repository");
		
		Map<String, Object> requestBody = new HashMap<>();
		
		requestBody.put("state", state);

		String response = iService.editIssue(token, repository, requestBody, ino);

		if(response.isEmpty() || response == null) {
			session.setAttribute("alertMsg", "이슈 상태변경에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "이슈 상태변경에 성공하였습니다.");
		}

		return "redirect:/list.iss?repository=" + repository;

	}
	

	@RequestMapping("commentEnroll.iss")
	public String commentEnrollIssue(HttpSession session, String body, Integer ino) {
		

		String repository = (String)session.getAttribute("repository");

		String token = (String)session.getAttribute("token");

		Map<String, Object> requestBody = new HashMap<>();
		
		requestBody.put("body", body);

		String response = iService.enrollComment(repository, token, requestBody, ino);
		
		if(response.isEmpty() || response == null) {
			session.setAttribute("alertMsg", "이슈 커멘트추가에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "이슈 커멘트추가에 성공하였습니다.");
		}

		return "redirect:/detail.iss?ino=" + ino;

	}
	
	@RequestMapping("deleteComments.iss")
	public String deleteComments(HttpSession session, Integer id, Integer ino) {
		
		String repository = (String)session.getAttribute("repository");
		
		String token = (String)session.getAttribute("token");
		
		int response = iService.deleteComments(repository, token, id);
		
		return "redirect:/detail.iss?ino=" + ino;
	}
	

	
	
	
	
	
}