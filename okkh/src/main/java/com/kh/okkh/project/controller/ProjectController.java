package com.kh.okkh.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.okkh.common.model.vo.PageInfo;
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
	public String selectProjectList(PageInfo pi,Model model) {
		
		ArrayList<Project> list = pservice.selectProjectList(pi);
		
		model.addAttribute("list", list);
		
		return "project/projectList";
		
		
		
	}
	
	
}
