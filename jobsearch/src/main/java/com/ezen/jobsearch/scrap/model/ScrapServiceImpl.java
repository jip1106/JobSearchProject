package com.ezen.jobsearch.scrap.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapServiceImpl implements ScrapService {

	@Autowired
	private ScrapDAO scrapDao;
	
	@Override
	public int insertScrap(ScrapVO scrapVo) {
		return scrapDao.insertScrap(scrapVo);
	}

	@Override
	public int deleteScrap(ScrapVO scrapVo) {
		return scrapDao.deleteScrap(scrapVo);
	}

	@Override
	public int selectScrapYN(ScrapVO scrapVo) {
		return scrapDao.selectScrapYN(scrapVo);
	}

}
