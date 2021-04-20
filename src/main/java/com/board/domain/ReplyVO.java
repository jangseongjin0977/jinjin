package com.board.domain;

import java.sql.Timestamp;

public class ReplyVO {
	private int comment_id;
	private int review_id;
	private String user_id;
	private String comment_content;
	private Timestamp comment_date;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [comment_id=" + comment_id + ", review_id=" + review_id + ", user_id=" + user_id
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + "]";
	}
	
	
}
