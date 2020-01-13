package com.ezen.jobsearch.emptype.model;

public class EmpTypeVO {
	private int empSeq;
	private String empName;
	private String empType;
	
	public int getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(int empSeq) {
		this.empSeq = empSeq;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpType() {
		return empType;
	}
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	@Override
	public String toString() {
		return "EmpTypeVO [empSeq=" + empSeq + ", empName=" + empName + ", empType=" + empType + "]";
	}
	
	
	
}
