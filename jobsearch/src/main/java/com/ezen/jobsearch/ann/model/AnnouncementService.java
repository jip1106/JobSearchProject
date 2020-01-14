package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;

public interface AnnouncementService {
	List<HashMap<String,Object>> getAnnListByLoc(String locationSeq1, String locationSeq2,int startRow, int endRow);
	int selectAnnListCount(String locationSeq1,String locationSeq2);
}
