package com.kh.onebite.recipeLink.model.vo;

import java.sql.Date;

public class Cart {
	
	private String cIdx;
	private String userId;
	private String itemNumber;
	private Date itemDate;
	private int itemCnt;
	private Recipe recipe;
	
	public String getcIdx() {
		return cIdx;
	}
	
	public void setcIdx(String cIdx) {
		this.cIdx = cIdx;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getItemNumber() {
		return itemNumber;
	}
	
	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}
	
	public Date getItemDate() {
		return itemDate;
	}
	
	public void setItemDate(Date itemDate) {
		this.itemDate = itemDate;
	}
	
	public int getItemCnt() {
		return itemCnt;
	}
	
	public void setItemCnt(int itemCnt) {
		this.itemCnt = itemCnt;
	}
	
	public Recipe getRecipe() {
		return recipe;
	}
	
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	
	@Override
	public String toString() {
		return "Cart [cIdx=" + cIdx + ", userId=" + userId + ", itemNumber=" + itemNumber + ", itemDate=" + itemDate
				+ ", itemCnt=" + itemCnt + ", recipe=" + recipe + "]";
	}
	
	
	
}
