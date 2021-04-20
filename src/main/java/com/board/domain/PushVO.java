package com.board.domain;

public class PushVO {
	private int movieId;
	private int pushNo;
	private String userId;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getPushNo() {
		return pushNo;
	}
	public void setPushNo(int pushNo) {
		this.pushNo = pushNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "PushVO [movieId=" + movieId + ", pushNo=" + pushNo + ", userId=" + userId + "]";
	}
	
}