package com.kh.okkh.chat.model.service;

import java.util.ArrayList;

import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

public interface ChatService {
	
	ChatMember selectChatMember(int memNo);
	
	ArrayList<ChatRoom> selcetChatRoomList(Member m);
	
	ArrayList<Friend> searchMemberList(Member m);
	
	int insertChatRoom(ChatRoom chRoom);
	
	int insertChatMaker(Member m);
	
	int insertChatMember(Member m);

	ChatRoom selectChatRoom(int crno);
	
	ArrayList<ChatMember> selectChatMemberList(int crno);
	
}