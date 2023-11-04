package com.kh.okkh.pullRequest.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.kh.okkh.commit.model.vo.Branches;
import com.kh.okkh.commit.model.vo.Commit;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.pullRequest.model.dao.PullRequestDao;
import com.kh.okkh.pullRequest.model.vo.PullRequest;
import com.kh.okkh.pullRequest.model.vo.PullReview;

/**
 * @author 유정(호빵)
 *
 */
@Service
public class PullRequestServiceImpl {
	
	@Autowired
	private PullRequestDao pullDao;
	

	// api 값이 출력되면 json 형으로 출력해야되서 여기서 파싱해주나봄
	private PullRequest createGitPullRequestFromJsonObject(JsonObject pullObj) {
		
		PullRequest git = new PullRequest();
		
		// https://api.github.com/repos/nangmangorani/OKKH/pulls?state=open&page=1 이런데에서 데이터가져와 객체에 세팅
		
		// 제목
		git.setTitle(pullObj.get("title").getAsString());
		
		// 내용
		git.setBody(pullObj.get("body").getAsString());
	
		// 진행중 여부
		git.setState(pullObj.get("state").getAsString());
		
		git.setFullRequestNum(pullObj.get("number").getAsInt());
		
		// 라벨
		JsonArray labelsArr = pullObj.get("labels").getAsJsonArray();
		
		
		
		String[] labels = new String[labelsArr.size()];
		
		
		// 라벨들의 이름을 담나봄..?
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

	
	// 풀리퀘 리뷰에 대한 것을 깃에서 받아옴
	// api 값이 출력되면 json 형으로 출력해야되서 여기서 파싱해주나봄
		private PullReview  createGitPullReviewFromJsonObject(JsonObject pullObj) {
			
			PullReview rgit = new PullReview();
			
			// https://api.github.com/repos/nangmangorani/OKKH/pulls?state=open&page=1 이런데에서 데이터가져와 객체에 세팅
			
			
			// 풀리퀘 리뷰 번호 
			//rgit.setPullReviewNo(pullObj.get("pullReviewNo").getAsInt());
		
			// 풀리퀘 리뷰의 참조 풀리퀘번호
			//rgit.setRefPull(pullObj.get("refPull").getAsInt());
			
			// 리뷰 작성자
			rgit.setState(pullObj.get("state").getAsString());
			
			
			// 리뷰 내용
			rgit.setReviewContent(pullObj.get("body").getAsString());
			
			
			// 리뷰 아이디 (리뷰 아이디의 고유아이디임)
			rgit.setId(pullObj.get("id").getAsInt());
			
			
			String pullRequestUrl = pullObj.get("pull_request_url").getAsString();
			// "pull_request_url"의 URL에서 마지막 슬래시 뒤의 문자열을 추출
			String[] parts = pullRequestUrl.split("/");
			String pullRequestNumber = parts[parts.length - 1];
			rgit.setRefPull(Integer.parseInt(pullRequestNumber));
			
		    //rgit.setPullReviewCount(pullObj.get("pullReviewCount").getAsInt());
		    
			
			
		    
		    // json객체로부터 문자열을 추출함
		    String createDateTimeString = pullObj.get("submitted_at").getAsString();
		    
		    // yyyy-MM-dd'T'HH:mm:ss, LocalDateTime 객체로 파싱
		    LocalDateTime createdDateTime = LocalDateTime.parse(createDateTimeString, DateTimeFormatter.ISO_DATE_TIME); 
		    
		    // 다시 객체형식 바꿔주면서~
		    String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		    rgit.setCreateDate(createdDateString);
		    
		    JsonObject userObj = pullObj.get("user").getAsJsonObject();
			rgit.setPullReviewWriter(userObj.get("login").getAsString());


			String userProfileUrl = userObj.get("avatar_url").getAsString();
			rgit.setProfile(userProfileUrl);
			return rgit;
		}
	
	
		
		// 브랜치에 대한 값을 깃에서 받아옴
		// api 값이 출력되면 json 형으로 출력해야되서 여기서 파싱해주나봄
			private Branches  createGitBranchesFromJsonObject(JsonObject pullObj) {
				
				Branches bgit = new Branches();
				
				// https://api.github.com/repos/nangmangorani/OKKH/pulls/5/commits
				
				
				
				// 커밋 내용
				JsonObject branchObj = pullObj.get("commit").getAsJsonObject();
				bgit.setUrl(branchObj.get("url").getAsString());
				
				bgit.setName(pullObj.get("name").getAsString());  // 브랜치 명

			

				
				return bgit;
			}
		
			
			
			// 풀리퀘 커밋에 대한 것을 깃에서 받아옴
			// api 값이 출력되면 json 형으로 출력해야되서 여기서 파싱해주나봄
				private Commit  createGitPullCommitFromJsonObject(JsonObject pullObj) {
					
					Commit cgit = new Commit();
					
					// https://api.github.com/repos/nangmangorani/OKKH/pulls/5/commits
					
					
					
					// 커밋 내용
					JsonObject commitObj = pullObj.get("commit").getAsJsonObject();
					cgit.setMassage(commitObj.get("message").getAsString());
					
					
					// 커밋 주소
					cgit.setUrl(pullObj.get("html_url").getAsString());
					
					
					
				    
				    JsonObject userObj = pullObj.get("author").getAsJsonObject();
					cgit.setLogin(userObj.get("login").getAsString());
					cgit.setProfile(userObj.get("avatar_url").getAsString());  

					
					return cgit;
				}
			
			
			
			//getBranches(repository,token)
			
			
		
		
		
	
	/**
	 * 라벨에 대한 응답받기... (주소값을 반환한다고 함..)
	 * @param repository
	 * @param session
	 */
	public ArrayList<Labels> getLables(String repository, HttpSession session) {
		
		String url = repository + "/labels";
		
		
	    // 여기는 http요청(서버가 특정 동작을 하게끔 클리언트에서 전송하는 메시지)을 하면
		// GitHub API에 라벨 정보를 요청하고 응답을 받는 곳
		String labelsResponse = pullDao.getGitContentsByGet1(url,session);
		
		
		// JSON 응답을 파싱하기 위한 ObjectMapper 객체 생성
		// json으로 응답받은 값을 java에서 사용할 수 있게 파싱하는 과정!!
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;    // 이건 obj에 저장된 값의 구조를 저장하는 거라고 함
		ArrayList<Labels> lList = new ArrayList<Labels>();
		
		
		// JSON 문자열을 JSON 노드로 파싱
		try {
			
			jsonNode = obj.readTree(labelsResponse);
			
			// JSON 응답에서 각 라벨 정보를 추출하고 Labels 객체로 만들어 리스트에 추가
			for (int i = 0; i < jsonNode.size(); i++) {
				int id = jsonNode.get(i).get("id").asInt();
				String name = jsonNode.get(i).get("name").asText();
				String color = jsonNode.get(i).get("color").asText();
				String description = jsonNode.get(i).get("description").asText();
				
				// 라벨 객체에서 위에서 얻은 값을 넣고 arraylist에 담으면 반복하면서 안에 있는 값이 
				// 모두 list에 담김
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
	 * 풀리퀘스트의 총 개수 세는 메소드 (state=open)
	 * @return
	 */
	public int pullRequestCount(String repository,String token,HttpSession session,String state) {
		
		int count = 0;
		if(state.equals("open")) {
			// 만약 state가  open 이라면?
			
		
			String pullState = repository + "/pulls?state=open";
			
			String pullRequestResponse = pullDao.getGitContentsByGet1(pullState, session);
			
			// 또 json 형태로 응답 온것을 java형태로 파싱해주기 
			ObjectMapper obj = new  ObjectMapper();
			
			// 구조 저장용..?
			JsonNode jsonNode;
			
			
			
			try {
				
				
			
				jsonNode = obj.readTree(pullRequestResponse);
				
				count = jsonNode.size();
				
				
			} catch (JsonProcessingException e) {
				
				e.printStackTrace();
			}
			
			
		}
		return count;
	}
		
		

		/**
		 * 풀리퀘스트의 총 개수 세는 메소드 (state가 close인 풀리퀘의 리스트 개수)
		 * @return
		 */
		public int pullRequestCount1(String repository,String token,HttpSession session,String state) {
			
			state = "closed";
			
			int count = 0;
			
			if(state.equals("closed")) {
				// 만약 state가  closed 이라면?
				
			
				String pullState = repository + "/pulls?state=closed";
				
				String pullRequestResponse = pullDao.getGitContentsByGet1(pullState, session);
				
				// 또 json 형태로 응답 온것을 java형태로 파싱해주기 
				ObjectMapper obj = new  ObjectMapper();
				
				// 구조 저장용..?
				JsonNode jsonNode;
				
				
				
				try {
					
					
				
					jsonNode = obj.readTree(pullRequestResponse);
					
					count = jsonNode.size();
					
					
				} catch (JsonProcessingException e) {
					
					e.printStackTrace();
				}
				
			}
			System.out.println(count  + "   : closed의 count");
				
				return count;
				
			  
				  
			};
			
			
			/**
			 * 풀리퀘의 리뷰 상세내용조회
			 * @return
			 */
			public int getpullRequestOpenReviewCount(String repository,String token, HttpSession session,
					                                String state, int openNum) {
			    // 리뷰 주소 : https://api.github.com/repos/nangmangorani/OKKH/pulls/3/reviews?state=open

				state = "open";
				
				int count = 0;
				
				if(state.equals("open")) {
					// 만약 state가  closed 이라면?
					
				
					String pullState = repository + "/pulls/"+openNum + "/reviews?state=open";
					
					String pullRequestResponse = pullDao.getGitContentsByGet1(pullState, session);
					
					// 또 json 형태로 응답 온것을 java형태로 파싱해주기 
					ObjectMapper obj = new  ObjectMapper();
					
					// 구조 저장용..?
					JsonNode jsonNode;
					
					
					
					try {
						
						
					
						jsonNode = obj.readTree(pullRequestResponse);
						
						count = jsonNode.size();
						
						
					} catch (JsonProcessingException e) {
						
						e.printStackTrace();
					}
					
				}
				//System.out.println(count  + "   : 의 count");
					
					return count;
					
				  
					  
				};
			
			
			
			
			
			
			
				/**
				 * 풀리퀘의 close 리뷰 개수 세는 메소드
				 * @return
				 * @throws IOException 
				 */
				public ArrayList<PullReview> getpullRequestCloseReviewCount(String repository, String token,String state,
						                    PageInfo closePi,int pullRequestNumber) throws IOException  {
				    // 리뷰 주소 : https://api.github.com/repos/nangmangorani/OKKH/pulls/3/reviews?state=open

					String url ="";
					
					state = "closed";
					
					url = "https://api.github.com/repos/" + repository 
						+ "/pulls/" + pullRequestNumber 
						+ "/reviews?state=" + state + "&page="+ closePi.getCurrentPage()
						+ "&per_page=" + closePi.getBoardLimit();
					
					URL requestUrl = new URL(url);
					
					HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
					
					urlConnection.setRequestProperty("Authorization","Bearer "+token);
					urlConnection.setRequestMethod("GET");
					
					
					/*
					 * 
					 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
					 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
					 *  
					 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
					 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
					 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
					 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
						일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
					 * */
					
					BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
					
					String line;
					String responseText = "";
					
					while((line = br.readLine()) != null) {
						responseText += line;
					}
					
					
					
					// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
					
					
					JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
					
					ArrayList<PullReview> closeReview = new ArrayList<PullReview>();
					
					for(int i=0 ; i<arr.size(); i++) {
						
						JsonObject pullObj = arr.get(i).getAsJsonObject();
						PullReview rgit = createGitPullReviewFromJsonObject(pullObj);
						closeReview.add(rgit);
						
						
					}
					
					return closeReview;
					
					  
						  
					};
			
					

				/**
				 * 풀리퀘의 리뷰 리스트 구하는 메소드
				 * @return
				 * @throws IOException 
				 */
				public ArrayList<PullReview> getpullRequestReview(String repository, String token,
						                    int pno) throws IOException  {
				    // 리뷰 주소 : https://api.github.com/repos/nangmangorani/OKKH/pulls/3/reviews?state=open

					String url ="";
					
					
					url = "https://api.github.com/repos/" + repository 
						+ "/pulls/" + pno
						+ "/reviews";
					
					URL requestUrl = new URL(url);
					
					HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
					
					urlConnection.setRequestProperty("Authorization","Bearer "+token);
					urlConnection.setRequestMethod("GET");
					
					
					/*
					 * 
					 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
					 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
					 *  
					 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
					 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
					 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
					 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
						일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
					 * */
					
					BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
					
					String line;
					String responseText = "";
					
					while((line = br.readLine()) != null) {
						responseText += line;
					}
					
					
					
					// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
					
					
					JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
					
					ArrayList<PullReview> openReview = new ArrayList<PullReview>();
					
					for(int i=0 ; i<arr.size(); i++) {
						
						JsonObject pullObj = arr.get(i).getAsJsonObject();
						PullReview rgit = createGitPullReviewFromJsonObject(pullObj);
						openReview.add(rgit);
						
						
					}
					
					return openReview;
					
					  
						  
					};
	
			
			
		/**
		 * 브랜치 리스트 조회하는 메소드
		 * @return
		 * @throws IOException 
		 */
		public ArrayList<Branches> getBranches(String repository,String token) throws IOException{
			
			// 브랜치 주소 : https://api.github.com/repos/nangmangorani/OKKH/branches
			
			String url ="";
			
			url = "https://api.github.com/repos/" + repository 
				+ "/branches";
			
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestProperty("Authorization","Bearer "+token);
			urlConnection.setRequestMethod("GET");
			
			
			/*
			 * 
			 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
			 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
			 *  
			 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
			 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
			 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
			 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
				일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
			 * */
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText = "";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			
			// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
			
			
			JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
			
			ArrayList<Branches> blist = new ArrayList<Branches>();
			
			for(int i=0 ; i<arr.size(); i++) {
				
				JsonObject pullObj = arr.get(i).getAsJsonObject();
				Branches git = createGitBranchesFromJsonObject(pullObj);
				blist.add(git);
				
				
			}
			
			return blist;
			
			
			
		}
					
					
					
			
		
	
		/**
		 * 이제 진짜 pullRequest의 목록을 얻어오자 (state=open)
		 * @return
		 * @throws IOException 
		 */
		public ArrayList<PullRequest> getPullRequest(String repository,String token,String state,PageInfo pi) throws IOException{
			
			String url ="";
			
			url = "https://api.github.com/repos/" + repository 
				+ "/pulls?state=" + state + "&page="+ pi.getCurrentPage()
				+ "&per_page=" + pi.getBoardLimit();
			
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestProperty("Authorization","Bearer "+token);
			urlConnection.setRequestMethod("GET");
			
			
			/*
			 * 
			 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
			 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
			 *  
			 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
			 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
			 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
			 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
				일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
			 * */
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText = "";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			
			// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
			
			
			JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
			
			ArrayList<PullRequest> plist = new ArrayList<PullRequest>();
			
			for(int i=0 ; i<arr.size(); i++) {
				
				JsonObject pullObj = arr.get(i).getAsJsonObject();
				PullRequest git = createGitPullRequestFromJsonObject(pullObj);
				plist.add(git);
				
				
			}
			
			return plist;
			
			
			
		}
	

		/**
		 * 이제 진짜 pullRequest의 목록을 얻어오자  (state가 close임)
		 * @return
		 * @throws IOException 
		 */
		public ArrayList<PullRequest> getPullRequest1(String repository,String token,String state,PageInfo closePi) throws IOException{
			
			String url ="";
			state = "closed";
			
			url = "https://api.github.com/repos/" + repository 
				+ "/pulls?state=" +state+ "&page="+ closePi.getCurrentPage()
				+ "&per_page=" + closePi.getBoardLimit();
			
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestProperty("Authorization","Bearer "+token);
			urlConnection.setRequestMethod("GET");
			
			
			/*
			 * 
			 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
			 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
			 *  
			 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
			 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
			 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
			 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
				일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
			 * */
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText = "";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			
			// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
			
			
			JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
			
			ArrayList<PullRequest> closeList = new ArrayList<PullRequest>();
			
			for(int i=0 ; i<arr.size(); i++) {
				
				JsonObject pullObj = arr.get(i).getAsJsonObject();
				PullRequest git = createGitPullRequestFromJsonObject(pullObj);
				closeList.add(git);
				
				
			}
			
			return closeList;
			
			
			
		}
	
	
		
		/**
		 *  풀리퀘 상세내용 조회
		 * @return
		 * @throws IOException 
		 */
		public PullRequest getOpenPullRequestDetail(String repository,String token,int num) throws IOException {
			
			//  https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)
			
			String url ="";
			
			url = "https://api.github.com/repos/" + repository 
				+ "/pulls/" + num ;
			
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestProperty("Authorization","Bearer "+token);
			urlConnection.setRequestMethod("GET");
			
			
			/*
			 * 
			 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
			 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
			 *  
			 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
			 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
			 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
			 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
				일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
			 * */
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText = "";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			
			// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
			
			
			JsonObject responseObj = JsonParser.parseString(responseText).getAsJsonObject();
			
			ArrayList<PullRequest> pull = new ArrayList<PullRequest>();
			
			
			// 필요한 데이터를 추출합니다.
			 PullRequest git = createGitPullRequestFromJsonObject(responseObj);
			
			// PullRequest 객체를 ArrayList에 추가합니다.
		
			// pull.add(git);
				
			System.out.println(git  + "  :  과연 서비스 깃에는 무엇이 들어있을지...?.");
			
		
			
			return git;
			
			
			
		};
		
		
		
		
		/**
		 * 풀리퀘 커밋 리스트 
		 * @return
		 * @throws IOException 
		 */
		public ArrayList<Commit> getPullCommit(String repository,String token, int pno) throws IOException{
			
			// https://api.github.com/repos/nangmangorani/OKKH/pulls/5/commits
			
			String url ="";
			
			
			url = "https://api.github.com/repos/" + repository 
				+ "/pulls/" + pno + "/commits";
			
			
			
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestProperty("Authorization","Bearer "+token);
			urlConnection.setRequestMethod("GET");
			
			
			/*
			 * 
			 * "Bearer "는 토큰의 타입을 나타내며, 일반적으로 "Bearer" 토큰을 사용합니다. 
			 *  Bearer 토큰은 OAuth 2.0 인증 토큰의 한 유형입니다.
			 *  
			 *  "Authorization"은 HTTP 헤더 필드의 하나로, 웹 요청에서 보내는 정보 중 하나입니다.
			 *  이 헤더 필드는 주로 사용자나 클라이언트의 인증 및 권한 부여를 서버에 전달하기 위해 사용됩니다. 
			 *  "Authorization" 헤더를 통해 서버는 클라이언트의 신원을 확인하고 해당 클라이언트에 대한 
			 *  특정 작업 또는 리소스에 대한 권한을 부여하거나 거부할 수 있습니다.
				일반적으로 "Authorization" 헤더는 다양한 형태의 인증 정보를 포함합니다. 
			 * */
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText = "";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			
			// 던져주는 정보가 json타입이라서 제이슨 배열로 파싱하기 
			
			
			JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
			
			ArrayList<Commit> commit = new ArrayList<Commit>();
			
			for(int i=0 ; i<arr.size(); i++) {
				
				JsonObject pullObj = arr.get(i).getAsJsonObject();
				Commit git = createGitPullCommitFromJsonObject(pullObj);
				commit.add(git);
				
				
			}
			
			return commit;
			
			
			
		}
		

		/**
		 * 풀리퀘를 변경하는 메소드 (상태/ 제목 / 내용 등등)
		 */
		public void updatePull(String token,String repository,int pno, Map<String, Object> updateValue) {
			
			
			// url 세팅해주기   https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)
			// method 세팅해주기
			
			String url = repository +"/pulls/"+pno;
			String method = "patch";  // 수정하는 거라 patch로
			
			pullDao.toGitPullRequest(token,url,updateValue, method);
			
			
		}
		
		
		/**
		 * 풀리퀘 리뷰 작성하는 메소드
		 */
		public void enrollReview(String token,String repository,Map<String, Object> updateValue,int pno) {
			
			// https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)/reviews
			
			String url = repository + "/pulls/"+pno+"/reviews";
			
			String method = "post";  // 새로 작성하는 거라 post로 
			
			pullDao.toGitPullRequest(token, url, updateValue, method);
			
			
		}
		
		
		
		
		/**
		 *  풀리퀘스트 작성하는 메소드
		 */
		public void enrollPullRequest(String token, String repository,Map<String, Object> updateValue) {
			
			
			// https://api.github.com/repos/nangmangorani/OKKH/pulls
			
			
			String url =repository + "/pulls";
			
			String method ="post";
			
			pullDao.toGitPullRequest(token, url, updateValue, method);
			
			
		}
		
		
		
		
		/**
		 * 풀리퀘 리뷰 수정하는메소드
		 */
		public void updateReview(String token,String repository,Map<String, Object> updateValue,int pno, int reviewId) {
			
			// https://api.github.com/repos/nangmangorani/OKKH/pulls/풀번호(num)/reviews/리뷰아이디
			
			String url = repository + "/pulls/"+pno+"/reviews/" + reviewId;
			
			
			// 풀리퀘 리뷰는 put으로 수정해야함.... 문서에 그렇게 나와있음....
			String method = "put"; 
			
			pullDao.toGitPullRequest(token, url, updateValue, method);
			
					
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
}
