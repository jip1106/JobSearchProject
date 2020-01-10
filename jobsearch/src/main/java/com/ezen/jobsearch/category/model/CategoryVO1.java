package com.ezen.jobsearch.category.model;

public class CategoryVO1 {
	private int cateSeq1;
	private String cateName1;
	
	public int getCateSeq1() {
		return cateSeq1;
	}
	public void setCateSeq1(int cateSeq1) {
		this.cateSeq1 = cateSeq1;
	}
	public String getCateName1() {
		return cateName1;
	}
	public void setCateName1(String cateName1) {
		this.cateName1 = cateName1;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [cateSeq1=" + cateSeq1 + ", cateName1=" + cateName1 + "]";
	}
	
	
}
