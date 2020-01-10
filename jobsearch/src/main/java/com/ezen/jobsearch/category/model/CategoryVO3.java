package com.ezen.jobsearch.category.model;

public class CategoryVO3 {
	private int cateSeq3;
	private String cateName3;
	private int refCateseq1;
	private int refCateseq2;
	public int getCateSeq3() {
		return cateSeq3;
	}
	public void setCateSeq3(int cateSeq3) {
		this.cateSeq3 = cateSeq3;
	}
	public String getCateName3() {
		return cateName3;
	}
	public void setCateName3(String cateName3) {
		this.cateName3 = cateName3;
	}
	public int getRefCateseq1() {
		return refCateseq1;
	}
	public void setRefCateseq1(int refCateseq1) {
		this.refCateseq1 = refCateseq1;
	}
	public int getRefCateseq2() {
		return refCateseq2;
	}
	public void setRefCateseq2(int refCateseq2) {
		this.refCateseq2 = refCateseq2;
	}
	
	@Override
	public String toString() {
		return "CategoryVO3 [cateSeq3=" + cateSeq3 + ", cateName3=" + cateName3 + ", refCateseq1=" + refCateseq1
				+ ", refCateseq2=" + refCateseq2 + "]";
	}
	
	
}
