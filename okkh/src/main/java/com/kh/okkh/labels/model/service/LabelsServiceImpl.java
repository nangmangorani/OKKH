package com.kh.okkh.labels.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.issue.model.dao.IssueDao;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.dao.LabelsDao;
import com.kh.okkh.labels.model.vo.Labels;

@Service
public class LabelsServiceImpl implements LabelsService {

	@Autowired
	private LabelsDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Labels> selectLabList() {
		return lDao.selectLabList(sqlSession);
	}
	
	

}
