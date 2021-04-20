package com.board.dao;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject SqlSession sql;
	
	@Override
	public List<ReplyVO> readReply(int review_id) throws Exception {
		return sql.selectList("replyMapper.readReply", review_id);
	}
	
	@Override
	public void writdReply(ReplyVO vo) throws Exception {
		sql.insert("replyMapper.writeReply", vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply", vo);
	}
	@Override
	public ReplyVO selectReply(int comment_id) throws Exception {
		return sql.selectOne("replyMapper.selectReply", comment_id);
	}

}
