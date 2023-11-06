package com.kh.okkh.friend.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.javassist.tools.framedump;
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
	 * 전체 회원 조회하는 메소드 -> 페이징 처리
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
	 * 전체 회원 조회하는 메소드 -> 페이징 처리 안함 
	 * @return
	 */
	public ArrayList<Member> selectMemberList(int memNo,SqlSessionTemplate sqlsession){
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectMemberList",memNo);
	}
	
	
	
	
	/**
	 * 친구 요청(추가)하는 메소드
	 * @return
	 */
	public int addFriend(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.insert("friendMapper.addFriend", f);
		
		
	}
	
	
	/**
	 *  친구 요청 취소하는 메소드
	 * @return
	 */
	public int cancleAddFriend(Friend f,SqlSessionTemplate sqlsession) {
		return sqlsession.delete("friendMapper.deleteFriend", f);
	}
	
	
	
	
	/**
	 * 친구 추가 수락하는 메소드(나의 상태 변경)
	 * @return
	 */
	public int acceptFriend(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.insert("friendMapper.acceptFriend", f);
		
	}
	
	
	/**
	 * 친구 수락받는 사람의 상태도 변경하기
	 * @return
	 */
	public int acceptMyFriend(Friend f,SqlSessionTemplate  sqlsession) {
		return sqlsession.update("friendMapper.acceptMyFriend", f);
	}
	
	
	
	/**
	 * 내꺼의 친구 상태를 삭제
	 * @return
	 */
	public int deleteFriend(Friend f,SqlSessionTemplate sqlsession) {
		return sqlsession.delete("friendMapper.deleteFriend", f);
	}
	
	
	/**
	 * 친구의 상태를 삭제
	 * @return
	 */
	public int deleteMyFriend(Friend f,SqlSessionTemplate sqlsession) {
		return sqlsession.delete("friendMapper.deleteMyFriend", f);
				
	}
	
	
	
	
	/**
	 * 친구 차단하는 메소드 (기존에 친구였거나, 친구요청이 왔는데 거절했다가 차단하고 싶을 때) -> update하기
	 * @return
	 */
	public int blockOldFriend(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.update("friendMapper.blockOldFriend", f);
				
	}
	
	
	/**
	 * 친구 아닌데 그냥 차단하고 싶을 때 -> insert하기
	 * @return
	 */
	public int blockNoneFriend(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.insert("friendMapper.blockNoneFriend", f);
	}
	
	
	
	/**
	 * 친구 거절하는 메소드
	 * @return
	 */
	public int refuseFriend(Friend f,SqlSessionTemplate sqlsession) {
		return sqlsession.insert("friendMapper.refuseFriend", f);
	}
	
	
	/**
	 * 친구 거절 취소용 메소드 (내꺼)
	 * @return
	 */
	public int cancleRefuseFriend(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.delete("friendMapper.cancleRefuseFriend", f);
		
	}
	

	/**
	 * 친구 거절 취소용 메소드 (친구꺼)
	 * @return
	 */
	public int cancleRefuseFriend2(Friend f,SqlSessionTemplate sqlsession) {
		
		return sqlsession.delete("friendMapper.cancleRefuseFriend2", f);
		
	}
	
	
	/**
	 * 검색어로 친구 검색하는 메소드
	 * @return
	 */
	public ArrayList<Member> searchMember(String search, int memNo,SqlSessionTemplate sqlsession){
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("memNo", memNo + "");
		
		return (ArrayList)sqlsession.selectList("friendMapper.searchMember", map);
		
	}



	public ArrayList<Friend> mainListFriend(SqlSessionTemplate sqlsession, int memNo) {
		return (ArrayList)sqlsession.selectList("friendMapper.mainListFriend", memNo);
	}
	
	
	
	
}
