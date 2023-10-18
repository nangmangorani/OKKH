package com.kh.okkh.issue.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kh.okkh.issue.model.service.IssueServiceImpl;
import com.kh.okkh.issue.model.vo.Issue;
import com.kh.okkh.labels.model.service.LabelsServiceImpl;
import com.kh.okkh.labels.model.vo.Labels;


@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;
	
	@Autowired 
	private LabelsServiceImpl lService;
	
	/**
	 * 이슈리스트 조회
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 */
	@RequestMapping("list.iss")
	public String selectIssueList(Model model , HttpSession session) throws JsonMappingException, IOException {
		
//		ArrayList<Issue> list = iService.selectIssueList();
//		ArrayList<Labels> labList = lService.selectLabList();
//		
//		
//		for(int i = 0; i<list.size(); i++) {
//			if(list.get(i).getIssStatus().equals("Y") ) {
//				list.get(i).setIssStatus("진행중");
//			} else {
//				list.get(i).setIssStatus("진행완료");
//			}
//		}
//		
//		
//		model.addAttribute("labList", labList);
//		model.addAttribute("list", list);
//		
//		return "issue/issueList";
		
		String repository = "nangmangorani/01_java-workspace";
		
		String state = "open";
		String assign = "nangmangorani";
		String label = "bug";
		Integer page= 1;
		
		// 라벨만 받아온거잖아+
		ArrayList<Labels> lList = iService.getLabels(repository, session);
		System.out.println(lList + "히히");
		String token = "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";

		ArrayList<Issue> list;
		
		list = iService.getIssues(repository, token, state, assign, label, page);
		
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i).getLabels());
		}

		model.addAttribute("list", list);
		model.addAttribute("lList", lList);
		model.addAttribute("state", state);
		
		
		return "issue/issueList";
		
	}
	
	
	
	
	
	
	
}
