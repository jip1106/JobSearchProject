package com.ezen.jobsearch.location.model;

import java.util.List;

public interface LocationService {
	List<LocationVO1> selectLocation1();

	//ajax로 두번쨰 지역 리스트 가져오기
	List<LocationVO2> selectSubLocList(String locationSeq1);
}
