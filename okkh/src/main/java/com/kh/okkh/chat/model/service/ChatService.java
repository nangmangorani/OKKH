package com.kh.okkh.chat.model.service;

import java.util.ArrayList;

import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

public interface ChatService {
	
	ChatMember selectChatMember(Member m);
	
	ArrayList<ChatRoom> selcetChatRoomList(ChatMember chMem);
	
	ArrayList<Friend> searchMember(Member m);
	
	int insertChatRoom(ChatRoom chRoom);
	
	int insertChatMaker(Member m);
	
	int insertChatMember(Member m);

	ChatRoom selectChatRoomRno(int rno);
	
}
