package com.kh.okkh.chat.model.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
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
	public ChatMember selectChatMember(int memNo) {
		return cDao.selectChatMember(sqlSession, memNo);
	}
	
	@Override
	public ArrayList<ChatRoom> selcetChatRoomList(Member m) {
		return cDao.selcetChatRoomList(sqlSession, m);
	}

	@Override
	public ArrayList<Friend> searchMemberList(Member m) {
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
	public ChatRoom selectChatRoom(int crno) {
		return cDao.selectChatRoom(sqlSession, crno);
	}

	@Override
	public ArrayList<ChatMember> selectChatMemberList(int crno) {
		return cDao.selectChatMemberList(sqlSession, crno);
	}
	
}
