package com.kh.okkh.project.model.service;

import java.util.ArrayList;

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
		
		//System.out.println(list + "   서비스단!!!!!!!!");
		
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



	@Override
	public int alarmProject(Notice n) {
		
		return 0;
	}







	







	
	
	
	
}
