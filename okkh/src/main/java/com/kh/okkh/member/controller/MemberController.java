package com.kh.okkh.member.controller;

import java.io.IOException;

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
        session.setAttribute("loginMember", m);
        
	    return "redirect:/";
	}
	
	// 메인페이지로
	@RequestMapping("main.p")
	public String nexusPage(HttpSession session, Model model) throws IOException {
		// 최근 접속한 repository 3개 select
		int userNo = ((Member)(session.getAttribute("loginUser"))).getMemNo();
		return "main";
	}
	
	// 로그인페이지로
	@RequestMapping("login.p")
	public String login() {
		return "member/login";
	}

	
	// 회원가입 페이지로 이동
	@RequestMapping("register.p")
	public String toRegister() {
		return "member/register";
	}
	
	// 아이디체크
	@RequestMapping(value="idCheck.me.p", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(Member m) {
		int checkCount = mService.idCheck(m.getMemId());
		return checkCount+"";
	}
	
	
	
	// 로그인
	@RequestMapping("login.ih")
	public String nexusLogin(Member m, HttpSession session,Model model) {
		Member loginUser = mService.selectMember(m);
		
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			return "redirect:main.p";
		}else {
			session.setAttribute("alertMsg", "아이디나 비밀번호가 일치하지 않습니다.");
			return "redirect:/";
		}
	}
	
	
	// 깃허브 연동 안되어있는 계정 토큰 직접입력 
	@RequestMapping(value="enrollToken", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String enrollToken(Member m, HttpSession session) {
		
		m.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
		
		int result = mService.enrollToken(m);
		
		if(result>0) {
			((Member)session.getAttribute("loginUser")).setMemToken(m.getMemToken());
			return "토큰 등록에 성공했습니다.";
		}else {
			return "토큰 등록에 실패했습니다. 다시 등록해주세요";
		}
		
	}
	
	
	
}
