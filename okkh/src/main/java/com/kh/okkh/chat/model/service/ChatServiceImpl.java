package com.kh.okkh.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.okkh.chat.model.dao.ChatDao;
import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;
	
	@Override
	public ChatMember selectChatMember(Member m) {
		return cDao.selectChatMember(sqlSession, m);
	}
	
	@Override
	public ArrayList<ChatRoom> selcetChatRoomList(ChatMember chMem) {
		return cDao.selcetChatRoomList(sqlSession, chMem);
	}

	@Override
	public ArrayList<Friend> searchMember(Member m) {
		return cDao.searchMember(sqlSession, m);
	}
	
	@Override
	public int insertChatRoom(ChatRoom chRoom) {
		return cDao.insertChatRoom(sqlSession, chRoom);
	}
	
	@Override
	public int insertChatMaker(Member m) {
		return cDao.insertChatMaker(sqlSession,m);
	}
	
	@Override
	public int insertChatMember(Member m) {
		return cDao.insertChatMember(sqlSession,m);
	}

	@Override
	public ChatRoom selectChatRoomRno(int rno) {
		return cDao.selectChatRoomRno(sqlSession, rno);
	}
	
	

}
