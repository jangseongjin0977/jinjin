package com.board.service;

import java.sql.Timestamp;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

public interface UserService {
	

	//회원가입처리
	public void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//회원 수정
	public void userUpdate(UserVO userVO) throws Exception;
	
	//아이디 중복 체크
	public int idChk(String userId) throws Exception;

	//회원 탈퇴표시
	public void userBlock(UserVO userVO) throws Exception;
	
	//Xid 로그인 막기
	public int Xid(String userId) throws Exception;
	
	//아이디 찾기
	public String findId(String email) throws Exception;
	
	//이메일 중복체크 
	public int findEmail(String email) throws Exception;
	
	//비밀번호 변경
	public void updatePw(UserVO userVO) throws Exception;
	
//	// 추천 후, 추천 활성화 시간 업데이트
//	public void updateRecommendActiveTime(String userId) throws Exception;
//
//	// 추천 활성화 시간 조회
//	public Timestamp checkRecommendActiveTime(String userId) throws Exception;


}
