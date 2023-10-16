package com.kh.okkh.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	/*
	 * * Interceptor (정확히는 HandlerInterceptor)
	 * 	- 해당 Controller가 실행되기 전, 실행된 후에 낚아채서 실행할 내용 작성 가능 
	 * 	- 로그인 유무를 판단, 회원의 권한 체크(관리자 여부)를 함 
	 * 
	 * 
	 * * Interceptor 종류
	 * 	- preHandle(전처리)	: DispatcherServlet이 컨트롤러를 호출하기 전에 낚아채는 영역
	 * 	- postHandle(후처리)	: 컨트롤러에서 요청처리를 다 한 후에 DispatcherServlet으로 뷰 정보가 리턴되는 순간 낚아채는 영역

	 * */
	
	
	
	// 전처리 인터셉터
	// 필요한 변수 request, response, handler(object형) 직접 추가해주기
	// 부모 것을 override해서 하기
	// 이걸 스프링이 인식하게 하기 위해서 servlet-context.xml에서 등록해주기 (어노테이션 달렸어도 해줘야함) 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception  {
		
		// true 리턴 		=> 기존 요청 흐름대로 해당 controller 제대로 실행
		// false 리턴		=> controller 실행되지 않음
		
		
		HttpSession session = request.getSession();
		
		// 현재 요청을 보낸 사람이 로그인이 되어있을 경우 => controller 실행
		if(session.getAttribute("loginMember") != null) {
			// 로그인이 되어있을 경우 => controller 실행
			return true;
			
		}else {
			// 로그인이 되어있지 않을 경우 => controller 실행안되고 alert 띄우기

			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니당당당");
			response.sendRedirect(request.getContextPath());  // 메인 화면으로 이동시키기
			return false;
		}
		
		
		
		
		
		
		
	}
	
	
	
	
	
}
