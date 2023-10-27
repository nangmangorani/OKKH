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
	
	// 윤씨 버거 맛있게 먹었어??
	// 우린 이수 엔젤 가볼게
	// 올려면 와
	// 화이팅하고 울지말고
	public int insertMyProject(SqlSessionTemplate sqlSession, MyProject p) {
		return sqlSession.insert("repoMapper.insertMyProject", p);
	}
	
	public MyProject selectMyProjectTitle(SqlSessionTemplate sqlSession, int myproNo) {
		return sqlSession.selectOne("repoMapper.selectMyProjectTitle", myproNo);
	}

}
