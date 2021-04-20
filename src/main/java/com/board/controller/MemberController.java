package com.board.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private final UserService userService;
	
	@Autowired
    private JavaMailSender mailSender;

	@Inject
	public MemberController(UserService userService) {
		this.userService = userService;
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/member/register";
	}

	//아이디 중복체크
	//json을 View 단으로 전송하기위해 @ResponseBody 사용
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(UserVO userVO) throws Exception {
		int result = userService.idChk(userVO.getUserId());
		return result;
	}

	// 회원가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes rttr) throws Exception {
		int result = userService.idChk(userVO.getUserId());
		try {
			if(result == 1) {
				return "redirect:/member/register";
			}else if (result == 0){
				//비밀번호 암호화 처리 
				//BCrypt.hashpw() 메서드는 첫번째 파라미터에는 암호화할 비밀번호
				//두번째 파라미터는 BCrypt.gensalt() 받고 암호화된 비밀번호를 리턴한다
				String hashedPW = BCrypt.hashpw(userVO.getPw(), BCrypt.gensalt());
				
				//암호화된 비밀번호를 다시 회원 객체에 저장
				userVO.setPw(hashedPW);
				
				//서비스 회원가입 메서드 호출
				userService.register(userVO);
			}
		}catch (Exception e) {
			throw new RuntimeException();
		}
		
		//String을 전달
		//post 형식으로 전달, 한 번만 사용되면 사라진다
		rttr.addFlashAttribute("msg", "REGISTERED");
		
		//회원 가입 완료 후 로그인 페이지로 이동
		return "redirect:/member/login";
	}
	
	//회원 수정 페이지 이동
	@RequestMapping(value = "/userModifyView", method = RequestMethod.GET)
	public String userModifyGET() throws Exception {
		return "/member/userModifyView";
	}
	
	//회원 수정처리
	@RequestMapping(value = "/userModify", method = RequestMethod.POST) 
	public String userModifyPOST(UserVO userVO, HttpSession httpsession) throws Exception { 
		//비밀번호 암호화 처리 
		String hashedPW = BCrypt.hashpw(userVO.getPw(), BCrypt.gensalt());
		userVO.setPw(hashedPW);

		//서비스 회원정보 수정 메서드 호출
		userService.userUpdate(userVO);
		
		//정보를 수정했으니 다시 로그인 하기위해 세션값을 날린다
		httpsession.invalidate();
		return "redirect:/"; 
	}
	
	//회원 블락 페이지 이동
	@RequestMapping(value = "/userBlockView", method = RequestMethod.GET)
	public String userBlockGET() throws Exception {
		return "/member/userBlockView";
	}
	
	//회원 블락 처리
	@RequestMapping(value = "/userBlock", method = RequestMethod.POST) 
	public String userBlockPOST(UserVO userVO, HttpSession httpsession, RedirectAttributes rttr) throws Exception { 
		//로그인 세션정보를 가져오기
		UserVO login = (UserVO) httpsession.getAttribute("login");
		
		// 세션에있는 비밀번호, 아이디 가져오기
		String sessionId = login.getUserId();
		String sessionPw = login.getPw();
		
		// input으로 들어오는 비밀번호
		String voPw = userVO.getPw();
		
		//비밀번호 확인 불일치시 처음으로 돌아가기
		if (login == null || !BCrypt.checkpw(voPw, sessionPw)) {
			logger.info("비밀번호 불일치!!");
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/userBlockView";
		}

		userService.userBlock(userVO);
		
		//정보를 수정했으니 다시 로그인 하기위해 세션값을 날린다
		httpsession.invalidate();
		return "redirect:/"; 
	}
	
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "/findIdView", method = RequestMethod.GET)
	public String findIdGET() throws Exception {
		return "/member/findIdView";
	}
	
	//아이디 찾기
	@RequestMapping(value = "/findId", method = RequestMethod.POST) 
	public String findIdPOST(UserVO userVO, RedirectAttributes rttr, HttpServletRequest request, Model model) throws Exception { 
		logger.info("아이디 찾기");
		// input으로 들어오는 이메일 
		// 이메일 등록여부 확인
		String findId = userService.findId(userVO.getEmail());
		if (findId == null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/findIdView";
		}

		//찾은 아이디가 탈퇴 회원인지 확인
		int findXid = userService.Xid(findId);
		if (findXid == 1) {
			rttr.addFlashAttribute("msg2", false);
			return "redirect:/member/findIdView";
		}
		
		//세션을 저장소 생성 
		HttpSession httpSession = request.getSession();
		//찾은 아이디를 findId변수로 세션저장
		httpSession.setAttribute("findId", findId);
		
		return "redirect:/member/findIdOk"; 
	}
	
	//찾은 아이디 확인
	@RequestMapping(value = "/findIdOk", method = RequestMethod.GET)
	public String findIdOkGET() throws Exception {
		return "/member/findIdOk";
	}
	
	//이메일 중복확인
	@ResponseBody
	@RequestMapping(value="/findEmail", method = RequestMethod.POST)
	public int findEmail(String email) throws Exception {
		int findEmail = userService.findEmail(email);
		return findEmail;
	}
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value="/mailCheck", method = RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception {
		
		//인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호확인 " + checkNum);
		
		//이메일 보내기
		String setFrom = "asdfqwe5317@gmail.com"; //root-context.xml에 삽입한 자신의 이메일 계정
		String toMail = email; //수신받을 이메일 (변수처리)
		String title = "회원가입 인증 이메일 입니다."; //이메일 제목
		String content = //이메일 내용
				"인증 번호는 <span style='color:red; font-size:30px;'>" + 
				checkNum + "</span>입니다.";
		//이메일 전송코드
		try {
			/*
			 * MimeMessage 대신 SimpleMailMessage도 사용가능
			 * MimeMessage =  멀티파트 데이터를 처리 할 수 있다
			 * SimpleMailMessage = 단순한 텍스트 데이터만 전송이 가능
			 */
			MimeMessage message = mailSender.createMimeMessage();
			// true는 멀티파트 메세지를 사용하겠다는 의미
			// 단순 메세지의 경우 = new MimeMessageHelper(mail,"UTF-8");
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); //true는 html을 사용
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//ajax를 통한 요청으로 인해 뷰로 다시 반환할 때 데이터 타입은 String 타입만 가능
		//인증번호 타입변환
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/findPwView", method = RequestMethod.GET)
	public String findPwGET() throws Exception {
		return "/member/findPwView";
	}

	//비밀번호 찾기
	@RequestMapping(value = "/findPw", method = RequestMethod.POST) 
	public String findPwPOST(UserVO userVO, RedirectAttributes rttr, HttpServletRequest request, HttpSession httpsession) throws Exception { 
		logger.info("비밀번호 찾기");
		
		String findId = userService.findId(userVO.getEmail());
		if (findId == null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/findPwView";
		}
		
		int findXid = userService.Xid(findId);
		if (findXid == 1) {
			rttr.addFlashAttribute("msg2", false);
			return "redirect:/member/findPwView";
		}
		
		//임시비밀번호 만들기
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0; 
		StringBuffer imsiPw = new StringBuffer(); 
		for (int i = 0; i < 10; i++) { 
			idx = (int) (charSet.length * Math.random()); 
			imsiPw.append(charSet[idx]);
		}
		//형변환 시키기
		String imsiSPw = imsiPw.toString();
		
		//비밀번호 암호화 처리 
		String hashedPW = BCrypt.hashpw(imsiSPw, BCrypt.gensalt());
		userVO.setPw(hashedPW);
		
		userService.updatePw(userVO);
		
		//이메일 보내기
		String setFrom = "asdfqwe5317@gmail.com"; 
		String toMail = userVO.getEmail();
		String title = "임시 비밀번호 입니다."; 
		String content = //이메일 내용
				"임시 비밀번호는 <span style='color:red; font-size:30px;'>" + 
				imsiSPw + "</span>입니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		httpsession.invalidate();
		
		return "redirect:/member/login"; 
	}
}



