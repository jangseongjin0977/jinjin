package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;

import com.board.domain.SearchCriteria;


@Repository
public class Movie_InfoDAOImpl implements Movie_InfoDAO {


	@Inject
	SqlSessionTemplate sql;

	private static String namespace = "com.board.mappers.board";

	// 게시물 목록 조회
	@Override
	public List<Movie_InfoVO> movielist(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".listCount", scri);

	}

	@Override
	public void write(Movie_InfoVO movie_InfoVO) throws Exception {
		sql.insert( namespace + ".insert", movie_InfoVO);
		
	}

	@Override
	public Movie_InfoVO read(int movie_id) throws Exception {
		
		return sql.selectOne( namespace + ".read", movie_id);
	}

	@Override
	public void delete(int movie_id) throws Exception {
		sql.delete( namespace + ".delete", movie_id);
		
	}

	@Override
	public void update(Movie_InfoVO movie_infoVO) throws Exception {
		sql.update( namespace + ".update", movie_infoVO);
		
	}

	@Override
	public void movieviews(int movie_id) throws Exception {
		sql.update( namespace + ".movieviews", movie_id);
		
	}





}