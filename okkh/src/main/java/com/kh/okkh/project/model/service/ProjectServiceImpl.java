package com.kh.okkh.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.Notice;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.project.model.dao.ProjectDao;
import com.kh.okkh.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	
	/**
	 * leftsideBar에서 recruit 누르자마자 프로젝트 전체 개수 구하는 메소드
	 */
	@Override
	public int selectProjectListCount() {
		
		return pdao.selectProjectListCount(sqlSession);
	}

	
	
	/**
	 * 프로젝트 전체 목록 조회하는 메소드
	 */
	@Override
	public ArrayList<Project> selectProjectList(PageInfo pi) {
		
		return pdao.selectProjectList(pi, sqlSession);
	}

	/**
	 * 프로젝트 모집 중만 조회
	 */
	@Override
	public ArrayList<Project> selectRecruitPro(PageInfo pi) {
		
		return null;
	}

	/**
	 * 프로젝트 모집 완료만 조회
	 */
	@Override
	public ArrayList<Project> selectRecruitProDone(PageInfo pi) {
		
		return null;
	}

	/**
	 * 기술 스택으로 조회
	 */
	@Override
	public ArrayList<Project> selectStackPro(String stack, PageInfo pi) {
		
		return null;
	}

	/**
	 * 제목, 글 내용으로 조회
	 */
	@Override
	public ArrayList<Project> selectSearchBar(String search, PageInfo pi) {
		
		return null;
	}

	/**
	 * 조회수 순으로 조회
	 */
	@Override
	public ArrayList<Project> selectProCount(PageInfo pi) {
		
		return null;
	}

	/**
	 * 프로젝트 상세조회 누르면 먼저 조회수부터 증가시키는 메소드
	 */
	@Override
	public int increaseCount(int pno) {
		
		return pdao.increaseCount(pno, sqlSession);
	}

	/**
	 * 찐으로 프로젝트 내용 상세조회하는 메소드
	 */
	@Override
	public Project selectDetailPro(int pno) {
		
		return pdao.selectDetailPro(pno, sqlSession);
	}
	
	

	/**
	 * 프로젝트 모집 완료하는 메소드
	 */
	@Override
	public int recruitDonePro(int pno) {
		
		return pdao.recruitDonePro( pno, sqlSession);
	}


	/**
	 * 다시 재모집하는 메소드
	 */
	@Override
	public int recruitReplayPro(int pno) {
		
		return pdao.recruitReplayPro(pno, sqlSession);
	}
	
	
	
	/**
	 * 작성 폼으로 가기 전 기술스택 목록 조회하는 메소드
	 */
	@Override
	public ArrayList<Stack> selectStackList() {
		
		return pdao.selectStackList(sqlSession);
	}

	/**
	 * 찐으로 프로젝트 작성하기
	 */
	@Override
	public int insertProject(Project p) {
		
		return pdao.insertProject(p,sqlSession);
	}

	
	/**
	 * 프로젝트 수정하기
	 */
	@Override
	public int updateProject(Project p) {
		
		return pdao.updateProject(p, sqlSession);
	}

	/**
	 * 프로젝트 삭제하기
	 */
	@Override
	public int deleteProject(int pno) {
		
		return pdao.deleteProject(pno, sqlSession);
	}
	
	/**
	 * 프로젝트 삭제할 때 작성자의 team번호도 0으로 업뎃하기
	 */
	@Override
	public int updateTeamNo(int memNo) {
		
		return pdao.updateTeamNo(memNo, sqlSession);
	}


	/**
	 * 프로젝트 상세페이지에 댓글 작성하기
	 */
	@Override
	public int insertReplyProject(Reply r) {
		
		return pdao.insertReplyProject(r,sqlSession);
	}

	/**
	 * 프로젝트 댓글 조회
	 */
	@Override
	public ArrayList<Reply> selectProjectReplyList(int pno) {
		
		ArrayList<Reply>list = pdao.selectProjectReplyList(pno, sqlSession);
		
		
		return list;
		
		
	}

	/**
	 * 프로젝트 댓글 삭제 
	 */
	@Override
	public int deleteReplyProject(int pno) {
		
		return pdao.deleteReplyProject( pno, sqlSession);
	}



	/**
	 * 북마크 조회하는 메소드
	 */
	@Override
	public Bookmark selectProBookmark(Bookmark b) {
		
		return pdao.selectProBookmart(b,sqlSession);
	}


	/**
	 * 해당 게시글의 북마크 개수 조회하는 메소드
	 */
	@Override
	public int selectBookCount(int pno) {
		
		return pdao.selectBookCount(pno, sqlSession);
	}
	
	
	
	/**
	 * 해당 게시글에 사용자가 북마크를 했는지 개수 세는 메소드
	 */
	@Override
	public int selectBookCountPersonal(Bookmark b) {
		
		return pdao.selectBookCountPersonal(b, sqlSession);
	}
	
	

	/**
	 * 북마크 삽입하는 메소드
	 */
	@Override
	public int insertProBookmark(Bookmark b) {
		 
		
		
		return pdao.insertProBookmark(b, sqlSession);
	}



	/**
	 *  북마크 삭제하는 메소드
	 */
	@Override
	public int deleteProBookmark(Bookmark b) {
		
		return pdao.deleteProBookmark(b, sqlSession);
	}



	/**
	 * 프로젝트 참여하는 메소드
	 */
	@Override
	public int participateProject(Member m) {
		
		return pdao.participateProject(m, sqlSession);
	}



	/**
	 * 프로젝트 참여 버튼을 누르면 작성자에게 알람가는 메소드
	 * 근데 이걸 소켓으로 처리해서 여기 메소드 필요없을 수도
	 */
	@Override
	public int alarmProject(Notice n) {
		
		return 0;
	}



	/**
	 *  프로젝트 참여를 취소하는 메소드
	 */
	@Override
	public int deleteEnrollProject(int memNo) {
		
		return pdao.deleteEnrollProject(memNo, sqlSession);
	}



	/**
	 * 다시 멤버상세내용 조회하는 메소드
	 */
	@Override
	public Member selectMember(int memNo) {
		
		return pdao.selectMember(memNo, sqlSession);
	}



	/**
	 * 작성자가 프로젝트 작성완료 후 작성자의 member테이블의 팀컬럼에 게시글 번호 입력하는 메소드
	 */
	@Override
	public int insertTeam(Member m) {
		
		return pdao.insertTeam(m ,sqlSession);
	}



	/**
	 * 작성자가 프로젝트 모집 완료했을 경우 member 테이블의 team컬럼의 상태도 변경하는 메소드
	 */
	@Override
	public int updateMemberTeam(int pno) {
		
		return pdao.updateMemberTeam(pno, sqlSession);
	}



	/**
	 * 작성자가 프로젝트 모집 완료했을 경우 member 테이블의 team컬럼의 상태도 변경하고 팀원들에게 알람도 보내는 메소드
	 */
	@Override
	public int reUpdateMemberTeam(int pno) {
		
		return pdao.reUpdateMemberTeam(pno, sqlSession);
	}



	/**
	 * 프로젝트 참여를 희망한 회원목록을 조회하는 메소드 
	 */
	@Override
	public ArrayList<Member> selectProjectTeamMateList(int pno) {
		
		return pdao.selectProjectTeamMateList(pno, sqlSession);
	}



	/**
	 * 프로젝트에 팀원 추가하는 메소드
	 */
	@Override
	public int enrollTeamMate(List<Integer>memNo) {
		
		return pdao.enrollTeamMate(memNo, sqlSession);
	}



	/**
	 * 팀원 해제하는 메소드
	 */
	@Override
	public int deleteTeamMate(List<Integer> memNo) {
		
		return pdao.deleteTeamMate(memNo, sqlSession);
	}


	/**
	 * mainpage top 4
	 */
	public ArrayList<Project> selectProjectTopList() {
		
		return pdao.selectProjectTopList(sqlSession);
	}








	







	
	
	
	
}
