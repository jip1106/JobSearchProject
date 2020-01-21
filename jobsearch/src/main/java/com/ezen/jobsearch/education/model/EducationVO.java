package com.ezen.jobsearch.education.model;

import java.util.List;

public class EducationVO {
	private int eduSeq;        
	private String eduType;   
	private String eduName; 
	private String periodStdt;          
	private String periodEndt;          
	private String univType;   
	private String univScore; 
	private String univMajor; 
	private int refResumeseq;
	private String lastEducation;
	
	private List<EducationVO> educationVOList;
	
	public int getEduSeq() {
		return eduSeq;
	}
	public void setEduSeq(int eduSeq) {
		this.eduSeq = eduSeq;
	}
	public String getEduType() {
		return eduType;
	}
	public void setEduType(String eduType) {
		this.eduType = eduType;
	}
	public String getEduName() {
		return eduName;
	}
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}
	public String getPeriodStdt() {
		return periodStdt;
	}
	public void setPeriodStdt(String periodStdt) {
		this.periodStdt = periodStdt;
	}
	public String getPeriodEndt() {
		return periodEndt;
	}
	public void setPeriodEndt(String periodEndt) {
		this.periodEndt = periodEndt;
	}
	public String getUnivType() {
		return univType;
	}
	public void setUnivType(String univType) {
		this.univType = univType;
	}
	public String getUnivScore() {
		return univScore;
	}
	public void setUnivScore(String univScore) {
		this.univScore = univScore;
	}
	public String getUnivMajor() {
		return univMajor;
	}
	public void setUnivMajor(String univMajor) {
		this.univMajor = univMajor;
	}
	public int getRefResumeseq() {
		return refResumeseq;
	}
	public void setRefResumeseq(int refResumeseq) {
		this.refResumeseq = refResumeseq;
	}
	
	
	public List<EducationVO> getEducationVOList() {
		return educationVOList;
	}
	public void setEducationVOList(List<EducationVO> educationVOList) {
		this.educationVOList = educationVOList;
	}
	
	
	public String getLastEducation() {
		return lastEducation;
	}
	public void setLastEducation(String lastEducation) {
		this.lastEducation = lastEducation;
	}
	
	@Override
	public String toString() {
		return "EducationVO [eduSeq=" + eduSeq + ", eduType=" + eduType + ", eduName=" + eduName + ", periodStdt="
				+ periodStdt + ", periodEndt=" + periodEndt + ", univType=" + univType + ", univScore=" + univScore
				+ ", univMajor=" + univMajor + ", refResumeseq=" + refResumeseq + ", lastEducation=" + lastEducation
				+ ", educationVOList=" + educationVOList + "]";
	}
	

	
	
	
	
	
	
}
