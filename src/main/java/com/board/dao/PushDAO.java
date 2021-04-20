package com.board.dao;

import com.board.domain.PushVO;

public interface PushDAO {
	
	//추천하기
	public void pushIn(PushVO pushVO) throws Exception;
	
	//추천글 확인
	public int pushCheck(PushVO pushVO) throws Exception;
	
	//총 추천수
	public int totalPush(PushVO pushVO) throws Exception;
	
	//추천회수
	public void pushOut(PushVO pushVO) throws Exception;
	
}
