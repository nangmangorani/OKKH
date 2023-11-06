package com.kh.okkh.project.controller;

import java.awt.print.Book;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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

import io.netty.handler.codec.http.HttpHeaders.Values;

/**
 * @author 유정(호빵)
 *
 */
@Controller
public class ProjectController {

	@Autowired
	private ProjectServiceImpl pservice;
	
	
	/**
	 * leftBar에서 Recruit 누르자마자 일단 전체 프로젝트list 조회하는 메소드
	 */
	@RequestMapping("recruitList.pro")
	public ModelAndView selectProjectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv, HttpSession session) {
		

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
		
		// 이건 projectRightSide.jsp에서 친구 목록 조회할 때 필요해서 조회하고, session에도 담음 
		 ArrayList<Member> teamList = pservice.selectProjectTeamMateList(pno);
		 	
		 
		 
		 session.setAttribute("teamList", teamList);
		 
		 
		// 다시 상세조회 하는 코드로 넘어오장 
		 // 조회수 증가 성공하면 찐 프로젝트 상세내용 조회하러 가자
		if(result>0) {
			
			// 조회수 증가 성공했으면 찐으로 상세 조회하러 가기
			Project pro = pservice.selectDetailPro(pno);
			session.setAttribute("projectSession", pro);  
			// 이건 projectRightSide.jsp에서 필요해서 세션에 담음(프로젝트 참여 희망자 목록 페이지)
			
			System.out.println(pro);
			
			Bookmark book = pservice.selectProBookmark(b);
			
			int count = pservice.selectBookCount(pno);
			
			
			
			
			mv.addObject("count", count);
			mv.addObject("book", book);
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
		
		int memNo =  Integer.parseInt( p.getProWriter());
		int proNo = p.getProNo();
		
		Member m = new Member();
		m.setMemNo(memNo);
		m.setTeam(proNo);
		
		if(result>0) {
			// 프로젝트 작성 성공하면 
			// 작성자의 member 테이블의 team을 프로젝트 번호로 넣어주기
			
			int result2 = pservice.insertTeam(m);
			
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
	 * (프로젝트의 모집 status도 변경
	 * @param pno
	 * @param session
	 * @return
	 */
	@RequestMapping("recruitDone.pro")
	public String recruitDonePro(int pno, HttpSession session) {
		
		int result = pservice.recruitDonePro(pno);
		
		if(result>0) {
			// 모집완료 성공
						
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
			// 재모집 성공하면 다시 member테이블의 team_status도 변경하기 
			
			
			
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
			// 프로젝트 삭제성공하면 team도 0으로 다시 바꾸기 
			
			int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
			int update = pservice.updateTeamNo(memNo);
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
		
		
		
		 
		
		int result = 0;
		
		
		int count = pservice.selectBookCountPersonal(b);
		
		if(count == 0) {
			// 북마크 된 것이 없다면 북마크 하러 가기 
			result = pservice.insertProBookmark(b);
			
			
		}else {
			// 북마크가 이미 되어있다면 삭제하러 가기
			result = pservice.deleteProBookmark(b);
		}
		
		
		return result>0 ? "success" : "fail";
		
		
	}
	
	
	
	/**
	 * 로그인한 유저가 프로젝트 참여하기 누르면 게시글 작성자에게 알람가게 하는 메소드
	 * @param refProNo
	 * @param owner
	 * @param session
	 * @return
	 */
    
    @ResponseBody
	@RequestMapping(value="alarmProject.pro")
	public int alarmProject(int refProNo, HttpSession session) {
		
		
		// 먼저 작성자에게 알람가게 하기 -> 여기 코드부분을 성공하면 ajax로 돌아가서 자동으로 
		// 작성자에게 알람을 주는 듯 
				
		
		
		int memNo =((Member)session.getAttribute("loginMember")).getMemNo();
		
		Member m = new Member();
		
		m.setMemNo(memNo);
		m.setTeam(refProNo);
		
	
		
		int result = pservice.participateProject(m);
		
		if(result>0) {
			
		
			Member updateMember = pservice.selectMember(memNo);
			
			
			
			// 세션 갈아끼우기!! 아주 중요!! 이거 안하면 말짱 도루묵!! -> 필요없어졌음...또르륵....ㅠㅠ
			session.setAttribute("loginMember", updateMember);
			
			return 1;
			
		}else {
			session.setAttribute("alertMsg", "프로젝트 참여 신청이 실패했습니다ㅠㅠ");
			return 0;
		}
		
		
		
		
		
	}
	
    
    
    /**
     * 프로젝트 참여 취소용 메소드
     * @param memNo
     */
    @ResponseBody
    @RequestMapping(value ="deleteEnrollProject.pro" )
    public int deleteEnrollProject( HttpSession session) {
    	
    	int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
    	
    	 int result = pservice.deleteEnrollProject(memNo);
    	 
    	 if(result>0) {
    	
    		 Member updateMember = pservice.selectMember(memNo);
    		
    		 session.setAttribute("loginMember", updateMember);
    		 
    		 return 1; 
 			
    	 }else {
    		 session.setAttribute("alertMsg", "프로젝트 참여 취소를 실패했습니다ㅠㅠ");
    		 return 0;
    	 }
    	 
    	  
    	
    }
    
    
    
    
    /**
     * 프로젝트에 팀원 추가하는 메소드
     * @param memNo
     */
    // ******** 주의!!! 아주 중요 **************
    //  ajax에서 배열로 보낸 값은 그냥 가져올 수 없음 
    // @RequestParam(value="ajax에서 준 키 값[]")List<String> 형으로 받아야함!!!!!!!!!!!!
    //   (이때 List는 java.util에 있는 걸 import하기!!!)
    @ResponseBody
    @RequestMapping("enrollTeamMate.pro")
    public String enrollTeamMate(@RequestParam(value="checkedMembers[]", required = false,defaultValue = "0")List<Integer> checkedMembers,
    							 @RequestParam(value="uncheckedMembers[]", required = false,defaultValue = "0")List<Integer>uncheckedMembers,HttpSession session) {
    	
    	
    	
    	int result = 1;
    	int result2 =1;

       
            result = pservice.enrollTeamMate(checkedMembers);
            
           if(result>0) {
        	   
        	   result2 = pservice.deleteTeamMate(uncheckedMembers);
        	   
           }
         

       
      

        return result*result2 > 0 ? "success" : "fail";
    
    	
    	
    }
    
    /**
	 * mainpage top 4
	 */
    @ResponseBody
    @RequestMapping(value="topProjectList.bo", produces="application/json; charset=utf-8")
	public String selectProjectTopList() {
		
		ArrayList<Project> list = pservice.selectProjectTopList();
		
		return new Gson().toJson(list);
	}
    
    
    
    
    
    
    
    
    
    
    
    
	
	
	
}
