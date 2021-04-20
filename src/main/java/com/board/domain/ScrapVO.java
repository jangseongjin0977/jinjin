package com.board.domain;

public class ScrapVO {
	private int scrapId;
	private String userId;
	private String scrapTitle;
	private String scrapAd;
	
	public ScrapVO() {
		super();
	}

	public ScrapVO(int scrapId, String userId, String scrapTitle, String scrapAd) {
		super();
		this.scrapId = scrapId;
		this.userId = userId;
		this.scrapTitle = scrapTitle;
		this.scrapAd = scrapAd;
	}
	
	public int getScrapId() {
		return scrapId;
	}
	public void setScrapId(int scrapId) {
		this.scrapId = scrapId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getScrapTitle() {
		return scrapTitle;
	}
	public void setScrapTitle(String scrapTitle) {
		this.scrapTitle = scrapTitle;
	}
	public String getScrapAd() {
		return scrapAd;
	}
	public void setScrapAd(String scrapAd) {
		this.scrapAd = scrapAd;
	}
	
	@Override
	public String toString() {
		return "ScrapVO [scrapId=" + scrapId + ", userId=" + userId + ", scrapTitle=" + scrapTitle + ", scrapAd="
				+ scrapAd + "]";
	}
	
}
