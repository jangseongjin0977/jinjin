package com.board.dao;

import java.util.List;


import com.board.domain.RboardVO;
import com.board.domain.SearchCriteria;

public interface BoardDAO {
 
	public List<RboardVO> list(SearchCriteria scri) throws Exception; 
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public RboardVO read(int review_id) throws Exception;
	
	public void write(RboardVO boardVO) throws Exception;
	
	// 게시물 수정
	public void update(RboardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int review_id) throws Exception;
	
	// 게시판 조회수
	public void boardHit(int review_id) throws Exception;
	
	public void recommend(int review_id) throws Exception;

}