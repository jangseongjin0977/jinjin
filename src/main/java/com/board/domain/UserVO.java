package com.board.domain;

import java.sql.Timestamp;

public class UserVO {
	private String userId;
	private String pw;
	private String email;
	private Timestamp memberDate;
	private String mState;



	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}
	public String getmState() {
		return mState;
	}
	public void setmState(String mState) {
		this.mState = mState;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", pw=" + pw + ", email=" + email + ", memberDate=" + memberDate
				+ ", mState=" + mState + ", verify=" + "]";
	}

	
	
}
