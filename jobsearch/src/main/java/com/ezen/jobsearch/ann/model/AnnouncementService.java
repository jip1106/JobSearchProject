package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AnnouncementService {
	List<HashMap<String,Object>> getAnnListByLoc(String locationSeq1, String locationSeq2,int startRow, int endRow);
	
	int selectAnnListCount(String locationSeq1,String locationSeq2);

	
	List<HashMap<String, Object>> getAnnListBycate(String cateSeq1, String cateSeq2, String cateSeq3, int startRow,
			int endRow);
	
	int selectAnnListCountBycate(String cateSeq1, String cateSeq2, String cateSeq3);

	AnnounceMentVO selectBySeq(int annSeq);

	int updateAnnHits(int annSeq);
	
	List<AnnounceMentVO> selectNewAnn();
	
	List<AnnounceMentVO> selectPremiumAnn();
	
	List<Map<String, Object>> selectCountByCategory();
}
