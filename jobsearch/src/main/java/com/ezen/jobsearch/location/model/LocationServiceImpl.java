package com.ezen.jobsearch.location.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	private LocationDAO locationDao;
	
	
	@Override
	public List<LocationVO1> selectLocation1() {
		// TODO Auto-generated method stub
		return locationDao.selectLocation1();
	}


	//ajax로 두번째 지역 리스트 가져오기
	@Override
	public List<LocationVO2> selectSubLocList(String locationSeq1) {
		// TODO Auto-generated method stub
		return locationDao.selectSubLocList(locationSeq1);
	}


	@Override
	public String selectLocationName(String locationSeq1) {
		// TODO Auto-generated method stub
		return locationDao.selectLocationName(locationSeq1);
	}


	@Override
	public List<String> searchLocNameList(String locationSeq2) {
		// TODO Auto-generated method stub
		return locationDao.searchLocNameList(locationSeq2);
	}



}
