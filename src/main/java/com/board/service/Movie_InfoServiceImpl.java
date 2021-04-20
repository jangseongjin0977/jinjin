package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dao.Movie_InfoDAO;
import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;

import com.board.domain.SearchCriteria;



@Service
public class Movie_InfoServiceImpl implements Movie_InfoService {

	@Inject
	Movie_InfoDAO dao;
	 
	@Override
	 public List<Movie_InfoVO> movielist(SearchCriteria scri) throws Exception {
	
	  return dao.movielist(scri);
	 }

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public void write(Movie_InfoVO movie_InfoVO) throws Exception {
		dao.write(movie_InfoVO);
		
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Movie_InfoVO read(int movie_id) throws Exception {
		dao.movieviews(movie_id);
		return dao.read(movie_id);
	}

	@Override
	public void delete(int movie_id) throws Exception {
		dao.delete(movie_id);
		
	}

	@Override
	public void update(Movie_InfoVO movie_InfoVO) throws Exception {
		dao.update(movie_InfoVO);
			
	}





}