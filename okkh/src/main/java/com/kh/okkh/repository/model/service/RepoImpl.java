package com.kh.okkh.repository.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.dao.RepoDao;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

@Service
public class RepoImpl implements RepoService {
	
	@Autowired
	private RepoDao rdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<MyProject> selectMyProjectList(Member loginMember) {
		return rdao.selectMyProjectList(sqlSession, loginMember);
	}

}
