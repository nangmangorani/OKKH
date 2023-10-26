package com.kh.okkh.friend.model.service;

import java.util.ArrayList;

import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

public interface FriendService {

	
	
	// 친구 리스트 조회
	ArrayList<Friend> selectFriendList(int memNo);
	
	
	// 모든 사용자 조회 (근데 이건 teamList session에다가 담은 듯..?)
	ArrayList<Member> selectMemberList();
	
	// 친구 추가하기(요청?)
	int insertFriend(Friend f);
	
	// 친구 거절하기

	
	// 친구 차단하기 
	
	
	
	
}
