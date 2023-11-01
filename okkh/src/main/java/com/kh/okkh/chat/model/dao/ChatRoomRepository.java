package com.kh.okkh.chat.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.kh.okkh.chat.model.vo.ChatRoom;

@Repository
public class ChatRoomRepository {
	private Map<String, ChatRoom> chatRoomMap;
	
	@PostConstruct
	private void init() {
		chatRoomMap = new LinkedHashMap<String, ChatRoom>();
	}
	
	public List<ChatRoom> findAllRoom() {
		List<ChatRoom> result = new ArrayList<>(chatRoomMap.values());
		Collections.reverse(result);
		return result;
	}
	
	 public ChatRoom findRoomById(String id){
        return chatRoomMap.get(id);
    }

    public ChatRoom createChatRoom(String name){
    	ChatRoom chatRoom = ChatRoom.create(name);
    	chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
        return chatRoom;
    }
}

