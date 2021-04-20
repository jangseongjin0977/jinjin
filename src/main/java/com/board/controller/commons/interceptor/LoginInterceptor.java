package com.board.controller.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	//HttpSession과 관련된 모든 설정을 처리하는 곳
	
	//httpSession에 컨트롤러에서 저장한 user를 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		//세션을 가져온다 (가져올 세션이 없으면 생성)
		HttpSession httpSession = request.getSession();
		
		//model에 데이터를 저장 후 view(jsp페이지)에서 데이터 접근이 가능
		ModelMap modelMap = modelAndView.getModelMap();
		
		//userVO = 로그인 폼에 입력한 정보
		Object userVO = modelMap.get("user");
		
		//가져온 데이터가 null이 아니면 로그인 성공
		if (userVO != null) {
			logger.info("로그인 성공");
			//LOGIN으로 session을 바인딩 한다
			httpSession.setAttribute(LOGIN, userVO);
			
			//AuthInterceptor에서 저장된 destination 주소값 가져와 객체에 저장
			Object destination = httpSession.getAttribute("destination");
			
			//삼항 연산자 사용
			//destination이 null(저장된 세션값이 없을 경우)이면 "/" 값이 있으면 destination
			response.sendRedirect(destination !=null ? (String) destination : "/");
		}
	}
	
	//기존 로그인 정보가 있을 겨우 초기화
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//세션을 가져온다 (가져올 세션이 없으면 생성)
		HttpSession httpSession = request.getSession();
		
		//LOGIN 값이 null이 아니면 제거해라
		if (httpSession.getAttribute(LOGIN) != null) {
			logger.info("로그인 정보가 사라졌습니다");
			//LOGIN 제거하기 = null값으로 만들기
			httpSession.removeAttribute(LOGIN);
		}
		
		return true;
	}	
}
