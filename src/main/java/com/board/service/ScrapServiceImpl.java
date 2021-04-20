package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ScrapDAO;
import com.board.domain.ScrapVO;


@Service
public class ScrapServiceImpl implements ScrapService {
	
	@Inject
	private ScrapDAO dao;
	
	//스크랩 저장
	@Override
	public void scrapIn(ScrapVO scrapVO) throws Exception {
		dao.scrapIn(scrapVO);
		System.out.println(scrapVO);
	}
	
	//스크랩 목록
	@Override
	public List<ScrapVO> scrapList(String userId) throws Exception {
		return dao.scrapList(userId);
	}
	
	//스크랩 삭제
	@Override
	public void scrapDelete(ScrapVO scrapVO) throws Exception {
		dao.scrapDelete(scrapVO);
	}

}
