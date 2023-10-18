package com.kh.okkh.pr.model.service;

import java.util.ArrayList;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.pr.model.vo.PR;

public interface PRService {

	
	// 1. pr 전체 리스트 조회
		// 페이징 처리 위해서 전체 리스트 개수 구하는 곳
		int selectListCount();
		
	// 찐 전체조회	
	ArrayList<PR> selectPRList(PageInfo pi);
	
	
	// 2. pr 상세조회
		// 조회수 증가 -> pr번호 넘어옴
		int increaseCount(int pno);
		// 찐 상세조회하기 
		PR selectDetailPR(int pno);
	
	// 3. pr 작성하기 -> 사용자가 작성한 내용 넘어옴
		// 작성폼으로 갈때 기술스택 같이 조회해서가는 메소드
		ArrayList<Stack> selectStackList();
		
		// 찐 작성하는 메소드
		int insertPR(PR pr);
	
	// 4. pr 수정하기 -> 사용자가 작성한 수정 내용 넘어옴
		
			// 상세페이지에서 수정을 누르면 일단 수정 폼으로 쏴야하는데, 수정 폼 갈때 위에 
			// PR selectDetailPR 랑,  selectStackList 이거 이용해서 상세pr값이랑 기술스택 리스트 조회해서
			// 가져가기
		
		// 찐 수정하는 메소드
		int updatePR(PR pr);
	
		
	// 5. pr 삭제하기 
		int deletePR(int pno);
	
	
		
	// 6. pr 상세페이지에서 	댓글 작성(ajax로)
		
	
		
	// 7. pr 상세보기에서 댓글 조회하기 (ajax로) 
		
	
	
}
