package com.board.domain;

public class LoginDTO {
	private String userId;
	private String pw;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", pw=" + pw + ", useCookie=" + useCookie + "]";
	}
	
	
}
