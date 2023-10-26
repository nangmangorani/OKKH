package com.kh.okkh.friend.model.service;

import java.util.ArrayList;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

public interface FriendService {

	
	
	// 특정 회원의 친구 리스트 조회 (친구 상태 'Y')
	ArrayList<Friend> selectMyFriendList(int memNo, PageInfo pi);
	
	// 특정 회원의 친구 리스트 조회시에 페이징 처리
	// 특정 회원의 총 친구 리스트의 개수 구하는 메소드
	   int listCount(int memNo);
	
	 // 특정 회원에게 친구요청을 보내거나 하는 친구('Y')외에 회원들 조회하는 메소드
	   ArrayList<Friend> selectNoneFriendList(int memNo, PageInfo pi);
	   
	   // 회원 친구 목록 중에서 친구 상태가 '친구'가 아닌 회원의 개수
	   int noneFriendListCount(int memNo);
	   
	   
	   
	
	// 모든 사용자 조회 (근데 이건 teamList session에다가 담은 듯..?)
	 //ArrayList<Member> selectMemberList(PageInfo pi);
	 ArrayList<Member> selectMemberList();
	
	// 모든 사용자의 목록 개수 
	int allMemberListCount();
	
	// 친구 추가하기(요청?)
	int insertFriend(Friend f);
	
	// 친구 거절하기

	
	// 친구 차단하기 
	
	
	
	
}
