package com.board.domain;

import java.sql.Timestamp;

public class RboardVO {

		private int review_id;
		private int movie_id;
		private String user_id;
		private String review_title;
		private String review_content;
		private Timestamp review_date;
		private int review_views;
		private int total_push;
		private String review_img;
		private String thumbimg;
		
		public String getReview_img() {
			return review_img;
		}
		public void setReview_img(String review_img) {
			this.review_img = review_img;
		}
		public String getThumbimg() {
			return thumbimg;
		}
		public void setThumbimg(String thumbimg) {
			this.thumbimg = thumbimg;
		}
		public int getReview_id() {
			return review_id;
		}
		public void setReview_id(int review_id) {
			this.review_id = review_id;
		}
		public int getMovie_id() {
			return movie_id;
		}
		public void setMovie_id(int movie_id) {
			this.movie_id = movie_id;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getReview_title() {
			return review_title;
		}
		public void setReview_title(String review_title) {
			this.review_title = review_title;
		}
		public String getReview_content() {
			return review_content;
		}
		public void setReview_content(String review_content) {
			this.review_content = review_content;
		}
		public Timestamp getReview_date() {
			return review_date;
		}
		public void setReview_date(Timestamp review_date) {
			this.review_date = review_date;
		}
		public int getReview_views() {
			return review_views;
		}
		public void setReview_views(int review_views) {
			this.review_views = review_views;
		}
		public int getTotal_push() {
			return total_push;
		}
		public void setTotal_push(int total_push) {
			this.total_push = total_push;
		}
		@Override
		public String toString() {
			return "RboardVO [review_id=" + review_id + ", movie_id=" + movie_id + ", user_id=" + user_id
					+ ", review_title=" + review_title + ", review_content=" + review_content + ", review_date="
					+ review_date + ", review_views=" + review_views + ", total_push=" + total_push + ", review_img="
					+ review_img + ", thumbimg=" + thumbimg + "]";
		}
		
		
	
		
}
