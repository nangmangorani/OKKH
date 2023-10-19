package com.kh.okkh.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.common.template.PagiNation;
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
	public ModelAndView selectDetailPro(int pno, ModelAndView mv){
		
		
		// 먼저 조회수부터 증가시키고 오기
		int result = pservice.increaseCount(pno);
		
		if(result>0) {
			
			System.out.println(result + "      result 결과!!");
			// 조회수 증가 성공했으면 찐으로 상세 조회하러 가기
			Project pro = pservice.selectDetailPro(pno);
			
			System.out.println(pro + "    컨트롤러 pro");
			
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
//	@RequestMapping("insertProForm.pro")
//	public String insertProForm() {
//		
//		// 기술 스택 조회하는 메소드
//		ArrayList<Stack> list = pservice.selectStackList();
//		// 아직 기술 스택 조회하는 메소드 작성 안함 
// 		
//	}
	
	
	
}
