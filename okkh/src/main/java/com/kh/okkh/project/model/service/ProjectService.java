package com.kh.okkh.project.model.service;

import java.util.ArrayList;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.project.model.vo.Project;

public interface ProjectService {

	
	// 프로젝트 조회 (페이징 처리)
	
		// 0. 프로젝트 전체 개수 조회
		int selectProjectListCount();
	
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
		// 2. 프로젝트 조회수 증가
		int increaseCount(int pno);
		
		// 3. 프로젝트 찐 상세조회 (프로젝트게시글 번호 넘어옴)
		Project selectDetailPro(int pno);
	
		// 4. 프로젝트 모집완료하기 (프로젝트 번호 넘어옴)
		int recruitDonePro(int pno);
		
		// 5. 프로젝트 재모집하기 (프로젝트 번호)
		int recruitReplayPro(int pno);
		
	// 작성폼으로 갈때 기술스택 같이 조회해서가는 메소드
	ArrayList<Stack> selectStackList();	
		
	
	// 프로젝트 작성하기 (사용자가 입력한 값들이 넘어옴)
	int insertProject(Project p);
	
	
	
	// 상세페이지에서 수정을 누르면 일단 수정 폼으로 쏴야하는데, 수정 폼 갈때 위에 
	// 프로젝트 상세조회 메소드랑,  selectStackList 이거 이용해서 상세 프로젝트 값이랑 기술스택 리스트 조회해서
	// 가져가기
	
	
	// 프로젝트 수정하기 (사용자가 입력한 값 넘어옴)
		int updateProject(Project p);
	
	
	// 프로젝트 삭제하기 (게시글 번호 넘어옴)
		int deleteProject(int pno);
	
	
	
	// project 상세페이지에서 댓글 작성(ajax로)
		int insertReplyProject(Reply r);

	
	// project 상세보기에서 댓글 조회하기 (ajax로) 
		ArrayList<Reply> selectProjectReplyList(int pno);
	
	
	// project 상세보기에서 댓글 삭제하기 (ajax)
		int deleteReplyProject(int pno);
	
	
	
}
