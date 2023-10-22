package com.kh.okkh.project.controller;

import java.awt.print.Book;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.common.template.PagiNation;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.project.model.service.ProjectServiceImpl;
import com.kh.okkh.project.model.vo.Project;

@Controller
public class ProjectController {

	@Autowired
	private ProjectServiceImpl pservice;
	
	
	/**
	 * leftBar에서 Recruit 누르자마자 일단 전체 프로젝트list 조회하는 메소드
	 */
	@RequestMapping("recruitList.pro")
	public ModelAndView selectProjectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		

		// 프로젝트 전체 조회리스트로 갈 때 
		// 1. 페이징 처리하기 
		// 2. 기술스택 조회하기 (프로젝트 목록에 사용하는 기술스택을 이미지로 보여줘야해서 조회해야함)
		// 3. 프로젝트 리스트도 조회하기 

		

		
		//  페이징 처리 위해서 전체 프로젝트 개수 구해오기 
		int listCount = pservice.selectProjectListCount();
		
		// 페이징 처리
		PageInfo pi = new PagiNation().getPageInfo(listCount, currentPage, 5, 12);
		
		// 페이징 처리 후 찐 프로젝트 조회하러 가기 
		ArrayList<Project> list = pservice.selectProjectList(pi);
		
		
		
		
		

		mv.addObject("list", list);
		mv.setViewName("project/projectList");
		
		return mv;
		
		
	}
	
	
	
	/**
	 * 프로젝트 상세조회 전에 조회수 증가시키고 찐으로 상세내용 조회하는 메소드 
	 * @param pno
	 */
	@ResponseBody
	@RequestMapping("selectDetailPro.pro")
	public ModelAndView selectDetailPro(int pno, ModelAndView mv, HttpSession session){
		
		
		// 먼저 조회수부터 증가시키고 오기
		int result = pservice.increaseCount(pno);
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		Bookmark b = new Bookmark(memNo, pno);
		
		
	
		
		if(result>0) {
			
			System.out.println(result + "      result 결과!!");
			// 조회수 증가 성공했으면 찐으로 상세 조회하러 가기
			Project pro = pservice.selectDetailPro(pno);
			
			
			Bookmark book = pservice.selectProBookmark(b);
			
			int count = pservice.selectBookCount(pno);
			
			
			System.out.println( pno + " 게시글 번호닷" + book + "  book이당");
			
			
			// System.out.println(pro + "    컨트롤러 pro");
			mv.addObject("count", count);
			mv.addObject("book", book);
			//mv.addObject("bookmarkCount", bookmarkCount);
			mv.addObject("pro", pro);
			mv.setViewName("project/detailProject");
			
			
		}else {
			// 조회수 증가 실패하면.... 에러메시지 띄우기 
			
			
			
			mv.addObject("errorMsg", "프로젝트 조회수 증가를 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
		
		
	}
	
	
	/**
	 * 프로젝트 작성폼으로 이동할 때 기술스택을 먼저 조회하고 작성폼으로 이동
	 * @return
	 */

	@RequestMapping("insertProjectForm.pro")
	public String insertProForm(Model model) {
		
		// 기술 스택 조회하는 메소드
		ArrayList<Stack> list = pservice.selectStackList();
		
		model.addAttribute("list", list);
		
		return "project/enrollProject";
		
		
 		
	}
	
	
	
	/**
	 * 찐으로 프로젝트 작성하는 메소드
	 * @param p
	 */
	@RequestMapping("insertProject.pro")
	public String insertProject(Project p, HttpSession session, Model model) {
		
		int result = pservice.insertProject(p);
		
		if(result>0) {
			// 프로젝트 작성 성공하면 
			// alert 띄우고 목록으로 가기 
			session.setAttribute("alertMsg", "프로젝트 작성을 성공했습니다.");
			return "redirect:recruitList.pro";
			
		}else {
			// 실패 에러메시지
			
			model.addAttribute("errorMsg", "프로젝트 작성 실패ㅠㅠ");
			return "common/errorPage";
			
		}
		
	}
	
	
	/**
	 * 프로젝트 모집작성자가 프로젝트 모집 완료하는 메소드
	 * @param pno
	 * @param session
	 * @return
	 */
	@RequestMapping("recruitDone.pro")
	public String recruitDonePro(int pno, HttpSession session) {
		
		int result = pservice.recruitDonePro(pno);
		
		if(result>0) {
			// 모집완료 성공하면 alert 띄우고 다시 상세페이지로 돌아가기 
			
			session.setAttribute("alertMsg", "모집완료를 성공했습니다.");
			
		}else {
			// 모집완료 실패하면 alert 띄우고 다시 상세페이지로 
			session.setAttribute("alertMsg", "모집완료를 실패했습니다ㅠㅠ");
		}
		
		return "redirect:selectDetailPro.pro?pno="+ pno;
	}
	
	
	
	/**
	 * 프로젝트 재모집하는 메소드
	 * @param pno
	 * @return
	 */
	@RequestMapping("recruitReturn.pro")
	public String recruitReplayPro(int pno, HttpSession session) {
		 
		int result = pservice.recruitReplayPro(pno);
		
		if(result>0) {
			// 재모집 성공하면 alert띄우고 다시 상세페이지로 
			
			session.setAttribute("alertMsg", "프로젝트 재 모집을 성공했습니다.");
			
			
		}else {
			// 실패해도 동일 
			session.setAttribute("alertMsg", "프로젝트 재 모집을 실패했습니다.");
		}
		
		return "redirect:selectDetailPro.pro?pno="+ pno;
		
	}
	
	
	/**
	 * 프로젝트 삭제하는 메소드
	 * @param pno
	 */
	@RequestMapping("deleteProject.pro")
	public String deleteProject(int pno,HttpSession session) {
		
		int result = pservice.deleteProject(pno);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "프로젝트 삭제를 성공했습니다.");
			return "redirect:recruitList.pro";
			
		}else {
			session.setAttribute("alertMsg", "프로젝트 삭제를 실패했습니다ㅠㅠ");
			return "redirect:selectDetailPro.pro?pno="+ pno;
		}
		
	}
	
	
	/**
	 * 프로젝트 수정하는 폼으로 가는 메소드
	 * 수정하는 폼에 가기 전에 상세내용, 기술스택목록부터 조회하기
	 * @param pno
	 */
	@RequestMapping("updateFormProject.pro")
	public ModelAndView updateFormProject(int pno, ModelAndView mv) {
		
		// 수정 폼으로 갈 때 작성자가 작성한 내용, 기술스택 목록을 들고 가야함 
		// 위에 있는 상세내용 조회 메소드 가져오기 
		Project p = pservice.selectDetailPro(pno);
		ArrayList<Stack> list = pservice.selectStackList();
		
		mv.addObject("p", p).addObject("list", list).setViewName("project/updateProject");
		
		return mv;
	
		
	}
	
	
	
	/**
	 * 찐으로 수정하는 메소드
	 * @param p
	 */
	@RequestMapping("updateProject.pro")
	public String updateProject(Project p, HttpSession session) {
		
		int result = pservice.updateProject(p);
		
		if(result>0) {
			session.setAttribute("alertMsg", "프로젝트 수정을 성공했습니다.");
			
		}else {
			session.setAttribute("alertMsg", "프로젝트 수정을 실패했습니다ㅠㅠ");
		}
	
		return "redirect:selectDetailPro.pro?pno="+ p.getProNo();
	}
	
	
	
	
	/**
	 * 프로젝트 댓글 작성용 메소드
	 * @param replyContent
	 */
	@ResponseBody
	@RequestMapping("insertReply.pro")
	public String insertReplyProject(Reply r,HttpSession session) {
		
		int result = pservice.insertReplyProject(r);
		
		
		return result>0 ? "success" : "fail";
		
	}
	
	
	/**
	 * 프로젝트 댓글 리스트 조회용 메소드
	 * @param pno
	 */
	@ResponseBody
	@RequestMapping(value= "selectProReplyList.pro", produces="application/json; charset=UTF-8")
	public String selectProjectReplyList(int pno) {
		
		ArrayList<Reply> list = pservice.selectProjectReplyList(pno);
		//System.out.println(list + " 컨트롤단!!!!!!!!!!!!");
		
		return new Gson().toJson(list);
		
	}
	
	
	
	/**
	 * 프로젝트 댓글 삭제하는 메소드
	 * @param pno
	 */
	@ResponseBody
	@RequestMapping("deleteProReply.pro")
	public String deleteReplyProject(int pno, HttpSession session) {
		
		int result = pservice.deleteReplyProject(pno);
		
		
		return result>0 ? "success" : "fail"; 
	}
	
	
    /**
     * 북마크 삭제 / 삽입하는 메소드 (ajax)
     * @param proNo
     * @param session
     */
    @ResponseBody
	@RequestMapping("projectBookmark.pro")
	public String projectBookmark(int pno, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		
		
		Bookmark b = new Bookmark();
		b.setMemNo(memNo);
		b.setProNo(pno);
		
		System.out.println(b  + "북마크 객체 뽑아봄");
		 
		
		int result = 0;
		
		
		int count = pservice.selectBookCount(pno);
		
		if(count == 0) {
			// 북마크 된 것이 없다면 북마크 하러 가기 
			result = pservice.insertProBookmark(b);
			
			
		}else {
			// 북마크가 이미 되어있다면 삭제하러 가기
			result = pservice.deleteProBookmark(b);
		}
		
		System.out.println(result + "   : 컨트롤러 단에서 북마크 result 화깅");
		
		return result>0 ? "success" : "fail";
		
		
	}
	
	
	
	
	
	
	
	
}
