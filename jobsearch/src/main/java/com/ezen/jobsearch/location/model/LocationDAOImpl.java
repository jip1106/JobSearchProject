package com.ezen.jobsearch.location.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

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
		
		System.out.println(subLocationList);
		return subLocationList;
	}
	

	
	

}
