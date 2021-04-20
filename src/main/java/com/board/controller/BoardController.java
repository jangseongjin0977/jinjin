package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.PageMaker;
import com.board.domain.RboardVO;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;
import com.board.domain.UserVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.service.UserService;
import com.board.utils.UploadFileUtils;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	 @Inject
	 BoardService service;
	 
	 @Inject
	 ReplyService replyService;
	 
	 @Inject
	 UserService userService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	 
	// 게시판 목록 조회
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("list");
			
			model.addAttribute("list",service.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			
			return "board/list";
	 }
	 
	// 게시판 조회
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(RboardVO boardVO,@ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session) throws Exception{
			logger.info("read");
			
			service.boardHit(boardVO.getReview_id(), session);
			model.addAttribute("read", service.read(boardVO.getReview_id()));
			model.addAttribute("scri", scri);
			
			List<ReplyVO> replyList = replyService.readReply(boardVO.getReview_id());
			model.addAttribute("replyList", replyList);
			
				
			return "board/readView";
			}
	
		 @RequestMapping(value="/board/recommend", method = RequestMethod.POST)
		    public String recommend (RboardVO boardVO) throws Exception {
		        
			 service.recommend(boardVO.getReview_id());
		    
		        return "redirect:/board/readView?review_id=" + boardVO.getReview_id();
		    }

	// 게시판 글 작성 화면
		@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		// 게시판 글 작성
		@RequestMapping(value = "/board/write", method = RequestMethod.POST)
		public String write(RboardVO boardVO, HttpSession session, MultipartFile file) throws Exception{
			logger.info("write");
			

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

			boardVO.setReview_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			boardVO.setThumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);


			UserVO login = (UserVO)session.getAttribute("login");
			boardVO.setUser_id(login.getUserId());
			
			service.write(boardVO);
			
			return "redirect:/board/list";
		}
		
		// ck 에디터에서 파일 업로드
		@RequestMapping(value = "/board/ckUpload" , method = RequestMethod.POST)
		public void postCKEditorImgUpload(HttpServletRequest req,
		          HttpServletResponse res,
		          @RequestParam MultipartFile upload) throws Exception {
			 logger.info("post CKEditor img upload");
			 
			 // 랜덤 문자 생성
			 UUID uid = UUID.randomUUID();
			 
			 OutputStream out = null;
			 PrintWriter printWriter = null;
			   
			 // 인코딩
			 res.setCharacterEncoding("utf-8");
			 res.setContentType("text/html;charset=utf-8");
			 
			 try {
			  
			  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
			  byte[] bytes = upload.getBytes();
			  
			  // 업로드 경로
			  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			  
			  out = new FileOutputStream(new File(ckUploadPath));
			  out.write(bytes);
			  out.flush();  // out에 저장된 데이터를 전송하고 초기화
			  
//			  String callback = req.getParameter("CKEditorFuncNum");
			  printWriter = res.getWriter();
			  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
			  
			  // 업로드시 메시지 출력
			  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			  
			  printWriter.flush();
			  
			 } catch (IOException e) { e.printStackTrace();
			 } finally {
			  try {
			   if(out != null) { out.close(); }
			   if(printWriter != null) { printWriter.close(); }
			  } catch(IOException e) { e.printStackTrace(); }
			 }
			 
			 return; 
		}
		
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(RboardVO boardVO,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(boardVO.getReview_id()));
			model.addAttribute("scri", scri);
			
			return "board/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(RboardVO boardVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr, MultipartFile file, HttpServletRequest req) throws Exception{
			logger.info("update");
			
			 // 새로운 파일이 등록되었는지 확인
			 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 기존 파일을 삭제
			  new File(uploadPath + req.getParameter("review_img")).delete();
			  new File(uploadPath + req.getParameter("thumbimg")).delete();
			  
			  // 새로 첨부한 파일을 등록
			  String imgUploadPath = uploadPath + File.separator + "imgUpload";
			  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			  
			  boardVO.setReview_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  boardVO.setThumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			  
			 } else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			  boardVO.setReview_img(req.getParameter("review_img"));
			  boardVO.setThumbimg(req.getParameter("thumbimg"));
			  
			 }
			
			service.update(boardVO);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			
			return "redirect:/board/readView?review_id=" + boardVO.getReview_id();
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(RboardVO boardVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception{
			logger.info("delete");
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			service.delete(boardVO.getReview_id());
			
			return "redirect:/board/list";
		}
		
		//댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
			logger.info("reply Write");
			
			UserVO login = (UserVO)session.getAttribute("login");
			vo.setUser_id(login.getUserId());
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getComment_id()));
		
			
			return "board/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("Review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getComment_id()));

			return "board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("Review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
}