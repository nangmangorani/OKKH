package com.kh.okkh.pr.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.pr.model.service.PRServiceImpl;
import com.kh.okkh.pr.model.vo.PR;

@Controller
public class PrController {

	@Autowired
	private PRServiceImpl prService;
	
	
	
	/**
	 * left-sideBar에서 PR을 누르자마자 목록 조회하는 메소드 
	 * 페이징 처리하기 
	 */
	@RequestMapping("personalList.pr")
	public ModelAndView selectPRList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		
		// pr 게시글 개수
		int listCount = prService.selectListCount();
	
		
		PageInfo pi = new PagiNation().getPageInfo(listCount, currentPage, 5, 12);
		
		
		// 페이징 처리 된 목록이 뜸
		ArrayList<PR> list = prService.selectPRList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("pr/prList");
		
		
		return mv;
		
		
		
	}
	
	
	/**
	 * pr 작성하는 폼으로 쏘는 메소드
	 *  근데 폼으로 쏠때 기술 스택 조회해서 가야함 
	 * @return
	 */
	@RequestMapping("enrollPRFr.pr")
	public ModelAndView insertFormPR(ModelAndView mv) {
		
		ArrayList<Stack> list = prService.selectStackList();
		
		mv.addObject("list", list);
		mv.setViewName("pr/enrollPr");
		
		return mv;
		
		
		
	}
	
	
	
	@RequestMapping("enrollPr.pr")
	public String insertPR(PR pr,  HttpSession session, Model model) {
		
		
		System.out.println(pr); // 값 잘 넘어옴
		 int result = prService.insertPR(pr);
		
		 if(result>0) {
			 // 작성성공
			 // alert띄우고 다시 목록으로 url재요청하기 
			 session.setAttribute("alertMsg", "PR 작성을 성공했습니다.");
			 return "redirect:personalList.pr";
		 }else {
			 // 작성실패ㅠㅠ
			 // alert띄우기
			 model.addAttribute("errorMsg", "PR 작성을 실패했습니다.");
			 return "common/errorPage";
		 }
		
	}
	
	
	
	@RequestMapping("detailPr.pr")
	public ModelAndView selectDetailPR(int pno, ModelAndView mv) {
		
		// 조회수 증가
		int count = prService.increaseCount(pno);
		
		if(count>0) {
			// 조회수 증가 성공하면 찐 pr조회하러 가기
			PR pr = prService.selectDetailPR(pno);
			
			mv.addObject("pr", pr);
			mv.setViewName("pr/detailPr");
		}
		
		return mv;
		
		
		
	}
	
	
}
