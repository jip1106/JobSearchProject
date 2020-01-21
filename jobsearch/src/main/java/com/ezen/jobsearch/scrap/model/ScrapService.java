package com.ezen.jobsearch.scrap.model;

import java.util.List;
import java.util.Map;

public interface ScrapService {
	int insertScrap(ScrapVO scrapVo);
	int deleteScrap(ScrapVO scrapVo);
	int selectScrapYN(ScrapVO scrapVo);
	int mypagebookmarkListDel(int scrapSeq);
	List<Map<String, Object>> selectmypagebookmarkList(int memberSeq);
}
