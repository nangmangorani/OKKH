package com.kh.okkh.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.common.model.service.GithubService;
import com.kh.okkh.member.model.service.MemberServiceImpl;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.pr.model.service.PRService;
import com.kh.okkh.pr.model.service.PRServiceImpl;
import com.kh.okkh.pr.model.vo.PR;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private GithubService gService;
	
	@Autowired
	private PRServiceImpl pService;
	
	@GetMapping("callback")
	public String getUserInfo(@RequestParam String code, HttpSession session) {
		
//		 System.out.println(code);
		
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
	
	@RequestMapping("updateForm.me")
	public ModelAndView updatePage(ModelAndView mv) {
		ArrayList<Stack> list = mService.selectStackList();
		
		mv.addObject("list", list);
		mv.setViewName("member/updateMem");
		System.out.println(list);
		
		return mv;
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = mService.updateMember(m);
		System.out.println(m);
		
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

	@RequestMapping("myPr.me")
	public ModelAndView myPRList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = new PagiNation().getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<PR> list = mService.myPRList(pi);
		mv.addObject("list", list).addObject("pi", pi).setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
}
