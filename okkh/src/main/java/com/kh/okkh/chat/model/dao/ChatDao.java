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

	public ChatMember selectChatMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("chatMapper.selectChatMemberList", memNo);
	}
	public ArrayList<ChatRoom> selcetChatRoomList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("chatMapper.selcetChatRoomList", m);
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
	
	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, int crno) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", crno);
	}
	
	public ArrayList<ChatMember> selectChatMemberList(SqlSessionTemplate sqlSession, int crno) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMemberList", crno);
	}

}
