package com.board.service;

import java.util.List;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int review_id) throws Exception {
		return dao.readReply(review_id);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writdReply(vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	@Override
	public ReplyVO selectReply(int comment_id) throws Exception {
		return dao.selectReply(comment_id);
	}
}
