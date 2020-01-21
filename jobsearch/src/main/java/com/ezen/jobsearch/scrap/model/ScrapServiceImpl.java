package com.ezen.jobsearch.scrap.model;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public int mypagebookmarkListDel(int scrapSeq) {
		return scrapDao.mypagebookmarkListDel(scrapSeq);
	}
	
	@Override
	public List<Map<String, Object>> selectmypagebookmarkList(int memberSeq) {
		return scrapDao.selectmypagebookmarkList(memberSeq);
	}

}
