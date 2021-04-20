package com.board.dao;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.board.mappers.UserMapper" ;
	private final SqlSession sql;
	
	@Inject 
	public UserDAOImpl(SqlSession sql) {
		this.sql = sql;
	}
	
	// 회원가입
	@Override
	public void register(UserVO userVO) throws Exception {
		sql.insert(namespace + ".register", userVO);
	}
	
	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO)  throws Exception {
		return sql.selectOne(namespace + ".login", loginDTO);
	}
	
	//회원정보 수정
	@Override
	public void userUpdate(UserVO userVO) throws Exception {
		sql.update(namespace + ".userUpdate", userVO);
	}
	
	//아이디 중복체크 
	@Override
	public int idChk(String userId) throws Exception {
		int result = sql.selectOne(namespace + ".idChk", userId);
		return result;
	}
	
	//회원탈퇴 표시
	@Override
	public void userBlock(UserVO userVO) throws Exception {
		sql.update(namespace + ".userBlock", userVO);
	}
	
	//Xid 로그인 막기
	@Override
	public int Xid(String userId)   throws Exception {
		int result = sql.selectOne(namespace + ".Xid", userId);
		return result;
	}
	
	//아이디 찾기
	@Override
	public String findId(String email) throws Exception {
		String result = sql.selectOne(namespace + ".findId", email);
		return result;
	}
	
	//이메일 중복체크
	@Override
	public int findEmail(String email) throws Exception {
		int result = sql.selectOne(namespace + ".findEmail", email);
		return result;
	}
	
	//비밀번호 변경
	@Override
	public void updatePw(UserVO userVO) throws Exception {
		sql.update(namespace + ".updatePw", userVO);
	}

}
