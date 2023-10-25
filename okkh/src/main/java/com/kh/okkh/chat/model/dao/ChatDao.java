package com.kh.okkh.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Repository
public class ChatDao {
	
	public ChatMember selectChatMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("chatMapper.selectChatMember", m);
	}
	
	public ArrayList<ChatRoom> selcetChatRoomList(SqlSessionTemplate sqlSession, ChatMember chMem) {
		return (ArrayList)sqlSession.selectList("chatMapper.selcetChatRoomList", chMem);
	}

	public ArrayList<Friend> searchMember(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("chatMapper.searchMember", m);
	}
	
	public int insertChatRoom(SqlSessionTemplate sqlSession, ChatRoom chRoom) {
		return sqlSession.insert("chatMapper.insertChatRoom", chRoom);
	}

	public int insertChatMaker(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("chatMapper.insertChatMaker", m);
	}
	
	public int insertChatMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("chatMapper.insertChatMember", m);
	}
	
	public ChatRoom selectChatRoomRno(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("chatMapper.selectChatRoomRno", rno);
	}


}
