package com.kh.okkh.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.member.model.dao.MemberDao;
import com.kh.okkh.member.model.vo.Member;

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
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}
	
}
