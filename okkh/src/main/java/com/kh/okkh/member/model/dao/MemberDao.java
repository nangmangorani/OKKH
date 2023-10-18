package com.kh.okkh.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.member.model.vo.Member;

@Repository
public class MemberDao {
	

	public int idCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	public int enrollToken(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.enrollToken", m);
	}
	
}
