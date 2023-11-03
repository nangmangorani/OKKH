package com.kh.okkh.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.member.model.dao.MemberDao;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.pr.model.vo.PR;
import com.kh.okkh.project.model.vo.Project;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member selectMember(Member m) {
		return mDao.selectMember(sqlSession, m);
	}
	
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}
	
	@Override
	public ArrayList<Stack> selectStackList() {
		return mDao.selectStackList(sqlSession);
	}
	
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public ArrayList<Project> myPJList(Member m) {
		return mDao.myPJList(sqlSession, m);
	}
	
	@Override
	public ArrayList<PR> myPRList(Member m) {
		return mDao.myPRList(sqlSession, m);
	}

	@Override
	public ArrayList<PR> myPRList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}


}
