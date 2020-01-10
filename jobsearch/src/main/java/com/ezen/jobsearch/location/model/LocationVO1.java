package com.ezen.jobsearch.location.model;

public class LocationVO1 {
	private int locationSeq1;
	private String locationName;
	
	public int getLocationSeq1() {
		return locationSeq1;
	}
	public void setLocationSeq1(int locationSeq1) {
		this.locationSeq1 = locationSeq1;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	@Override
	public String toString() {
		return "LocationVO1 [locationSeq1=" + locationSeq1 + ", locationName=" + locationName + "]";
	}
	
	
	
}
