package com.board.dao;

import java.sql.Timestamp;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

public interface UserDAO {
	
	// 회원가입
	public void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//회원정보 수정
	public void userUpdate(UserVO userVO) throws Exception;
	
	//아이디 중복체크
	public int idChk(String userId) throws Exception;
	
	//회원탈퇴 표시
	public void userBlock(UserVO userVO) throws Exception;
	
	//Xjoin 계정 로그인 금지
	public int Xid(String userId) throws Exception;
	
	//아이디 찾기
	public String findId(String email) throws Exception;
	
	//이메일 중복체크
	public int findEmail(String email) throws Exception;
	
	//비밀번호 변경
	public void updatePw(UserVO userVO) throws Exception;
	
}
