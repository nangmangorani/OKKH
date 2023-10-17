package com.kh.okkh.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.project.model.dao.ProjectDao;
import com.kh.okkh.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 페이징 처리를 위해서 프로젝트 목록 개수를 구하는 메소드
	 */
	@Override
	public int selectProjectCount() {
		
		return 0;
	}

	
	
	/**
	 * leftBar에서 recruit 누르자마자 전체 프로젝트 리스트 조회할 메소드
	 */
	@Override
	public ArrayList<Project> selectProjectList(PageInfo pi) {
		
		return pdao.selectProjectList(sqlSession);
	}

	@Override
	public ArrayList<Project> selectRecruitPro(PageInfo pi) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectRecruitProDone(PageInfo pi) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectStackPro(String stack,PageInfo pi) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectSearchBar(String search,PageInfo pi) {
		
		return null;
	}

	@Override
	public ArrayList<Project> selectProCount(PageInfo pi) {
		
		return null;
	}

	@Override
	public int increaseCount(int pno) {
		
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
