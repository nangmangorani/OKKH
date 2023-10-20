package com.kh.okkh.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.okkh.member.model.service.GithubService;
import com.kh.okkh.member.model.service.MemberServiceImpl;
import com.kh.okkh.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private GithubService gService;
	
	private String token = "";
	
	@GetMapping("callback")
	public String getUserInfo(@RequestParam String code, HttpSession session) {
		// code를 통해 token 얻어오기
		String token = gService.getToken(code);
	    
		System.out.println("난 멤컨 토큰 ㅌㅋㅌ" + token);
		// access_token을 이용한 유저 정보 얻어오기
		Member mToken = gService.getUserInfo(token);
		// id, 아바타, 닉넴, 토큰
        Member m = mService.selectMember(mToken);
        
        // 저장된 멤버가 없을 경우 DB에 추가
        if(m == null) {
        	int result = mService.insertMember(mToken);
        	m = mService.selectMember(mToken);
        }else {
        	m = mService.selectMember(mToken);
        }
        
        session.setAttribute("git", mToken); // github에서 가져온 정보 => gitNick, profile, bio 사용
        session.setAttribute("loginMember", m); // db에 쌓인 정보
        
	    return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		int result = mService.updateMember(m);
		
		if(result > 0) {
			Member updateMem = mService.selectMember(m);
			m.setBio(updateMem.getMemIntro());
			
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정하였습니다.");
			
			return "redirect:myPage.me";
			
		} else {
			model.addAttribute("errorMsg", "회원정보 수정 실패");
			return "common/errorPage";
		}
	}
	
}
