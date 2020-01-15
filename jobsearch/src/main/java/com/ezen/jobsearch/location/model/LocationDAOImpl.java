package com.ezen.jobsearch.location.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationDAOImpl implements LocationDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String nameSpace = "config.mybatis.mapper.oracle.location.";
	
	//지역1 전체정보 가져오기
	@Override
	public List<LocationVO1> selectLocation1() {
		// TODO Auto-generated method stub
		
		List<LocationVO1> locationList = sqlSession.selectList(nameSpace+"selectLocation1");
		//System.out.println(locationList);
		
		
		return locationList;
	}

	@Override
	public List<LocationVO2> selectSubLocList(String locationSeq1) {
		// TODO Auto-generated method stub
		
		List<LocationVO2> subLocationList = sqlSession.selectList(nameSpace+"selectSubLocation",locationSeq1);
			
		return subLocationList;
	}

	@Override
	public String selectLocationName(String locationSeq1) {
		String locationName = sqlSession.selectOne(nameSpace+"selectLocationName",locationSeq1);
		
		return locationName;
	}

	@Override
	public List<String> searchLocNameList(String locationSeq2) {
		// TODO Auto-generated method stub
	
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<String> locList = new ArrayList<String>();
		
		String arr[] = locationSeq2.split(",");
	
		for(int i=0; i<arr.length;i++) {
			locList.add(arr[i]);
		}
	
		map.put("locList",locList);
		
		List<String> returnList = sqlSession.selectList(nameSpace + "searchLocNameList", map);
		
		//System.out.println("LocationDAO : " + returnList);
		
		return returnList;
	}

	

	
	

}
