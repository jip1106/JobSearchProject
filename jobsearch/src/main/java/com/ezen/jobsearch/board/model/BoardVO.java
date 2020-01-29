package com.ezen.jobsearch.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int boardSeq;
	private String boardType;
	private String boardTitle;
	private String boardContents;
	private int hits;
	private Timestamp regDate;
	private int refMemberseq;
	private String memberId;
	

	
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
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
	public int getRefMemberseq() {
		return refMemberseq;
	}
	public void setRefMemberseq(int refMemberseq) {
		this.refMemberseq = refMemberseq;
	}
	@Override
	public String toString() {
		return "BoardVO [boardSeq=" + boardSeq + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", hits=" + hits + ", regDate=" + regDate + ", refMemberseq="
				+ refMemberseq + "]";
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}		
}
