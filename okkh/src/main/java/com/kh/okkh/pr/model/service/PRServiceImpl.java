package com.kh.okkh.pr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.pr.model.dao.PRdao;
import com.kh.okkh.pr.model.vo.PR;


@Service
public class PRServiceImpl implements PRService{

	@Autowired
	private PRdao prdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * PR 누르자마자 전체조회하는 메소드 
	 */
	@Override
	public ArrayList<PR> selectPRList(PageInfo pi) {
		
		return prdao.selectPRList(pi, sqlSession);
	}

	
	
	
	
	
	
	/**
	 * pr 게시글 개수 구하는 메소드
	 */
	@Override
	public int selectListCount() {
		
		return prdao.selectListCount(sqlSession);
	}


	/**
	 * pr 상세조회시 먼저 조회수 증가시키는 메소드
	 */
	@Override
	public int increaseCount(int pno) {
		
		return prdao.increaseCount(pno, sqlSession);
	};

	/**
	 * 조회수 증가시키고 찐 상세조회하는 메소드
	 */
	@Override
	public PR selectDetailPR(int pno) {
		
		return prdao.selectDetailPR(pno, sqlSession);
	}

	
	/**
	 * pr 작성폼으로 갈 때 기술스택 조회하는 메소드
	 * @return
	 */
	public ArrayList<Stack> selectStackList(){
		return prdao.selectStackList(sqlSession);
	}
	
	
	
	/**
	 * pr 작성하는 메소드
	 */
	@Override
	public int insertPR(PR pr) {
		
		return prdao.insertPR(pr, sqlSession);
	}

	
	

	
	
	
	/**
	 * pr 수정하는 메소드
	 */
	@Override
	public int updatePR(PR pr) {
		
		return prdao.updatePR(pr, sqlSession);
	}

	/**
	 * pr 삭제하는 메소드
	 */
	@Override
	public int deletePR(int pno) {
		
		return prdao.deletePR(pno, sqlSession);
	}





	/**
	 * pr 상세페이지에 댓글 조회하는 메소드
	 */
	@Override
	public ArrayList<Reply> selectPrReplyList(int pno) {
		
		return prdao.selectPrReplyList(pno, sqlSession);
	}


	/**
	 * pr 상세페이지에 댓글 작성하는 메소드
	 */
	@Override
	public int insertReplyPR(Reply rep) {
		
		return prdao.insertReplyPR(rep, sqlSession);
	}







	/**
	 * pr 상세페이지에서 댓글 삭제하는 메소드
	 */
	@Override
	public int deleteReplyPR(int pno) {
		
		return prdao.deleteReplyPR(pno, sqlSession);
	}







	/**
	 * pr 상세조회할때 북마크도 조회하는 메소드
	 */
	@Override
	public Bookmark selectPrBookmark(Bookmark b) {
		
		return prdao.selectPrBookmark(b, sqlSession);
	}







	/**
	 * pr 북마크 개수 세는 메소드
	 */
	@Override
	public int selectBookCountPersonal(Bookmark b) {
		
		return prdao.selectBookCountPersonal(b, sqlSession);
	}


	/**
	 * pr 북마크 개수 세는 메소드
	 */
	@Override
	public int selectBookCount(int pno) {
		
		return prdao.selectBookCount(pno, sqlSession);
	}





	/**
	 * pr 북마크 삽입하는 메소드
	 */
	@Override
	public int insertPrBookmark(Bookmark b) {
		
		return prdao.insertPrBookmark(b, sqlSession);
	}







	/**
	 * pr 북마크 삭제하는 메소드
	 */
	@Override
	public int deletePrBookmark(Bookmark b) {
		
		return prdao.deletePrBookmark(b, sqlSession);
	}

	
	
	
	
	/**
	 * pr top 4
	 */
	@Override
	public ArrayList<PR> selectPrTopList() {
		
		return prdao.selectPrTopList(sqlSession);
	}











	
	

}
