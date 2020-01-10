package com.ezen.jobsearch.category.model;

public class CategoryVO2 {
	private int cateSeq2;
	private String cateName2;
	private String refCateseq;
	
	public int getCateSeq2() {
		return cateSeq2;
	}
	public void setCateSeq2(int cateSeq2) {
		this.cateSeq2 = cateSeq2;
	}
	public String getCateName2() {
		return cateName2;
	}
	public void setCateName2(String cateName2) {
		this.cateName2 = cateName2;
	}
	public String getRefCateseq() {
		return refCateseq;
	}
	public void setRefCateseq(String refCateseq) {
		this.refCateseq = refCateseq;
	}
	
	@Override
	public String toString() {
		return "CategoryVO2 [cateSeq2=" + cateSeq2 + ", cateName2=" + cateName2 + ", refCateseq=" + refCateseq + "]";
	}
	
	
	
	
}
