package com.ezen.jobsearch.hopework.model;

public class HopeworkVO {
	private int hopeworkSeq;        
	private String hopeEmptype; 
	private String hopeSalary; 
	private int refLocationseq;        
	private int refCategory1;        
	private int refResumeseq;
	
	public int getHopeworkSeq() {
		return hopeworkSeq;
	}
	public void setHopeworkSeq(int hopeworkSeq) {
		this.hopeworkSeq = hopeworkSeq;
	}
	public String getHopeEmptype() {
		return hopeEmptype;
	}
	public void setHopeEmptype(String hopeEmptype) {
		this.hopeEmptype = hopeEmptype;
	}
	public String getHopeSalary() {
		return hopeSalary;
	}
	public void setHopeSalary(String hopeSalary) {
		this.hopeSalary = hopeSalary;
	}
	public int getRefLocationseq() {
		return refLocationseq;
	}
	public void setRefLocationseq(int refLocationseq) {
		this.refLocationseq = refLocationseq;
	}
	public int getRefCategory1() {
		return refCategory1;
	}
	public void setRefCategory1(int refCategory1) {
		this.refCategory1 = refCategory1;
	}
	public int getRefResumeseq() {
		return refResumeseq;
	}
	public void setRefResumeseq(int refResumeseq) {
		this.refResumeseq = refResumeseq;
	}
	@Override
	public String toString() {
		return "HopeworkVO [hopeworkSeq=" + hopeworkSeq + ", hopeEmptype=" + hopeEmptype + ", hopeSalary=" + hopeSalary
				+ ", refLocationseq=" + refLocationseq + ", refCategory1=" + refCategory1 + ", refResumeseq="
				+ refResumeseq + "]";
	}
	
	
	
}
