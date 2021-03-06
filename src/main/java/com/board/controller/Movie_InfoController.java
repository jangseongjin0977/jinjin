package com.board.controller;


import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dao.Movie_InfoDAO;
import com.board.domain.PageMaker;
import com.board.domain.PushVO;
import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;
import com.board.domain.SearchCriteria;
import com.board.domain.UserVO;
import com.board.service.Movie_InfoService;
import com.board.service.PushService;
import com.board.service.UserService;
import com.board.utils.UploadFileUtils;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/movie_info/*")
public class Movie_InfoController {

	private static final Logger logger = LoggerFactory.getLogger(Movie_InfoController.class);

	@Inject
	Movie_InfoService service;
	
	@Inject
	UserService userService;
	
	@Inject
	PushService pushService;

	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	// ????????? ?????? ??????
	@RequestMapping(value = "/movielist", method = RequestMethod.GET)
	public String movielist(Model model,  @ModelAttribute SearchCriteria scri) throws Exception {
		logger.info("movielist");

		model.addAttribute("movielist", service.movielist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		


		return "movie_info/movielist";
	}

	// ????????? ??? ?????? ??????
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	// ????????? ??? ??????
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute Movie_InfoVO movie_InfoVO, MultipartFile file, HttpSession httpsession, Model model) throws Exception{
		logger.info("write");
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		movie_InfoVO.setMovie_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		movie_InfoVO.setImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.write(movie_InfoVO);
		
		return "redirect:/movie_info/movielist";
	}
	
	// ????????? ??????
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(Movie_InfoVO movie_InfoVO, UserVO userVO, PushVO pushVO,  @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession httpsession) throws Exception{
		logger.info("read");
		
		//??????????????????
		UserVO login = (UserVO) httpsession.getAttribute("login");
		if(login != null) {
			String sessionId = login.getUserId();
			int movie_id = movie_InfoVO.getMovie_id();
			pushVO.setUserId(sessionId);
			pushVO.setMovieId(movie_id);
			System.out.println(pushVO);
			int pushCheck = pushService.pushCheck(pushVO);
			System.out.println(pushCheck);
			if(pushCheck == 1) {
				model.addAttribute("pushCheck", pushCheck);
			}else {
				model.addAttribute("pushCheck", pushCheck);
			}
			System.out.println("??????" + sessionId);
		}
		model.addAttribute("read", service.read(movie_InfoVO.getMovie_id()));
		model.addAttribute("scri", scri);
		
		//??? ?????????
		int Ptotal = pushService.totalPush(pushVO);
		model.addAttribute("push", Ptotal);
		
		return "movie_info/readView";
	}
	
	// ????????? ?????????
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(Movie_InfoVO movie_InfoVO, UserVO userVO, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession httpsession) throws Exception{
		logger.info("updateView");
		
		UserVO login = (UserVO) httpsession.getAttribute("login");
		
		if(login != null) {
			String sessionId = login.getUserId();
			movie_InfoVO.setUser_id(sessionId);
			System.out.println(movie_InfoVO);
		}
		
		model.addAttribute("update", service.read(movie_InfoVO.getMovie_id()));
		model.addAttribute("scri", scri);
		
		return "movie_info/updateView";
	}
	
	// ????????? ??????
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("update");
		
		 // ????????? ????????? ?????????????????? ??????
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // ?????? ????????? ??????
		  new File(uploadPath + req.getParameter("movie_img")).delete();
		  new File(uploadPath + req.getParameter("img")).delete();
		  
		  // ?????? ????????? ????????? ??????
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  movie_InfoVO.setMovie_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  movie_InfoVO.setImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  
		  // ????????? ????????? ???????????? ????????????
		  // ?????? ???????????? ????????? ??????
		movie_InfoVO.setMovie_img(req.getParameter("movie_img"));
		movie_InfoVO.setImg(req.getParameter("img"));
		  
		 }
		
		service.update(movie_InfoVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/movie_info/movielist";
	}

	// ????????? ??????
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(movie_InfoVO.getMovie_id());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/movie_info/movielist";
	}
	//????????????
	@RequestMapping(value = "/pushIn", method = RequestMethod.POST)
	public String pushIn(Movie_InfoVO movie_InfoVO, PushVO pushVO, SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("pushIn");
		int movie_id = movie_InfoVO.getMovie_id();
		pushVO.setMovieId(movie_id);
		pushService.pushIn(pushVO);
		
		//????????? ??? ????????????
		model.addAttribute("scri", scri);
		rttr.addAttribute("movie_id", movie_InfoVO.getMovie_id());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/movie_info/readView";
	}
	
	//????????????
	@RequestMapping(value = "/pushOut", method = RequestMethod.POST)
	public String pushOut(Movie_InfoVO movie_InfoVO, PushVO pushVO, SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("pushOut");
		
		//????????? ??? ????????????
		model.addAttribute("scri", scri);
		rttr.addAttribute("movie_id", movie_InfoVO.getMovie_id());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		int movie_id = movie_InfoVO.getMovie_id();
		pushVO.setMovieId(movie_id);
		System.out.println("????????????" + pushVO);
		pushService.pushOut(pushVO);
		
		return "redirect:/movie_info/readView";
	}
	

}