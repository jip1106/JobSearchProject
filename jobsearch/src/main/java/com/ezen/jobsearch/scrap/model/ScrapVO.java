package com.ezen.jobsearch.scrap.model;

import java.sql.Timestamp;

public class ScrapVO {
	private int scrapSeq;
	private int refAnnseq;
	private int refMemberseq;
	private Timestamp regDate;
	
	public int getScrapSeq() {
		return scrapSeq;
	}
	public void setScrapSeq(int scrapSeq) {
		this.scrapSeq = scrapSeq;
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
		return "ScrapVO [scrapSeq=" + scrapSeq + ", refAnnseq=" + refAnnseq + ", refMemberseq=" + refMemberseq
				+ ", regDate=" + regDate + "]";
	}
	
	
}
