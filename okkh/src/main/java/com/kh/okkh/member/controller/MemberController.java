package com.kh.okkh.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.common.model.service.GithubService;
import com.kh.okkh.member.model.service.MemberServiceImpl;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.pr.model.service.PRServiceImpl;
import com.kh.okkh.pr.model.vo.PR;
import com.kh.okkh.project.model.vo.Project;

@Controller
public class MemberController {
	
	@Autowired
	private PRServiceImpl pService;
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private GithubService gService;
	
	
	private String token = "";
	
	@GetMapping("callback")
	public String getUserInfo(@RequestParam String code, HttpSession session) {
		
		// code를 통해 token 얻어오기
		String token = gService.getToken(code);
		
		System.out.println(token);
	    
		// access_token을 이용한 유저 정보 얻어오기
		Member githubInfo = gService.getUserInfo(token);
		
		// 우리 DB에 해당 유저 정보가 있는지 확인하기
        Member loginMember = mService.selectMember(githubInfo);
        System.out.println(loginMember);
        // 저장된 멤버가 없을 경우 DB에 추가
        if(loginMember == null) {
        	int result = mService.insertMember(githubInfo);
        	
        	if(result  > 0) {
        		loginMember = mService.selectMember(githubInfo);
        	}
        	
        }else {
        	loginMember = mService.selectMember(githubInfo);
        }
        
        session.setAttribute("token", token);				// api 활용에 필요한 access_token => session에 띄워서 어디서든 필요할 때 사용할 수 있게 설정
        session.setAttribute("git", githubInfo); 			// github에서 가져온 정보 => gitNick, profile, bio 사용
        session.setAttribute("loginMember", loginMember); 	// db에 쌓인 정보
        
        System.out.println(loginMember + "  : git에 들어있는 정보");
	    return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("myPage.me")
	public ModelAndView myPage(ModelAndView mv, HttpSession session) {
//		int listCount = pService.selectListCount();
//		
//		PageInfo pi = new PagiNation().getPageInfo(listCount, currentPage, 5, 12);
		Member m = (Member)session.getAttribute("loginMember");
		
		ArrayList<Project> pjList = mService.myPJList(m);
		ArrayList<PR> prList = mService.myPRList(m);
		
		mv.addObject("pjList", pjList).addObject("prList", prList).setViewName("member/myPage");
		System.out.println("프로젝트" + pjList);
		System.out.println("pr" + prList);
		
		return mv;
		
	}
	
	@RequestMapping("updateForm.me")
	public ModelAndView updatePage(ModelAndView mv) {
		ArrayList<Stack> list = mService.selectStackList();
		
		mv.addObject("list", list);
		mv.setViewName("member/updateMem");
		
		return mv;
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
	

	@RequestMapping("myPr.me")
	public ModelAndView myPRList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = new PagiNation().getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<PR> list = mService.myPRList(pi);
		mv.addObject("list", list).addObject("pi", pi).setViewName("member/myPage");
		return mv;
	}
	
}
