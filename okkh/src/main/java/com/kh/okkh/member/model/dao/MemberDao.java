package com.kh.okkh.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.pr.model.vo.PR;
import com.kh.okkh.project.model.vo.Project;

@Repository
public class MemberDao {
	
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public ArrayList<Stack> selectStackList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectStackList");
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public ArrayList<PR> myPRList(SqlSessionTemplate sqlSession, Member m) {
//		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
//		int limit = pi.getBoardLimit();
//		
//		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("memberMapper.myPRList", m);
	}
	
	public ArrayList<Project> myPJList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.myPJList", m);
	}

}
