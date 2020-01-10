package com.ezen.jobsearch.location.model;

import java.util.List;

public interface LocationDAO {
	List<LocationVO1> selectLocation1();
	List<LocationVO2> selectSubLocList(String locationSeq1);
	
}
