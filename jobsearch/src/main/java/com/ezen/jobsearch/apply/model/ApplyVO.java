package com.ezen.jobsearch.apply.model;

import java.sql.Timestamp;

public class ApplyVO {
	private int applySeq;
	private String openFlag;
	private int refAnnseq;
	private int refResumeseq;
	private Timestamp regDate;
	
	public int getApplySeq() {
		return applySeq;
	}
	public void setApplySeq(int applySeq) {
		this.applySeq = applySeq;
	}
	public String getOpenFlag() {
		return openFlag;
	}
	public void setOpenFlag(String openFlag) {
		this.openFlag = openFlag;
	}
	public int getRefAnnseq() {
		return refAnnseq;
	}
	public void setRefAnnseq(int refAnnseq) {
		this.refAnnseq = refAnnseq;
	}
	public int getRefResumeseq() {
		return refResumeseq;
	}
	public void setRefResumeseq(int refResumeseq) {
		this.refResumeseq = refResumeseq;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ApplyVO [applySeq=" + applySeq + ", openFlag=" + openFlag + ", refAnnseq=" + refAnnseq
				+ ", refResumeseq=" + refResumeseq + ", regDate=" + regDate + "]";
	}
	
	
}
