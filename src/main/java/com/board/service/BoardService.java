package com.board.service;


import java.util.List;

import javax.servlet.http.HttpSession;
import com.board.domain.SearchCriteria;

import com.board.domain.RboardVO;

public interface BoardService {
	public List<RboardVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 목록 조회
	public RboardVO read(int review_id) throws Exception;
	
	
	public void write(RboardVO boardVO) throws Exception;
	
	// 게시물 수정
	public void update(RboardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int review_id) throws Exception;

	public void boardHit(int review_id, HttpSession session) throws Exception;
	
	public void recommend(int review_id) throws Exception;
}
