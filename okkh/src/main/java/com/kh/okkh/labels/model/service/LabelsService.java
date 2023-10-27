package com.kh.okkh.labels.model.service;

import java.util.ArrayList;

import com.kh.okkh.labels.model.vo.Labels;

public interface LabelsService {

	ArrayList<Labels> labelList(String repository, String token);
	
}
