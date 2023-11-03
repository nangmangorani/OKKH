package com.kh.okkh.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.friend.model.dao.FriendDao;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao fdao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
	
	/**
	 * 나의 모든 친구 조회하는 메소드
	 */
	@Override
	public ArrayList<Friend> selectFriendList(int memNo, PageInfo pi) {
		
		return fdao.selectFriendList(memNo,pi, sqlsession);
	}

	
	/**
	 * 특정 회원의 총 친구 리스트 개수를 세는 메소드
	 */
	@Override
	public int listCount(int memNo) {
		
		return fdao.listCount(memNo, sqlsession);
	}


	/**
	 * 특정 회원의 친구 목록 중 친구가 아닌 사람들 목록 조회
	 */
	@Override
	public ArrayList<Friend> selectNoneFriendList(int memNo, PageInfo pi) {
		
		return fdao.selectNoneFriendList(memNo,pi, sqlsession);
	}


	/**
	 * 특정 회원의 친구 목록 중 친구가 아닌 사람들 목록 개수
	 */
	@Override
	public int noneFriendListCount(int memNo) {
		
		return fdao.noneFriendListCount(memNo, sqlsession);
	}


	/**
	 * 모든 회원 조회 -> 페이징 처리 함
	 */
	/*
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		
		return fdao.selectMemberList(pi, sqlsession);
	}
	*/
	
	/**\
	 *  모든 회원 조회인데 페이징 처리 안함
	 * @return
	 */
	@Override
	public ArrayList<Member> selectMemberList(int memNo) {
		
		return fdao.selectMemberList( memNo,sqlsession);
	}


	/**
	 * 모든 회원의 리스트 개수
	 */
	@Override
	public int allMemberListCount() {
		
		return fdao.allMemberListCount(sqlsession);
	}


	


	/**
	 * 친구 추가(요청)하는 메소드
	 */
	@Override
	public int addFriend(Friend f) {
		
		return fdao.addFriend(f, sqlsession);
	}


	/** 
	 * 친구 요청 취소
	 */
	@Override
	public int cancleAddFriend(Friend f) {
		
		return fdao.cancleAddFriend(f, sqlsession);
	}


	/**
	 * 친구 수락하는 메소드(나의 상태 변경)
	 */
	@Override
	public int acceptFriend(Friend f) {
		
		return fdao.acceptFriend(f, sqlsession);
	}


	/**
	 * 친구 수락받는 친구의 상태도 변경하기
	 */
	@Override
	public int acceptMyFriend(Friend f) {
		
		return fdao.acceptMyFriend(f, sqlsession);
		
	}
	
	
	
	
	
	/**
	 * 친구 차단  (기존에 친구였거나, 친구요청이 왔는데 거절했다가 차단하고 싶을 때)
	 */
	@Override
	public int blockOldFriend(Friend f) {
		
		return fdao.blockOldFriend(f, sqlsession);
	}



	/**
	 * 친구 차단  (친구가 아닌데 걍 차단하고싶을 때)
	 */
	@Override
	public int blockNoneFriend(Friend f) {
		
		return fdao.blockNoneFriend(f, sqlsession);
	}


	
	
	
	/**
	 * 친구 차단 취소
	 */
	@Override
	public int cancleBlockFriend(Friend f) {
		
		return 0;
	}


	/**
	 * 친구 요청 거절
	 */
	@Override
	public int refuseFriend(Friend f) {
		
		return fdao.refuseFriend(f, sqlsession);
	}


	/**
	 * 친구 요청 거절 취소
	 */
	@Override
	public int cancleRefuseFriend(Friend f) {
		
		return fdao.cancleRefuseFriend(f, sqlsession);
	}


	/** 
	 * 친구 삭제 (내꺼를 삭제)
	 */
	@Override
	public int deleteFriend(Friend f) {
		
		return fdao.deleteFriend(f, sqlsession);
	}


	/**
	 * 친구꺼 삭제
	 */
	@Override
	public int deleteMyFriend(Friend f) {
		
		return fdao.deleteMyFriend(f, sqlsession);
	}


	/**
	 * 검색어로 친구 검색하는 메소드
	 */
	@Override
	public ArrayList<Member> searchMember(String search, int memNo) {
		
		return fdao.searchMember(search, memNo, sqlsession);
	}
	
	
	@Override
	public ArrayList<Friend> mainListFriend(int memNo){
		return fdao.mainListFriend(sqlsession, memNo);
	}
	
	
	
}
