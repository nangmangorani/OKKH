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
	public ArrayList<Friend> selectMyFriendList(int memNo, PageInfo pi) {
		
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
	public int cancleAddFriend(int memNo) {
		
		return 0;
	}


	/**
	 * 친구 수락하는 메소드
	 */
	@Override
	public int acceptFriend(int memNo) {
		
		return 0;
	}


	/**
	 * 친구 차단
	 */
	@Override
	public int blockFriend(int memNo) {
		
		return 0;
	}


	/**
	 * 친구 차단 취소
	 */
	@Override
	public int cancleBlockFriend(int memNo) {
		
		return 0;
	}


	/**
	 * 친구 요청 거절
	 */
	@Override
	public int refuseFriend(int memNo) {
		
		return 0;
	}


	/**
	 * 친구 요청 거절 취소
	 */
	@Override
	public int cancleRefuseFriend(int memNo) {
		
		return 0;
	}


	/** 
	 * 친구 삭제
	 */
	@Override
	public int deleteFriend(int memNo) {
		
		return 0;
	}
	
	
	
	
	
}
