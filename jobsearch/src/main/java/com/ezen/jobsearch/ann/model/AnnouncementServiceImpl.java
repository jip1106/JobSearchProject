package com.ezen.jobsearch.ann.model;

import java.util.HashMap;
import java.util.List;

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

}
