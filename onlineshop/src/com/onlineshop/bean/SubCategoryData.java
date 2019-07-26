package com.onlineshop.bean;

public class SubCategoryData {
	private int subCatId;
	private String subCatName;
	private String catName;
	private String subCatStatus;
	private int catId;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public SubCategoryData() {
		
	}
	public SubCategoryData(int subCatId, String subCatName, String catName, String subCatStatus) {
		this.subCatId = subCatId;
		this.subCatName = subCatName;
		this.subCatStatus = subCatStatus;
//		this(subCatId,subCatName,subCatStatus);
		this.catName = catName;

		
	}
	
	
	
	public SubCategoryData(int subCatId, String subCatName, String subCatStatus, int catId) {
		super();
		this.subCatId = subCatId;
		this.subCatName = subCatName;
		this.subCatStatus = subCatStatus;
		this.catId = catId;
 	}
	public int getSubCatId() {
		return subCatId;
	}
	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}
	

	public String getSubCatName() {
		return subCatName;
	}
	public void setSubCatName(String subCatName) {
		this.subCatName = subCatName;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getSubCatStatus() {
		return subCatStatus;
	}
	public void setSubCatStatus(String subCatStatus) {
		this.subCatStatus = subCatStatus;
	}


}
