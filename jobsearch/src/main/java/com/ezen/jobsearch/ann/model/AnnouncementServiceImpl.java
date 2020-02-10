package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{

	@Autowired
	private AnnouncementDAO annDao;
	
	@Override
	public List<HashMap<String, Object>> getAnnListByLoc(String locationSeq1, String locationSeq2,int startRow, int endRow) {
		// TODO Auto-generated method stub
		return annDao.getAnnListByLoc(locationSeq1, locationSeq2,startRow, endRow);
	}

	@Override
	public int selectAnnListCount(String locationSeq1, String locationSeq2) {
		// TODO Auto-generated method stub
		return annDao.selectAnnListCount(locationSeq1, locationSeq2);
	}

	@Override

	public List<HashMap<String, Object>> getAnnListBycate(String cateSeq1, String cateSeq2, String cateSeq3,
			int startRow, int endRow) {
		// TODO Auto-generated method stub
		return annDao.getAnnListBycate(cateSeq1, cateSeq2, cateSeq3,startRow, endRow);
	}

	@Override
	public int selectAnnListCountBycate(String cateSeq1, String cateSeq2, String cateSeq3) {
		// TODO Auto-generated method stub
		return annDao.selectAnnListCountBycate(cateSeq1, cateSeq2, cateSeq3);
	}

	@Override
	public AnnounceMentVO selectBySeq(int annSeq) {
		return annDao.selectBySeq(annSeq);
	}

	@Override
	public int updateAnnHits(int annSeq) {
		return annDao.updateAnnHits(annSeq);
	}

	@Override
	public List<AnnounceMentVO> selectNewAnn() {
		return annDao.selectNewAnn();
	}

	@Override
	public List<AnnounceMentVO> selectPremiumAnn() {
		return annDao.selectPremiumAnn();
	}

	@Override
	public List<Map<String, Object>> selectCountByCategory() {
		return annDao.selectCountByCategory();
	}


}
