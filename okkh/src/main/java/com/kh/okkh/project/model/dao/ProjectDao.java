package com.kh.okkh.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.project.model.vo.Project;

@Repository
public class ProjectDao {

	/**
	 * leftBar에서 recruit 누르자마자 프로젝트 전체조회하는 메소드
	 * @return
	 */
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList");
	}
	
	
}
