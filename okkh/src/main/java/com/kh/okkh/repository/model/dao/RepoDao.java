package com.kh.okkh.repository.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

@Repository
public class RepoDao {
	
	public ArrayList<MyProject> selectMyProjectList(SqlSessionTemplate sqlSession, Member loginMember) {
		return (ArrayList)sqlSession.selectList("repoMapper.selectMyProjectList", loginMember);
	}
	
	public ArrayList<Member> selectTeamMateList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("repoMapper.selectTeamMateList", memNo);
	}
	
	public int insertMyProject(SqlSessionTemplate sqlSession, MyProject p) {
		return sqlSession.insert("repoMapper.insertMyProject", p);
	}
	
	public int updateIngToFin(SqlSessionTemplate sqlSession, int myproNo) {
		return sqlSession.update("repoMapper.updateIngToFin", myproNo);
	}
	
	public MyProject selectMyProjectTitle(SqlSessionTemplate sqlSession, int myproNo) {
		return sqlSession.selectOne("repoMapper.selectMyProjectTitle", myproNo);
	}

}
