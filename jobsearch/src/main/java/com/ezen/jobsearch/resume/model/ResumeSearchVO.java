package com.ezen.jobsearch.resume.model;

public class ResumeSearchVO {
	private String genderType;
	private String eduType;
	private String careerType;
	private String empType;
	private String cateSeq1;
	private String locationSeq1;
	
	public String getGenderType() {
		return genderType;
	}
	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}
	public String getEduType() {
		return eduType;
	}
	public void setEduType(String eduType) {
		this.eduType = eduType;
	}
	public String getCareerType() {
		return careerType;
	}
	public void setCareerType(String careerType) {
		this.careerType = careerType;
	}
	public String getEmpType() {
		return empType;
	}
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	public String getCateSeq1() {
		return cateSeq1;
	}
	public void setCateSeq1(String cateSeq1) {
		this.cateSeq1 = cateSeq1;
	}
	public String getLocationSeq1() {
		return locationSeq1;
	}
	public void setLocationSeq1(String locationSeq1) {
		this.locationSeq1 = locationSeq1;
	}
	
	@Override
	public String toString() {
		return "ResumeSearchVO [genderType=" + genderType + ", eduType=" + eduType + ", careerType=" + careerType
				+ ", empType=" + empType + ", cateSeq1=" + cateSeq1 + ", locationSeq1=" + locationSeq1 + "]";
	}
	
	
	
	
}
