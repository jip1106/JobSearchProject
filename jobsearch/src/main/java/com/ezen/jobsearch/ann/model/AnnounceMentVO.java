package com.ezen.jobsearch.ann.model;

import java.sql.Timestamp;

public class AnnounceMentVO {
	 private int annSeq;	//시퀀스
	 private String annTitle;  //공고제목
	 private String annDesc;   //공고내용
	 private Timestamp annStdt; //공고게시시작일
	 private Timestamp annEddt; //공고게시마감일
	 private String careerType; //경력
	 private String careerDesc; //경력추가
	 private String employType; //근로형태
	 private String salary;		//급료
	 private String ageLimit;	//연령제한
	 private int hits;			//조회수
	 private Timestamp regDate;	//작성일
	 private int refCateseq1;	//직종카테고리1
	 private int refCateseq2;	//직종카테고리2
	 private int refCateseq3;	//직종카테고리3
	 private int refLocationseq1;//지역카테고리1
	 private int refLocationseq2;//지역카테고리2
	 private int refCompanyseq;//작성회사 고유시퀀스
	 
	 
	public int getAnnSeq() {
		return annSeq;
	}
	public void setAnnSeq(int annSeq) {
		this.annSeq = annSeq;
	}
	public String getAnnTitle() {
		return annTitle;
	}
	public void setAnnTitle(String annTitle) {
		this.annTitle = annTitle;
	}
	public String getAnnDesc() {
		return annDesc;
	}
	public void setAnnDesc(String annDesc) {
		this.annDesc = annDesc;
	}
	public Timestamp getAnnStdt() {
		return annStdt;
	}
	public void setAnnStdt(Timestamp annStdt) {
		this.annStdt = annStdt;
	}
	public Timestamp getAnnEddt() {
		return annEddt;
	}
	public void setAnnEddt(Timestamp annEddt) {
		this.annEddt = annEddt;
	}
	public String getCareerType() {
		return careerType;
	}
	public void setCareerType(String careerType) {
		this.careerType = careerType;
	}
	public String getCareerDesc() {
		return careerDesc;
	}
	public void setCareerDesc(String careerDesc) {
		this.careerDesc = careerDesc;
	}
	public String getEmployType() {
		return employType;
	}
	public void setEmployType(String employType) {
		this.employType = employType;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
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
	public int getRefCateseq3() {
		return refCateseq3;
	}
	public void setRefCateseq3(int refCateseq3) {
		this.refCateseq3 = refCateseq3;
	}
	public int getRefLocationseq1() {
		return refLocationseq1;
	}
	public void setRefLocationseq1(int refLocationseq1) {
		this.refLocationseq1 = refLocationseq1;
	}
	public int getRefLocationseq2() {
		return refLocationseq2;
	}
	public void setRefLocationseq2(int refLocationseq2) {
		this.refLocationseq2 = refLocationseq2;
	}
	public int getRefCompanyseq() {
		return refCompanyseq;
	}
	public void setRefCompanyseq(int refCompanyseq) {
		this.refCompanyseq = refCompanyseq;
	}
	@Override
	public String toString() {
		return "AnnounceMentVO [annSeq=" + annSeq + ", annTitle=" + annTitle + ", annDesc=" + annDesc + ", annStdt="
				+ annStdt + ", annEddt=" + annEddt + ", careerType=" + careerType + ", careerDesc=" + careerDesc
				+ ", employType=" + employType + ", salary=" + salary + ", ageLimit=" + ageLimit + ", hits=" + hits
				+ ", regDate=" + regDate + ", refCateseq1=" + refCateseq1 + ", refCateseq2=" + refCateseq2
				+ ", refCateseq3=" + refCateseq3 + ", refLocationseq1=" + refLocationseq1 + ", refLocationseq2="
				+ refLocationseq2 + ", refCompanyseq=" + refCompanyseq + "]";
	}
	 
	 
	 
	
}