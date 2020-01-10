package com.ezen.jobsearch.location.model;

public class LocationVO2 {
	
	private int locationSeq2;
	private String locationName2;
	private int refLocationseq;
	
	public int getLocationSeq2() {
		return locationSeq2;
	}

	public void setLocationSeq2(int locationSeq2) {
		this.locationSeq2 = locationSeq2;
	}

	public String getLocationName2() {
		return locationName2;
	}

	public void setLocationName2(String locationName2) {
		this.locationName2 = locationName2;
	}

	public int getRefLocationseq() {
		return refLocationseq;
	}

	public void setRefLocationseq(int refLocationseq) {
		this.refLocationseq = refLocationseq;
	}

	@Override
	public String toString() {
		return "LocationVO2 [locationSeq2=" + locationSeq2 + ", locationName2=" + locationName2 + ", refLocationseq="
				+ refLocationseq + "]";
	}
	
	
	
}
