package com.kh.okkh.friend.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.friend.model.vo.Friend;

@Repository
public class FriendDao {

	
	/** 나의 모든 친구 목록 조회하는 메소드
	 * @return
	 */
	public ArrayList<Friend> selectFriendList(int memNo,  SqlSessionTemplate sqlsession){
		
		return (ArrayList)sqlsession.selectList("friendMapper.selectFriendList", memNo);
		
	}
	
	
	
	
	
	
	
}
