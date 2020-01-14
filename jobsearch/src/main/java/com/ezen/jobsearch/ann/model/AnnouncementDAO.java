package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;

public interface AnnouncementDAO {
	List<HashMap<String,Object>> getAnnListByLoc(String locationSeq1, String locationSeq2);
	
	
}
