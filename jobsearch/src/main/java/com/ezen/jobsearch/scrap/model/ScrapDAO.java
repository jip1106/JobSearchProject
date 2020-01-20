package com.ezen.jobsearch.scrap.model;

public interface ScrapDAO {
	int insertScrap(ScrapVO scrapVo);
	int deleteScrap(ScrapVO scrapVo);
	int selectScrapYN(ScrapVO scrapVo);
}
