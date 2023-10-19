package com.kh.okkh.pr.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	
	
	/**
	 * pr 삭제하는 메소드
	 * @param pno
	 */
	@RequestMapping("deletePr.pr")
	public String deletePR(int pno, Model model, HttpSession session) {
		
		int result = prService.deletePR(pno);
		
		if(result>0) {
			// 삭제 성공 
			// pr목록으로 가기 
			// alert도 띄우기 
			
			session.setAttribute("alertMsg", "PR 삭제를 성공했습니다.");
			return "redirect:personalList.pr";
			
		}else {
			// 실패하면 
			// 에러메시지 띄우기
				model.addAttribute("errorMsg", "PR 삭제를 실패했습니다.");
				return "pr/detailPr";
		}
		
		
	}
	
	
	/**
	 * pr 수정할 때 먼저 pr / 기술스택 리스트 조회한 다음에 updateForm으로 감
	 * @return
	 */
	@RequestMapping("updatePrForm.pr")
	public ModelAndView updateFormPR(int pno, ModelAndView mv ) {
		
		
		// System.out.println(pno);
		PR pr = prService.selectDetailPR(pno);
		ArrayList<Stack> list = prService.selectStackList();
		
		// pr에는 상세조회한 내용이 들어있음 
		// list에는 stack 리스트 조회한 게 들어있음 이것들을 가지고 form으로 고고씽
		
		mv.addObject("pr", pr).addObject("list", list).setViewName("pr/updatePR");
		
		return mv;
		
		
		
	}
	
	
	/**
	 * 찐 수정하는 메소드
	 * @param pno
	 */
	@RequestMapping("updatePR.pr")
	public String updatePR(PR pr, HttpSession session, Model model) {
		
	
		System.out.println(pr);
		
		int pno = pr.getPrNo();
		
		 int result = prService.updatePR(pr);
		 
		 if(result>0) {
			 // 수정 성공하면 alert 띄우고 상세페이지로 url재요청 
			 
			session.setAttribute("alertMsg", "PR 수정을 성공했습니다.");
			return "redirect:detailPr.pr?pno="+ pno;
			 
		 }else {
			 // 수정 실패하면 error메시지 띄우고 상세페이지로 
			model.addAttribute("errorMsg", "PR 수정을 실패했습니다.");
			 return "common/errorPage";
		 }
		
		
	}
	
	
	/**
	 * 썸머노트에서 파일 다중으로 업로드 할 때 필요한 메소드 (근데 구현 잘 안됨...ㅠ)
	 * @param multipartFile
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
	/**
	 * pr 댓글 작성하는 메소드
	 */
	@RequestMapping("insertReply.pr")
	public void insertReplyPR() {
		
	}
	
	
	
	
}
