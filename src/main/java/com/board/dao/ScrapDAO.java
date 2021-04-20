package com.board.dao;

import java.util.List;

import com.board.domain.ScrapVO;

public interface ScrapDAO {
	
	//스크랩 저장
	public void scrapIn(ScrapVO scrapVO) throws Exception;
	
	//스크랩 목록
	public List<ScrapVO> scrapList(String userId) throws Exception;
	
	//스크랩 삭제
	public void scrapDelete(ScrapVO scrapVO) throws Exception;
}
