package com.kh.okkh.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.project.model.dao.ProjectDao;
import com.kh.okkh.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/**
	 * leftBar에서 recruit 누르자마자 전체 프로젝트 리스트 조회할 메소드
	 */
	@Override
	public ArrayList<Project> selectProjectList() {
		
		return pdao.selectProjectList(sqlSession);
	}

	@Override
	public ArrayList<Project> selectRecruitPro() {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectRecruitProDone() {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectStackPro(String stack) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectSearchBar(String search) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectProCount() {
		
		return null;
	}

	@Override
	public int increaseCount() {
		
		return 0;
	}

	@Override
	public Project selectDetailPro(int pno) {
		
		return null;
	}

	@Override
	public int insertProject(Project p) {
		
		return 0;
	}

	@Override
	public int updateProject(Project p) {
		
		return 0;
	}

	@Override
	public int deleteProject(int pno) {
		
		return 0;
	}

	
	
}
