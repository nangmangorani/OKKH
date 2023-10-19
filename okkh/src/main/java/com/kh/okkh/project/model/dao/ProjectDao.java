package com.kh.okkh.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.PageInfo;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
