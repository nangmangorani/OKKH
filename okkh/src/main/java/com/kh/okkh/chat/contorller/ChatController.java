package com.kh.okkh.chat.contorller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.okkh.chat.model.service.ChatServiceImpl;
import com.kh.okkh.chat.model.vo.ChatMember;
import com.kh.okkh.chat.model.vo.ChatRoom;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl cService;
	
	@RequestMapping("chat.ch")
	public ModelAndView chatPage(HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginMember");
		ChatMember chMem = cService.selectChatMember(m);
		ArrayList<ChatRoom> crList = cService.selectChatRoom(chMem);
		ArrayList<Friend> flist = cService.searchMember(m);
		System.out.println("crlist : " + crList);
		System.out.println("flist : " + flist);
		mv.addObject("crList", crList).addObject("flist",flist).setViewName("chat/chat");
		return mv;
	}
	
	@RequestMapping("enrollChat.ch")
	public String insertChatRoom(ChatRoom chRoom, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginMember");
		
		int result1 = cService.insertChatRoom(chRoom);
		int result2 = cService.insertChatMaker(m);
		int result3 = cService.insertChatMember(m);
		
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 채팅방이 개설되었습니다.");
			return "redirect:chat.ch";
		} else {
			model.addAttribute("errorMsg", "채팅방 개설을 실패했습니다.");
			return "common/errorPage";
		}
	}
	
}
