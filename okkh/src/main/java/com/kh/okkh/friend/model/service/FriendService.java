package com.kh.okkh.friend.model.service;

import java.util.ArrayList;

import org.apache.ibatis.javassist.tools.framedump;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;


public interface FriendService {

	
	
	// 특정 회원의 친구 리스트 조회 (친구 상태 'Y')
	ArrayList<Friend> selectFriendList(int memNo, PageInfo pi);
	
	// 특정 회원의 친구 리스트 조회시에 페이징 처리
	// 특정 회원의 총 친구 리스트의 개수 구하는 메소드
	   int listCount(int memNo);
	
	 // 특정 회원에게 친구요청을 보내거나 하는 친구('Y')외에 회원들 조회하는 메소드
	   ArrayList<Friend> selectNoneFriendList(int memNo, PageInfo pi);
	   
	   // 회원 친구 목록 중에서 친구 상태가 '친구'가 아닌 회원의 개수
	   int noneFriendListCount(int memNo);
	   
	   
	   
	
	// 모든 사용자 조회 
	 //ArrayList<Member> selectMemberList(PageInfo pi);  // 페이징 처리 버전
	ArrayList<Member> selectMemberList(int memNo);   // 페이징 처리 안한 버전
	
	// 모든 사용자의 목록 개수 
	int allMemberListCount();
	
	// 친구 추가하기(요청?)
	int addFriend(Friend f);
	
	// 친구 요청 취소
	int cancleAddFriend(Friend f);
	
	// 친구 수락하기 (나의 상태 변경하기)
	int acceptFriend(Friend f);
	
	// 친구 수락받는 사람의 상태 변경하기 
	int acceptMyFriend(Friend f);
	
	
	// 친구 차단 (원래 친구였거나, 아님 친추왔다가 거절했는데 아예 차단하고 싶을 때 -> update하기)
	int blockOldFriend(Friend f);
	
	// 친구 차단 (친구가 아니였는데 차단하고 싶을 때 -> insert하기)
	int blockNoneFriend(Friend f);
	
	
	// 친구 차단 취소 
	int cancleBlockFriend(Friend f);
	
	// 친구 거절하기
	int refuseFriend(Friend f);
	
	// 친구 거절 취소하기
	int cancleRefuseFriend(Friend f);
	
	// 친구 삭제하기 (내꺼)
	int deleteFriend(Friend f);
	
	// 친구의 상태도 삭제하기 
	int deleteMyFriend(Friend f);
	
	
	// 친구 검색어로 조회하는 메소드 
	ArrayList<Member> searchMember(String search, int memNo);
	
	
	
	
	
}
