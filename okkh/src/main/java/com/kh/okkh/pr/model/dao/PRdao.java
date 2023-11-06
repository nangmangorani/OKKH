package com.kh.okkh.pr.model.dao;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
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
	
	public int updatePR(PR pr, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("prMapper.updatePR", pr) ;
	}

	/**
	 * pr 삭제하는 메소드
	 */
	
	public int deletePR(int pno, SqlSessionTemplate sqlsession) {
		
		return sqlsession.update("prMapper.deletePR", pno);
	}
	
	
	public ArrayList<Reply> selectPrReplyList(int pno, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prMapper.selectPrReplyList", pno);
	}
	
	
	
	
	/** 
	 * pr에 댓글 작성하는 메소드
	 * @return
	 */
	public int insertReplyPR(Reply rep, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("prMapper.insertReplyPR", rep);
	}
	
	
	
	/**
	 * pr 댓글 삭제하는 메소드
	 * @param pno
	 * @param sqlSession
	 * @return
	 */
	public int deleteReplyPR(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("prMapper.deleteReplyPR", pno);
		
		
	}
	
	
	/**
	 * pr 상세조회할때 북마크도 조회하는 메소드
	 * @return
	 */
	public Bookmark selectPrBookmark(Bookmark b,SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("prMapper.selectPrBookmark", b);
		
	}
	
	
	
	
	/**\
	 * pr 해당 게시글의 북마크 개수 세는 메소드
	 * @return
	 */
	public int selectBookCount(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("prMapper.selectBookCount", pno);
		
	}
	
	
	
	/**\
	 * pr 해당 게시글에 사용자가 북마크를 했는지 여부 확인하는 메소드
	 * @return
	 */
	public int selectBookCountPersonal(Bookmark b,SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("prMapper.selectBookCountPersonal", b);
		
	}
	
	
	
	
	/**
	 * pr 북마크 삽입하는 메소드
	 * @return
	 */
	public int insertPrBookmark(Bookmark b,SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.insert("prMapper.insertPrBookmark", b);
	}
	
	
	
	/**
	 * pr 북마크 삭제하는 메소드
	 * @return
	 */
	public int deletePrBookmark(Bookmark b,SqlSessionTemplate sqlSession) {
		return sqlSession.delete("prMapper.deletePrBookmark", b);
	}



	public ArrayList<PR> selectPrTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("prMapper.selectPrTopList");
	}
	
	
	
	/**
	 * pr을 기술스택별로 조회하는 메소드
	 * @return
	 */
	public ArrayList<PR> selectStackPr(List<String> stack, SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("prMapper.selectStackPr", stack);
		
	}
	
	
	
	
	
	
	
	

}
