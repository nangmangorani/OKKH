package com.kh.okkh.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.okkh.common.model.vo.PageInfo;
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
	public void selectProjectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage) {
		
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
		
		
		
		
	}
	
	
}
