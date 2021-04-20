package com.board.controller.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	//페이지 요청 정보 저장 (스크랩 주소 따실때 참고하세요)
	private void saveDestination (HttpServletRequest request) {
		
		// 객체에 주소를 저장 (uri는 루트 뒤의 주소)
		String uri  = request.getRequestURI();
		//쿼리 스트링: url 주소에 미리 협의된 데이터를 파라미터를 통해 넘겨 객체에 저장
		// ex) list?id=1  / ? 뒤에 부분이 query이다
		String query = request.getQueryString();
		
		//쿼리 값이 null 이면 공백 그렇지 않으면 ? + 쿼리스트링값
		//쿼리스트링은 ? 는 저장하지 않아 따로 붙여줘야 합니다
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		//넘어온 값이 get 방식일 경우 실행 
		if (request.getMethod().equals("GET")) {
			logger.info("destination:" + (uri + query));
			//세션값 넣기
			request.getSession().setAttribute("destination", uri + query);
		}
	}
	
	//페이지 접근권한 시스템
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//세션을 가져온다 (가져올 세션이 없으면 생성)
		HttpSession httpSession =request.getSession();
		
		//로그인 세션값이 null인 경우 실행
		if (httpSession.getAttribute("login") == null) {
			logger.info("로그인하지 않았습니다");
			
			//saveDestination 메서드를 실행
			saveDestination(request);
			
			//로그인 페이지로 리다이렉트
			response.sendRedirect("/member/login");
			return false;
		}
		//컨트롤러 호출
		return true;
		
	}
}
