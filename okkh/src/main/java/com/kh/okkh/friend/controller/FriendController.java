package com.kh.okkh.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.okkh.friend.model.service.FriendServiceImpl;
import com.kh.okkh.friend.model.vo.Friend;
import com.kh.okkh.member.model.vo.Member;

/**
 * @author 유정(호빵)
 *
 */
@Controller
public class FriendController {
   
	@Autowired
	private FriendServiceImpl fservice;
	
	
	/**
	 * leftSideBar에서 friends 누르자마자 실행되는 메소드
	 * 나의 친구 목록 조회하는 리스트 (요청중/친구/친구거절/차단 모두 보이게하기)
	 */
	@RequestMapping("friendList.f")
	public ModelAndView selectFriendList(HttpSession session, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		ArrayList<Friend> flist = fservice.selectFriendList(memNo);
		
		// 혹시 몰라서 친구 목록 조회한 거 세션에 담을 까...? -> 나중에 필요하면 담자!
		
		mv.addObject("flist", flist).setViewName("friend/friend");
		
		return mv;
		
		
	}
	
	
}
