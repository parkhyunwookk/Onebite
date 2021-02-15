package com.kh.onebite.recipeLink.model.vo;

public class Recipe {
	
	private String rcpitemNumber;
	private String rcpTitle;
	private int rcpPrice;
	private int rcpCnt;
	
	public String getRcpitemNumber() {
		return rcpitemNumber;
	}
	
	public void setRcpitemNumber(String rcpitemNumber) {
		this.rcpitemNumber = rcpitemNumber;
	}
	
	public String getRcpTitle() {
		return rcpTitle;
	}
	
	public void setRcpTitle(String rcpTitle) {
		this.rcpTitle = rcpTitle;
	}
	
	public int getRcpPrice() {
		return rcpPrice;
	}
	
	public void setRcpPrice(int rcpPrice) {
		this.rcpPrice = rcpPrice;
	}
	
	public int getRcpCnt() {
		return rcpCnt;
	}
	
	public void setRcpCnt(int rcpCnt) {
		this.rcpCnt = rcpCnt;
	}
	
	@Override
	public String toString() {
		return "Recipe [rcpitemNumber=" + rcpitemNumber + ", rcpTitle=" + rcpTitle + ", rcpPrice=" + rcpPrice
				+ ", rcpCnt=" + rcpCnt + "]";
	}
	
	
}
