package com.kh.okkh.pr.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.pr.model.vo.PR;

@Repository
public class PRdao {


	
	
	
	
	/**
	 * PR 누르자마자 전체조회하는 메소드 
	 */
	
	public ArrayList<PR> selectPRList(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("prMapper.selectPRList", null, rowBounds);
	}
	
	
	
	/**
	 * pr 작성폼으로 갈때 기술스택 리스트 조회하는 메소드
	 * @return
	 */
	public ArrayList<Stack> selectStackList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("prMapper.selectStackList");
		
	}
	
	
	
	
	/**
	 * pr 게시글 개수 구하는 메소드
	 */

	public int selectListCount(SqlSessionTemplate sqlSession){
		
		return sqlSession.selectOne("prMapper.selectListCount");
	}


	/**
	 * pr 상세조회시 먼저 조회수 증가시키는 메소드
	 */
	
	public int increaseCount(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("prMapper.increaseCount", pno);
	}

	/**
	 * 조회수 증가시키고 찐 상세조회하는 메소드
	 */
	
	public PR selectDetailPR(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("prMapper.selectDetailPR", pno);
	}

	/**
	 * pr 작성하는 메소드
	 */
	
	public int insertPR(PR pr, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("prMapper.insertPR", pr);
	}

	/**
	 * pr 수정하는 메소드
	 */
	
	public int updatePR(PR pr) {
		
		return 0;
	}

	/**
	 * pr 삭제하는 메소드
	 */
	
	public int deletePR(int pno) {
		
		return 0;
	}

}