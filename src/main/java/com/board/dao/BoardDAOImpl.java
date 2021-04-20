package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.board.domain.RboardVO;
import com.board.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	 @Inject
	 private SqlSession sql;
	 
	
	 // 게시물 목록
	 @Override
	 public List<RboardVO> list(SearchCriteria scri) throws Exception { 
	  
	  return sql.selectList("boardMapper.listPage", scri);
	  
	  }
	 
	 @Override
	 public int listCount(SearchCriteria scri) throws Exception { 
	  
	  return sql.selectOne("boardMapper.listCount", scri);
	  
	  }
	  
	  @Override
	  public RboardVO read(int review_id) throws Exception {
	  		
	  	return sql.selectOne("boardMapper.read", review_id);
 }

		@Override
		public void write(RboardVO boardVO) throws Exception {
			sql.insert("boardMapper.insert", boardVO);
		}
		
		// 게시물 수정
		@Override
		public void update(RboardVO boardVO) throws Exception {
			
			sql.update("boardMapper.update", boardVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int review_id) throws Exception {
			
			sql.delete("boardMapper.delete", review_id);
		}
		
		@Override
		public void boardHit(int review_id) throws Exception {
			// TODO Auto-generated method stub
			sql.update("boardMapper.boardHit", review_id);
		}
		
		 @Override
		    public void recommend(int review_id) throws Exception {
		        
		        sql.update("boardMapper.recommend", review_id);
		    }
}