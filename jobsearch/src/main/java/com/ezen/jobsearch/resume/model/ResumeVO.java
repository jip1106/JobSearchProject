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
	private Timestamp applyRegdate;
	private String profileRenameimg; 
	private String memberName;
	private String genderType;
	private String memberAge;
	private String memberId;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGenderType() {
		return genderType;
	}
	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}
	public int getResumeSeq() {
		return resumeSeq;
	}
	public String getProfileRenameimg() {
		return profileRenameimg;
	}
	public void setProfileRenameimg(String profileRenameimg) {
		this.profileRenameimg = profileRenameimg;
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
	public Timestamp getApplyRegdate() {
		return applyRegdate;
	}
	public void setApplyRegdate(Timestamp applyRegdate) {
		this.applyRegdate = applyRegdate;
	}
	@Override
	public String toString() {
		return "ResumeVO [resumeSeq=" + resumeSeq + ", resumeTitle=" + resumeTitle + ", regDate=" + regDate
				+ ", resumeStatus=" + resumeStatus + ", recuritStatus=" + recuritStatus + ", introduceTitle="
				+ introduceTitle + ", introduceDesc=" + introduceDesc + ", refMemberseq=" + refMemberseq
				+ ", applyRegdate=" + applyRegdate + ", profileRenameimg=" + profileRenameimg + ", memberName="
				+ memberName + ", genderType=" + genderType + ", memberAge=" + memberAge + ", memberId=" + memberId
				+ "]";
	}
	    
	
}
