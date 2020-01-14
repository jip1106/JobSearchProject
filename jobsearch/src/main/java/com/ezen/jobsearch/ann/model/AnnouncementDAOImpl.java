package com.ezen.jobsearch.ann.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "config.mybatis.mapper.oracle.announcement.";
	
	
	@Override
	public List<HashMap<String, Object>> getAnnListByLoc(String locationSeq1, String locationSeq2) {
		// TODO Auto-generated method stub
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		List<String> locList = new ArrayList<String>();
		
		String arr[] = locationSeq2.split(",");
	
		for(int i=0; i<arr.length;i++) {
			locList.add(arr[i]);
		}
		
		
//		System.out.println("DAO locationSeq1 " + locationSeq1);
//		System.out.println("DAO locationList " + locList);
	
		map.put("locationSeq1", locationSeq1);
		map.put("locList",locList);
		
		List<HashMap<String,Object>> returnList = sqlSession.selectList(nameSpace + "selectAnnListByLoc", map);
		
		System.out.println("AnnDAO : " + returnList);
		
		
		return returnList;
	}

}
