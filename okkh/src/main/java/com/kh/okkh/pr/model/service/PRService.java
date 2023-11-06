package com.kh.okkh.pr.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.pr.model.vo.PR;
import com.kh.okkh.project.model.vo.Project;

public interface PRService {

	
	// 1. pr 전체 리스트 조회
		// 페이징 처리 위해서 전체 리스트 개수 구하는 곳
		int selectListCount();
		
		// 찐 전체조회	
		ArrayList<PR> selectPRList(PageInfo pi);
	
		
				
				// 4. 기술스택으로 조회 (기술스택 선택하면 선택한 값이 넘어옴)
				ArrayList<PR> selectStackPr(List<String> stack);
				
				// 5. 제목, 글 내용으로 조회 (조회하려는 키워드 넘어옴)
				ArrayList<PR> selectSearchBar(String search,PageInfo pi);
				
				// 6. 조회수 순으로 조회
				ArrayList<PR> selectPrCount(PageInfo pi);
		
	
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
		int insertReplyPR(Reply rep);
	
		
	// 7. pr 상세보기에서 댓글 조회하기 (ajax로) 
		ArrayList<Reply> selectPrReplyList(int pno);
	
	
	// 8. pr 상세보기에서 댓글 삭제하기 (ajax)
		int deleteReplyPR(int pno);
		
		
	// 북마크 관련 메소드들 
		
	// pr 상세조회할때 북마크도 같이 조회하는 메소드
	Bookmark selectPrBookmark(Bookmark b);
	
	// 사용자가 해당 게시물에 북마크 했는지 개수 조회하는 메소드
		int selectBookCountPersonal(Bookmark b);
		
	// 북마크 개수 조회
		int selectBookCount(int pno);
		
	// pr 북마크 삽입하는 메소드
		int insertPrBookmark(Bookmark b);
		
	// pr 북마크 삭제하는 메소드
		int deletePrBookmark(Bookmark b);

		
		// pr top 4
		ArrayList<PR> selectPrTopList();
		
		
		
		
}
