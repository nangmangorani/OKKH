package com.kh.okkh.project.model.service;

import java.util.ArrayList;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.project.model.vo.Project;

public interface ProjectService {

	
	// 프로젝트 조회 (페이징 처리)
	
		// 0. 프로젝트 전체 개수 조회
		int selectProjectCount();
	
		// 1. 프로젝트 전체조회
		ArrayList<Project> selectProjectList(PageInfo pi);
		
		// 2. 프로젝트 모집 중 조회
		ArrayList<Project> selectRecruitPro(PageInfo pi);
		
		// 3. 프로젝트 모집완료만 조회
		ArrayList<Project> selectRecruitProDone(PageInfo pi);
		
		// 4. 기술스택으로 조회 (기술스택 선택하면 선택한 값이 넘어옴)
		ArrayList<Project> selectStackPro(String stack,PageInfo pi);
		
		// 5. 제목, 글 내용으로 조회 (조회하려는 키워드 넘어옴)
		ArrayList<Project> selectSearchBar(String search,PageInfo pi);
		
		// 6. 조회수 순으로 조회
		ArrayList<Project> selectProCount(PageInfo pi);
	
	
		
	// 프로젝트 상세조회
		// 1. 프로젝트 조회수 증가
		int increaseCount(int pno);
		
		// 2. 프로젝트 찐 상세조회 (프로젝트게시글 번호 넘어옴)
		Project selectDetailPro(int pno);
	
		
		
		
		
	// 프로젝트 작성하기 (사용자가 입력한 값들이 넘어옴)
	int insertProject(Project p);
	
	
	// 프로젝트 수정하기 (사용자가 입력한 값이 넘어옴)
	int updateProject(Project p);
	
	
	// 프로젝트 삭제하기 (게시글 번호 넘어옴)
	int deleteProject(int pno);
	
	
	
}
