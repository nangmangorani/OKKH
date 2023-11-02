package com.kh.okkh.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.kh.okkh.chat.model.service.ChatServiceImpl;
import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Controller
public class ChatController {
		
	@Autowired
	private ChatServiceImpl cService;
	
	@RequestMapping("chat")
	public ModelAndView chatPage(ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginMember");
		
		ArrayList<ChatRoom> crList = cService.selcetChatRoomList(m);
		ArrayList<Friend> frList = cService.searchMemberList(m);
		
		mv.addObject("crList", crList).addObject("frList",frList).setViewName("chat/rooms");
		
		return mv;
	}
	
	@RequestMapping("room.ch")
	public ModelAndView chatRoomPage(int crno, ModelAndView mv, HttpSession session) {
		
		ChatRoom cr = cService.selectChatRoom(crno);
		ArrayList<ChatMember> cmList = cService.selectChatMemberList(crno);
		System.out.println(cmList);
		mv.addObject("cr", cr).addObject("cmList", cmList).setViewName("chat/room");
		
		return mv;
	}
	
	
	@RequestMapping("createChat.ch")
	public String insertChatRoom(ChatRoom chRoom, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginMember");
		
		int result1 = cService.insertChatRoom(chRoom);
		int result2 = cService.insertChatMaker(m);
		int result3 = cService.insertChatMember(m);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			session.setAttribute("alertMsg", "성공적으로 채팅방이 개설되었습니다.");
			return "redirect:chat";
		} else {
			model.addAttribute("errorMsg", "채팅방 개설을 실패했습니다.");
			return "common/errorPage";
		}
	}
	
}