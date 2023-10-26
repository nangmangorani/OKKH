package com.kh.okkh.friend.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Repository
public class FriendDao {

	
	/** 나의 모든 친구 목록 조회하는 메소드
	 * @return
	 */
	/**
	 * @return
	 */
	public ArrayList<Friend> selectFriendList(int memNo, PageInfo pi, SqlSessionTemplate sqlsession){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
	    int limit = pi.getBoardLimit();
		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectFriendList", memNo, rowBounds);
		
	}
	
	
	
	/**
	 * 특정 회원의 총 친구 리스트 개수를 세는 메소드
	 * @return
	 */
	public int listCount(int memNo , SqlSessionTemplate sqlsession) {
		
		return sqlsession.selectOne("friendMapper.listCount", memNo);
	}
	
	
	
	/**
	 *  특정 회원의 친구 아님 목록 개수
	 * @return
	 */
	public int noneFriendListCount(int memNo,SqlSessionTemplate sqlsession) {
		
		return sqlsession.selectOne("friendMapper.noneFriendListCount", memNo);
		
	}
	
	
	/**
	 * 특정 회원의 친구 아님 목록 조회
	 * @param memNo
	 * @param pi
	 * @param sqlsession
	 * @return
	 */
	public ArrayList<Friend> selectNoneFriendList(int memNo,PageInfo pi, SqlSessionTemplate sqlsession){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
	    int limit = pi.getBoardLimit();
		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectNoneFriendList", memNo, rowBounds);
		
		
	}
	
	
	
	/**
	 * 전체 회원의 목록 개수
	 * @return
	 */
	public int allMemberListCount(SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("friendMapper.allMemberListCount");
	}
	
	
	
	/**
	 * 전체 회원 조회하는 메소드
	 * @return
	 */
	/*
	public ArrayList<Member> selectMemberList(PageInfo pi,SqlSessionTemplate sqlsession){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
	    int limit = pi.getBoardLimit();
		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectMemberList", null, rowBounds);
	}
	
	*/
	
	/**
	 * 전체 회원 조회하는 메소드
	 * @return
	 */
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlsession){
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
//	    int limit = pi.getBoardLimit();
		
		
		//RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectMemberList");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
