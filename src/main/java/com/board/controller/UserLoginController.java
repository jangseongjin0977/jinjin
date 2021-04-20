package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/member/*")
public class UserLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	private final UserService userService;
	
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}
	
	//로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO){
		return "/member/login";
	}
	
	//로그인처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(UserVO userVO, LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception{
		//탈퇴회원 검사
		int result = userService.Xid(userVO.getUserId());
		if (result == 1) {
			return;
		}
		
		//login에서 받은 데이터(아이디, 비밀번호) 중에서 
		//아이디를 통해 select한 회원 정보를 변수 userVO에 담는다
		UserVO userLoginVO = userService.login(loginDTO);
		
		//만역 userVO가 null 또는 BCrypt.checkpw()를 통해 맞지 않으면 메서드 종료
		if (userLoginVO ==null || !BCrypt.checkpw(loginDTO.getPw(), userLoginVO.getPw())) {
			return;
		}
		//비밀번호가 일치하면 model에 userVO를 user란 변수로 저장한다
		model.addAttribute("user", userLoginVO);
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		//로그인 세션값을 object에 넣는다
		Object object = httpSession.getAttribute("login");
		
		//로그인 값이 있을 경우
		if (object != null) {
			//로그인 세션을 삭제
			httpSession.removeAttribute("login");
			//화면 새로고침
			httpSession.invalidate();
		}
		
		return "/member/logout";
	}
	

	
}






