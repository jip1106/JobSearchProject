package com.ezen.jobsearch.mycareer.model;



public class MycareerVO {
	private int mycareerSeq;         
	private String careerType;    
	private String preComname;   
	private String preStdt;           
	private String preEndt;            
	private String retireDesc;  
	private String manageDesc;  
	private int refResumeseq;
	
	
	public int getMycareerSeq() {
		return mycareerSeq;
	}

	public void setMycareerSeq(int mycareerSeq) {
		this.mycareerSeq = mycareerSeq;
	}

	public String getCareerType() {
		return careerType;
	}

	public void setCareerType(String careerType) {
		this.careerType = careerType;
	}

	public String getPreComname() {
		return preComname;
	}

	public void setPreComname(String preComname) {
		this.preComname = preComname;
	}

	public String getPreStdt() {
		return preStdt;
	}

	public void setPreStdt(String preStdt) {
		this.preStdt = preStdt;
	}

	public String getPreEndt() {
		return preEndt;
	}

	public void setPreEndt(String preEndt) {
		this.preEndt = preEndt;
	}

	public String getRetireDesc() {
		return retireDesc;
	}

	public void setRetireDesc(String retireDesc) {
		this.retireDesc = retireDesc;
	}

	public String getManageDesc() {
		return manageDesc;
	}

	public void setManageDesc(String manageDesc) {
		this.manageDesc = manageDesc;
	}

	public int getRefResumeseq() {
		return refResumeseq;
	}

	public void setRefResumeseq(int refResumeseq) {
		this.refResumeseq = refResumeseq;
	}

	@Override
	public String toString() {
		return "MycareerVO [mycareerSeq=" + mycareerSeq + ", careerType=" + careerType + ", preComname=" + preComname
				+ ", preStdt=" + preStdt + ", preEndt=" + preEndt + ", retireDesc=" + retireDesc + ", manageDesc="
				+ manageDesc + ", refResumeseq=" + refResumeseq + "]";
	} 
	
	
}
