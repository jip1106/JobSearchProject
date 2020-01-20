package com.ezen.jobsearch.viewann.model;

import java.sql.Timestamp;

public class ViewAnnVO {
	private int viewSeq;
	private int refAnnseq;
	private int refMemberseq;
	private Timestamp regDate;
	
	public int getViewSeq() {
		return viewSeq;
	}
	public void setViewSeq(int viewSeq) {
		this.viewSeq = viewSeq;
	}
	public int getRefAnnseq() {
		return refAnnseq;
	}
	public void setRefAnnseq(int refAnnseq) {
		this.refAnnseq = refAnnseq;
	}
	public int getRefMemberseq() {
		return refMemberseq;
	}
	public void setRefMemberseq(int refMemberseq) {
		this.refMemberseq = refMemberseq;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ViewAnnVO [viewSeq=" + viewSeq + ", refAnnseq=" + refAnnseq + ", refMemberseq=" + refMemberseq
				+ ", regDate=" + regDate + "]";
	}
	
	
}
