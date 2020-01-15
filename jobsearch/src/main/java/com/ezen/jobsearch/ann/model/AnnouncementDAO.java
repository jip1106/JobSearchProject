package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;

public interface AnnouncementDAO {
	//지역별 공고 리스트
	List<HashMap<String,Object>> getAnnListByLoc(String locationSeq1, String locationSeq2,int startRow, int endRow);
	//지역별 공고 카운트
	int selectAnnListCount(String locationSeq1, String locationSeq2);

	
	//직업별 공고 리스트
	List<HashMap<String, Object>> getAnnListBycate(String cateSeq1, String cateSeq2, String cateSeq3, int startRow,
			int endRow);
	//직업별 공고 카운트
	int selectAnnListCountBycate(String cateSeq1, String cateSeq2, String cateSeq3);
	
	

	AnnounceMentVO selectBySeq(int annSeq);

	
}
