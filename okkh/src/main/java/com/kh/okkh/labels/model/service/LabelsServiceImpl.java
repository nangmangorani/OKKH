package com.kh.okkh.labels.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.dao.LabelsDao;
import com.kh.okkh.labels.model.vo.Labels;

@Service
public class LabelsServiceImpl implements LabelsService {

	@Autowired
	private LabelsDao lDao;
	
	@Override
	public ArrayList<Labels> labelList(String repository, String token) {
		
		String url = repository + "/labels";
		
		
		String method = "get";
		
		String response = lDao.toGitLabel(url, token, method);
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		
		ArrayList<Labels> lList = new ArrayList<Labels>();
		
		try {
			jsonNode = obj.readTree(response);
			for(int i = 0; i < jsonNode.size(); i++) {
				int id = jsonNode.get(i).get("id").asInt();
				String name = jsonNode.get(i).get("name").asText();
				String color = jsonNode.get(i).get("color").asText();
				String description = jsonNode.get(i).get("description").asText();
				Labels label = new Labels(id, name, color, description);
				lList.add(label);
			}
			
			
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return lList;
	}

	@Override
	public void editLabel(String repository, String token, Map<String, Object> requestBody, String originName) {
		
		String url = repository + "/labels/" + originName;
		
		String method = "patch";
		
		lDao.toGitLabel(url, token, method, requestBody);
		
	}

	@Override
	public void labelEnroll(String repository, String token, Map<String, Object> requestBody) {
		
		String url = repository +  "/labels";
		
		String method = "post";

		lDao.toGitLabel(url, token, method, requestBody);

	}

	@Override
	public void deleteLabel(String repository, String token, String name) {
	
		String url = repository + "/labels/" + name;
		
		String method = "delete";
		
		lDao.toGitLabel(url, token, method);
		
	}
	
	
}
