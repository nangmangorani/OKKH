package com.kh.okkh.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ArrayList<Friend> selectFriendList(int memNo) {
		
		return fdao.selectFriendList(memNo, sqlsession);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		
		return null;
	}

	@Override
	public int insertFriend(Friend f) {
		
		return 0;
	}
	
}
