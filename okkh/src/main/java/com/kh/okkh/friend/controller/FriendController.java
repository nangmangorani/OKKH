package com.kh.okkh.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.template.PagiNation;
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
	
	@Autowired
	private HttpSession session;
	
	// 대부분 아작스다다다다아아앙아
	// 페이징 바 이상...ㅠㅠ
	
	
	/**
	 * leftSideBar에서 friends 누르자마자 실행되는 메소드 (페이징처리하기)
	 * 나의 친구 목록 조회하는 리스트 (요청중/친구/친구거절/차단 모두 보이게하기)
	 * 
	 * 조회 필요한 거 : 
	 *  1. 회원 친구 목록
	 *  2. 회원 친구 목록 중에서 친구 상태가 '친구'가 아닌 회원들 목록
	 *  3. 회원의 친구 목록 개수 (페이징 처리 위해서)
	 *  4. 전체 회원 리스트 개수 (페이징 처리 위해서) 
	 *  5. 전체 회원 리스트 조회
	 *  6. 회원 친구 목록 중에서 친구 상태가 '친구'가 아닌 회원의 개수
	 *  
	 */

	@RequestMapping("friendList.f")
	public ModelAndView selectFriendList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		//=================== 특정 회원의 친구 ==========================
		
			// 이건 특정 회원의 친구목록을 조회하는 메소드(전체 회원 조회 아님)
			int listCount = fservice.listCount(memNo);
			
			// 특정 회원의 친구 목록 페이징 처리 후에 리스트 구하기 
			PageInfo pi1 = new PagiNation().getPageInfo(listCount, currentPage, 5, 5);
			
			// 특정 회원의 친구 목록 조회 (친구 상태가 'Y')
			ArrayList<Friend> myBfList = fservice.selectFriendList(memNo, pi1);
			
			// 혹시 몰라서 친구 목록 조회한 거 세션에 담을 까...? -> 나중에 필요하면 담자!
		
			System.out.println(pi1 + "   : 이건 친구 누르자마자 페이징바 값1!!!!!!!!!!!!!!!!!");
		
	   //=================== 특정 회원의 친구가 아닌 리스트 조회 ==============
//			int noneBfListCount = fservice.noneFriendListCount(memNo);
//			PageInfo pi2 = new PagiNation().getPageInfo(noneBfListCount, currentPage, 5, 5);	
//			
//			ArrayList<Friend> noneBfList = fservice.selectNoneFriendList(memNo, pi2);
		 
		    
			System.out.println(myBfList + " 내 친구 목록오오오옹");
			
	
	   // 친구목록은 필요해서 세션에 담기
			session.setAttribute("myBfList", myBfList);
			
			//session.setAttribute("noneBfList", noneBfList);
		
			 mv.addObject("pi1", pi1).addObject("myBfList", myBfList).setViewName("friend/friend");
		
		return mv;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "selectMyFriend.fri", produces="application/json; charset=UTF-8")
	public String selectMyFriend(@RequestParam(value="cpage", defaultValue = "1") int currentPage,int memNo, HttpSession session) {
		
			//int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		//=================== 특정 회원의 친구 ==========================
		
			// 이건 특정 회원의 친구목록을 조회하는 메소드(전체 회원 조회 아님)
			int listCount = fservice.listCount(memNo);
			
			// 특정 회원의 친구 목록 페이징 처리 후에 리스트 구하기 
			PageInfo pi2 = new PagiNation().getPageInfo(listCount, currentPage, 5, 5);
			
			// 특정 회원의 친구 목록 조회 (친구 상태가 'Y')
			ArrayList<Friend> myBfList1 = fservice.selectFriendList(memNo, pi2);
			
			// 혹시 몰라서 친구 목록 조회한 거 세션에 담을 까...? -> 나중에 필요하면 담자!
		
				session.setAttribute("pi2", pi2);
				
			
			return new Gson().toJson(myBfList1);
		
		
	}
	
	
	
	
	/**.
	 * 모든 회원의 리스트 조회하는 메소드 -> 페이징 처리 안함 버전
	 * @param currentPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="allMemberList.fri", produces="application/json; charset=UTF-8")
	public String selectMemberList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,int memNo) {
		
		//==================== 전체 회원 조회 ============================
		int allMemberListCount = fservice.allMemberListCount();
		
		//PageInfo pi3 = new PagiNation().getPageInfo(allMemberListCount, currentPage, 3, 5);	
		
		//ArrayList<Member> allMemberList = fservice.selectMemberList(pi3);
		ArrayList<Member> allMemberList = fservice.selectMemberList(memNo);
		
		
		 System.out.println(allMemberList  +"    이건 컨트롤러에서 찍는 리스트이당");
		 
		 // 혹시 몰라서 세션에 태움
		 //session.setAttribute("allMemberList", allMemberList);
		 
		 
		 return new Gson().toJson(allMemberList);
		 
		 
		
	}
	
	
	
	/**
	 * 친구 추가하는 메소드
	 * @param bfTaker  : 친구 요청 보낼 사용자
	 * @param bfGiver  : 친구 요청보내는 사용자
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addFriend.fri")
	public String addFriend(int bfTaker, int bfGiver, HttpSession session) {
		
		// memNo는 내가 요청을 보낼 회원
		// login은 내 회원번호
		
		
		
		Friend f = new Friend();
		f.setBfTaker(bfTaker+"");
		f.setBfGiver(bfGiver+"");
		
		
		
		int result = fservice.addFriend(f);
		
		if(result>0) {
			session.setAttribute("alert", "친구 요청을 성공했습니다!");
		}
		
		return result>0 ? "success" : "fail";
		
	}
	
	
	
	
	/**
	 * 친구 수락하는 메소드
	 * (나의 상태도 변경하고, 수락받는 상대의 상태도 변경하기....?)
	 * @param bfTaker
	 * @param bfGiver
	 */
	@ResponseBody
	@RequestMapping("acceptFriend.fri")
	public String acceptFriend(int bfTaker, int bfGiver) {
		
		Friend f = new Friend();
		f.setBfGiver(bfGiver+"");
		f.setBfTaker(bfTaker+"");
		
		
		
		int result = fservice.acceptFriend(f);
		int result2 = 0;
		
		if(result>0) {
			
			result2 = fservice.acceptMyFriend(f);
			
		}
		
		
		return result * result2 >0 ? "success" : "fail";
		
		
	}
	
	
	/**
	 * 친구 삭제하는 메소드
	 * @param bfTaker
	 * @param bfGiver
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteFriend.fri")
	public String deleteFriend(int bfTaker, int bfGiver) {
	
		Friend f = new Friend();
		f.setBfGiver(bfGiver+"");
		f.setBfTaker(bfTaker+"");
		
		int result = fservice.deleteFriend(f);
		int result2 = 0;
		
		if(result>0) {
			result2 = fservice.deleteMyFriend(f);
		}
		
		return result * result2 > 0 ? "success" : "fail";
		
		
		
	}
	
	
	
	/**
	 * 친구 요청 취소하는 메소드
	 * @return
	 */
	@ResponseBody
	@RequestMapping("cancleAddFriend.fri")
	public String cancleAddFriend(int bfTaker, int bfGiver) {
		
		Friend f = new Friend();
		f.setBfGiver(bfGiver + "");
		f.setBfTaker(bfTaker + "");
		
		int result = fservice.cancleAddFriend(f);
		
		return result>0 ? "success" : "fail";
		
	}
	
	
	
	/**
	 * 친구 차단하는 메소드  (기존에 친구였거나, 친구요청이 왔는데 거절했다가 차단하고 싶을 때)
	 * @param bfTaker
	 * @param bfGiver
	 * @return
	 */
	@ResponseBody
	@RequestMapping("blockFriend.fri")
	public String blockFriend(int bfTaker, int bfGiver, String ISent, String FriSent,int userNo, HttpSession session) {
		
		
		Friend f = new Friend();
		f.setBfGiver(bfGiver + "");
		f.setBfTaker(bfTaker + "");
		
		
		 int result = 0;
				
		 System.out.println(ISent + " 내 상태!!!!!!!");
		 System.out.println(FriSent + "  친구 상태!!!!!!!!!");
		 
		  // 친구인데 차단할때	
		 if (userNo != 0 && ISent.equals("Y") && FriSent.equals("Y")) {
				 
			 result = fservice.blockOldFriend(f);
			 
		 }else if( userNo != 0 && ISent.equals("B") && FriSent.equals("A")){
			 // 친추왔다가 거절했는데 그냥 차단하고 싶을 때
			 result = fservice.blockOldFriend(f);
			
		}else {
			// 근데 만약 친구가 아닌데 그냥 차단하고 싶을 때는 insert하기 
			
			result = fservice.blockNoneFriend(f);
			
			
		}
		
		return result>0 ? "success" : "fail";
	}
	
	
	
	
	
	/**
	 * 친구 거절용 메소드
	 * @
	 * return
	 */
	@ResponseBody
	@RequestMapping("refuseFriend.fri")
	public String refuseFriend(int bfTaker, int bfGiver) {
		
		Friend f = new Friend();
		f.setBfGiver(bfGiver + "");
		f.setBfTaker(bfTaker + "");
		
		int result = fservice.refuseFriend(f);
		
		return result>0 ? "success" : "fail";
		
		
	}
	
	
	/**
	 * 친구 거절 취소하는 메소드 (아작스)
	 * @param bfGiver
	 * @param bfTaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping("cancleRefuseFriend.fri")
	public String cancleRefuseFriend(int bfGiver, int bfTaker) {
		
		Friend f = new Friend();
		f.setBfGiver(bfGiver + "");
		f.setBfTaker(bfTaker + "");
		
		int result = fservice.cancleRefuseFriend(f);
		
		return result>0 ? "success" : "fail";
		
	}
	
	
	/**
	 * 검색어로 친구 조회하는 메소드 (아작스)
	 * @param search
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "searchMember.fri", produces = "application/json; charset=UTF-8")
	public String searchMember(String search, HttpSession session) {
		
		//System.out.println(search + "   과연 내가 작성한 값이 넘어올지?????");  // 나이스~!
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		ArrayList<Member> list  = fservice.searchMember(search, memNo);
		
		return new Gson().toJson(list);
		
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="mainListFriend.fri", produces="application/json; charset=UTF-8")
	public String mainListFriend(int memNo) {
		
		ArrayList<Friend> list = fservice.mainListFriend(memNo);
		
		return new Gson().toJson(list);
	}
	
	
	
	
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

