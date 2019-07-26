package com.onlineshop.bean;

public class CategoryData {
	private int catId;
	private String catName;
	private String catStatus;

	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatStatus() {
		return catStatus;
	}
	public void setCatStatus(String catStatus) {
		System.out.println(catStatus +" is set");
		this.catStatus = catStatus;
	}
	public CategoryData() {

	}
	public CategoryData(int catId, String catName, String catStatus) {

		this.catId = catId;
		this.catName = catName;
		this.catStatus = catStatus;
		System.out.println(catStatus +" is set");
	}
}
