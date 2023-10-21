package com.kh.okkh.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.project.model.vo.Project;


@Repository
public class ProjectDao {

	/**
	 * leftBar에서 recruit 누르자마자 프로젝트 전체조회하는 메소드
	 * @return
	 */
//	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession){
//		
//		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList");
//	}
	
	
	/**
	 * 프로젝터 전체 개수 구하는 메소드
	 * @param sqlSession
	 * @return
	 */
	public int selectProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.selectProjectListCount");
	}

	
	/**
	 * 프로젝트 전체 조회하는 메소드
	 * @return
	 */
	public ArrayList<Project> selectProjectList(PageInfo pi, SqlSessionTemplate sqlSession){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
		int limit = pi.getBoardLimit();
				
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList) sqlSession.selectList("projectMapper.selectProjectList", pi, rowBounds);
		
		
	}
	
	
	
	/**
	 * 프로젝트 조회수 증가시키는 메소드
	 * @return
	 */
	public int increaseCount( int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.increaseCount", pno);
	}
	
	
	
	
	/**
	 * 프로젝트 찐으로 상세조회하는 메소드
	 * @return
	 */
	public Project selectDetailPro(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("projectMapper.selectDetailPro", pno);
	}
	
	
	/**
	 * 프로젝트 모집 완료하는 메소드
	 * @return
	 */
	public int recruitDonePro(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.recruitDonePro", pno);
	}
	
	
	/** 프로젝트 재 모집하는 메소드
	 * @return
	 */
	public int recruitReplayPro(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.recruitReplayPro", pno);
	}
	
	
	
	
	/**
	 * 프로젝트 작성폼으로 가기전 기술스택 리스트 조회하는 메소드
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Stack> selectStackList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectStackList");
	}
	
	
	
	/**
	 * 찐으로 프로젝트 작성하는 메소드
	 * @return
	 */
	public int insertProject(Project p, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	
	
	/**
	 * 찐으로 프로젝트 수정하는 메소드
	 * @return
	 */
	public int updateProject(Project p, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.updateProject", p);
	}
	
	
	
	
	/**
	 * 프로젝트 삭제하는 메소드
	 * @return
	 */
	public int deleteProject(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.deleteProject", pno);
	}
	
	
	
	
	/**
	 * 댓글 작성하는 메소드
	 * @return
	 */
	public int insertReplyProject(Reply r, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("projectMapper.insertReplyProject", r);
		
	}
	
	
	
	/**
	 * 프로젝트 댓글 리스트 조회용 메소드
	 * @return
	 */
	public ArrayList<Reply> selectProjectReplyList(int pno,SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectReplyList", pno);
		
	}
	
	
	
	/**
	 * 프로젝트 댓글 삭제용 메소드
	 * @return
	 */
	public int deleteReplyProject(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.deleteReplyProject", pno);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
