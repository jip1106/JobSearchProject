package com.ezen.jobsearch.resume.model;

import java.sql.Timestamp;

public class ResumeVO {
	private int resumeSeq;        
	private String resumeTitle; 
	private Timestamp regDate;          
	private String resumeStatus;    
	private String recuritStatus;   
	private String introduceTitle; 
	private String introduceDesc;          
	private int refMemberseq;
	public int getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getResumeStatus() {
		return resumeStatus;
	}
	public void setResumeStatus(String resumeStatus) {
		this.resumeStatus = resumeStatus;
	}
	public String getRecuritStatus() {
		return recuritStatus;
	}
	public void setRecuritStatus(String recuritStatus) {
		this.recuritStatus = recuritStatus;
	}
	public String getIntroduceTitle() {
		return introduceTitle;
	}
	public void setIntroduceTitle(String introduceTitle) {
		this.introduceTitle = introduceTitle;
	}
	public String getIntroduceDesc() {
		return introduceDesc;
	}
	public void setIntroduceDesc(String introduceDesc) {
		this.introduceDesc = introduceDesc;
	}
	public int getRefMemberseq() {
		return refMemberseq;
	}
	public void setRefMemberseq(int refMemberseq) {
		this.refMemberseq = refMemberseq;
	}
	@Override
	public String toString() {
		return "ResumeVO [resumeSeq=" + resumeSeq + ", resumeTitle=" + resumeTitle + ", regDate=" + regDate
				+ ", resumeStatus=" + resumeStatus + ", recuritStatus=" + recuritStatus + ", introduceTitle="
				+ introduceTitle + ", introduceDesc=" + introduceDesc + ", refMemberseq=" + refMemberseq + "]";
	}        
	

}
