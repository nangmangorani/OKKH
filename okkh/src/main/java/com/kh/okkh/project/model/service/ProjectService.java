package com.kh.okkh.project.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.Notice;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;

import com.kh.okkh.member.model.vo.Member;
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
			// 모집 완료했을 때 member테이블의 team이 게시글 번호 인 것들의 상태도 변경해주기 
		    int updateMemberTeam(int pno);
		
		
		// 5. 프로젝트 재모집하기 (프로젝트 번호)
		int recruitReplayPro(int pno);
		
			// 재 모집하면 member테이블의 team이 게시글 번호 인 것들의 상태도 변경하기 
			int reUpdateMemberTeam(int pno);
		
	// 작성폼으로 갈때 기술스택 같이 조회해서가는 메소드
	ArrayList<Stack> selectStackList();	
		
	
	// 프로젝트 작성하기 (사용자가 입력한 값들이 넘어옴)
	int insertProject(Project p);
	
	// 프로젝트 작성 완료 후 작성자의 team도 프로젝트 번호로 입력해주는 작업
	int insertTeam(Member m);
	
	
	
	// 상세페이지에서 수정을 누르면 일단 수정 폼으로 쏴야하는데, 수정 폼 갈때 위에 
	// 프로젝트 상세조회 메소드랑,  selectStackList 이거 이용해서 상세 프로젝트 값이랑 기술스택 리스트 조회해서
	// 가져가기
	
	
	// 프로젝트 수정하기 (사용자가 입력한 값 넘어옴)
		int updateProject(Project p);
	
	
	// 프로젝트 삭제하기 (게시글 번호 넘어옴)
		int deleteProject(int pno);
		// 프로젝트 삭제할 때 작성자의 team번호도 0으로 업뎃하기 
		int updateTeamNo(int memNo);
	
	
	// project 상세페이지에서 댓글 작성(ajax로)
		int insertReplyProject(Reply r);

	
	// project 상세보기에서 댓글 조회하기 (ajax로) 
		ArrayList<Reply> selectProjectReplyList(int pno);
	
	
	// project 상세보기에서 댓글 삭제하기 (ajax)
		int deleteReplyProject(int pno);
		
		
	// 프로젝트 상세조회할때 북마크도 같이 조회하는 메소드
		Bookmark selectProBookmark(Bookmark b);
		
	// 북마크 개수 조회
		int selectBookCount(int pno);
		
	// 사용자가 해당 게시물에 북마크 했는지 개수 조회하는 메소드
		int selectBookCountPersonal(Bookmark b);
		
	// 프로젝트 북마크 삽입하는 메소드
		int insertProBookmark(Bookmark b);
		
	// 프로젝트 북마크 삭제하는 메소드
		int deleteProBookmark(Bookmark b);
	
		
	// 프로젝트 참여하기 버튼 
		int participateProject(Member m);
	
		
    // 프로젝트 참여버튼 누르면 게시글 작성자에게 알람가는 메소드
		int alarmProject(Notice n);
		
	// 프로젝트 참여 취소용 메소드 
		int deleteEnrollProject(int memNo);
		
	// 프로젝트에 참여하기를 신청한 회원들만 조회하는 메소드
		ArrayList<Member> selectProjectTeamMateList(int pno);
		
		
	// 세션에 있는 로그인 멤버를 조회하는 메소드 (세션 바꿔치기용) -> 필요없어졌음..
		Member selectMember(int memNo);
		
	// 프로젝트에 팀원 추가하는 메소드 
		int enrollTeamMate(List<Integer>memNo);
		
	// 프로젝트에 팀원 해제하는 메소드
		int deleteTeamMate(List<Integer>memNo);
		
		
	
}
