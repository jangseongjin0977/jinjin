package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ScrapVO;


@Repository
public class ScrapDAOImpl implements ScrapDAO {
	
	private static final String namespace = "scrapMapper" ;
	
	@Inject
	private SqlSession sqlSession;
	
	//스크랩 저장
	@Override
	public void scrapIn(ScrapVO scrapVO) throws Exception {
		sqlSession.insert(namespace + ".scrapIn", scrapVO);
	}
	
	//스크랩 목록
	@Override
	public List<ScrapVO> scrapList(String userId) throws Exception {
		return sqlSession.selectList(namespace + ".scrapList", userId);
	}
	
	//스크랩 삭제
	@Override
	public void scrapDelete(ScrapVO scrapVO) throws Exception {
		sqlSession.delete(namespace + ".scrapDelete", scrapVO);
	}

}