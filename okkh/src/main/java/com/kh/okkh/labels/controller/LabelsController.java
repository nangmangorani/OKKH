package com.kh.okkh.labels.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.okkh.labels.model.service.LabelsServiceImpl;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;

@Controller
public class LabelsController {
	
	private LabelsServiceImpl lService;
	
	@RequestMapping("list.lab")
	public String labelList(HttpSession session, Model model) {
		
		String token = ((Member)session.getAttribute("git")).getMemToken();
		System.out.println("token" + token);
		
		String repository = "nangmangorani/01_java-workspace";
		
		ArrayList<Labels> lList = lService.labelList(token, repository);
		System.out.println(lList);
		
		model.addAttribute("lList", lList);
		
		return "label/labelList";
	}

}
