package com.kh.okkh.pr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.common.model.vo.PageInfo;
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
		
		return 0;
	}

	/**
	 * pr 삭제하는 메소드
	 */
	@Override
	public int deletePR(int pno) {
		
		return 0;
	}

	

}
