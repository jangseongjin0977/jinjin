

package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;

import com.board.domain.SearchCriteria;



public interface Movie_InfoDAO {
	
	// 게시물 리스트
	public List<Movie_InfoVO> movielist(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 추가하기
	public void write(Movie_InfoVO movie_InfoVO) throws Exception;
	
	// 게시물 목록 조회
	public Movie_InfoVO read(int movie_id) throws Exception;
	
	// 게시물 삭제
	public void delete(int movie_id) throws Exception;
	
	// 게시물 수정
	public void update(Movie_InfoVO movie_infoVO) throws Exception;
	
	// 게시물 조회수
	public void movieviews(int movie_id) throws Exception;
	


}


