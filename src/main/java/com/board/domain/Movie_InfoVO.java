package com.board.domain;

import java.sql.Timestamp;

public class Movie_InfoVO {
	private int movie_id;
	private String category_id;
	private String user_id;
	private String movie_title;
	private String movie_content;
	private String movie_img;
	private Timestamp movie_date;
	private int movie_views;
	private int pushno;
	
	private String Img;

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public String getMovie_img() {
		return movie_img;
	}

	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
	}

	public Timestamp getMovie_date() {
		return movie_date;
	}

	public void setMovie_date(Timestamp movie_date) {
		this.movie_date = movie_date;
	}

	public int getMovie_views() {
		return movie_views;
	}

	public void setMovie_views(int movie_views) {
		this.movie_views = movie_views;
	}

	public int getPushno() {
		return pushno;
	}

	public void setPushno(int pushno) {
		this.pushno = pushno;
	}

	public String getImg() {
		return Img;
	}

	public void setImg(String img) {
		Img = img;
	}

	@Override
	public String toString() {
		return "Movie_InfoVO [movie_id=" + movie_id + ", category_id=" + category_id + ", user_id=" + user_id
				+ ", movie_title=" + movie_title + ", movie_content=" + movie_content + ", movie_img=" + movie_img
				+ ", movie_date=" + movie_date + ", movie_views=" + movie_views + ", pushno=" + pushno + ", Img=" + Img
				+ "]";
	}


	
}
