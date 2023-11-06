package com.kh.okkh.labels.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.okkh.labels.model.service.LabelsServiceImpl;
import com.kh.okkh.labels.model.vo.Labels;
import com.kh.okkh.member.model.vo.Member;

@Controller
public class LabelsController {
	
	@Autowired
	private LabelsServiceImpl lService;
	
	@RequestMapping("list.lab")
	public String labelList(HttpSession session, Model model) {
		
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");
		
		ArrayList<Labels> lList = new ArrayList<Labels>();
		
		lList = lService.labelList(repository, token);
		
		model.addAttribute("lList", lList);
		
		return "label/labelList";
	}
	
	
	
	@RequestMapping(value = "edit.lab", method = RequestMethod.POST)
	public String labelEdit(HttpSession session,String name, String description, String color, String originalName) {
		
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");
		
		color = color.substring(1);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("new_name", name);
		requestBody.put("description", description);
		requestBody.put("color", color);
		
		lService.editLabel(repository, token, requestBody, originalName);
		
		session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		
		return "redirect:list.lab";
	}

	@RequestMapping(value = "enroll.lab", method = RequestMethod.POST)
	public String labelEnroll(HttpSession session, String name, String description, String color) {

		String token = (String)session.getAttribute("token");

		String repository = (String)session.getAttribute("repository");

		color = color.substring(1);

		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("name", name);
		requestBody.put("description", description);
		requestBody.put("color", color);

		lService.labelEnroll(repository, token, requestBody);

		session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
		
		return "redirect:list.lab";
	}
	
	@RequestMapping("delete.lab")
	public String deleteLabel(HttpSession session, String name) {
		
		String token = (String)session.getAttribute("token");
		
		String repository = (String)session.getAttribute("repository");
		
		lService.deleteLabel(repository, token, name);
		
		session.setAttribute("alertMsg", "성공적으로 삭제했습니다.");
		
		return "redirect:list.lab";
	}
	
	
	

}
