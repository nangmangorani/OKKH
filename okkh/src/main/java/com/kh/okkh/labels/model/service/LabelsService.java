package com.kh.okkh.labels.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.okkh.labels.model.vo.Labels;

public interface LabelsService {

	ArrayList<Labels> labelList(String repository, String token);
	
	void editLabel(String repository, String token, Map<String, Object> requestBody, String originName);

	void labelEnroll(String repository, String token, Map<String, Object> requestBody);
	
}
