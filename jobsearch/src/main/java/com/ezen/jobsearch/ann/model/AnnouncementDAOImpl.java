package com.ezen.jobsearch.ann.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "config.mybatis.mapper.oracle.announcement.";
	
	
	@Override
	public List<HashMap<String, Object>> getAnnListByLoc(String locationSeq1, String locationSeq2,int startRow, int endRow) {
		// TODO Auto-generated method stub
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		List<String> locList = new ArrayList<String>();
		
		String arr[] = locationSeq2.split(",");
	
		for(int i=0; i<arr.length;i++) {
			locList.add(arr[i]);
		}
		
		map.put("locationSeq1", locationSeq1);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("locList",locList);
		
		List<HashMap<String,Object>> returnList = sqlSession.selectList(nameSpace + "selectAnnListByLoc", map);
		
		
		
		return returnList;
	}


	@Override
	public int selectAnnListCount(String locationSeq1, String locationSeq2) {
		int count = 0;
		
		//System.out.println("DAO locationSeq2" + locationSeq2 );
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<String> locList = new ArrayList<String>();
		
		String arr[] = locationSeq2.split(",");
		for(int i=0; i<arr.length;i++) {
			locList.add(arr[i]);
		}
		map.put("locationSeq1",locationSeq1);
		map.put("locList",locList);
		
		count = sqlSession.selectOne(nameSpace + "selectAnnListCount",map);
		//System.out.println("AnnDAO count :: " + count);
		
		return count;
	}


	@Override
	public List<HashMap<String, Object>> getAnnListBycate(String cateSeq1, String cateSeq2, String cateSeq3,
			int startRow, int endRow) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		List<String> cateList = new ArrayList<String>();
		
		String arr[] = cateSeq3.split(",");
	
		for(int i=0; i<arr.length;i++) {
			cateList.add(arr[i]);
		}
		
		map.put("cateSeq1", cateSeq1);
		map.put("cateSeq2", cateSeq2);
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("cateList",cateList);
		
		List<HashMap<String,Object>> returnList = sqlSession.selectList(nameSpace + "selectAnnListBycate", map);
				
		
		return returnList;
	}


	@Override
	public int selectAnnListCountBycate(String cateSeq1, String cateSeq2, String cateSeq3) {
		int count = 0;
		
		//System.out.println("DAO locationSeq2" + locationSeq2 );
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<String> cateList = new ArrayList<String>();
		
		String arr[] = cateSeq3.split(",");
		for(int i=0; i<arr.length;i++) {
			cateList.add(arr[i]);
		}
		map.put("cateSeq1",cateSeq1);
		map.put("cateSeq2",cateSeq2);
		map.put("cateList",cateList);
		
		count = sqlSession.selectOne(nameSpace + "selectAnnListCountBycate",map);
		
		System.out.println("AnnDAO count :: " + count);
		
		return count;
	}

	@Override
	public AnnounceMentVO selectBySeq(int annSeq) {
		return sqlSession.selectOne(nameSpace+"selectBySeq", annSeq);
	}

	@Override
	public int updateAnnHits(int annSeq) {
		return sqlSession.update(nameSpace+"updateAnnHits", annSeq);
	}


	@Override
	public List<AnnounceMentVO> selectNewAnn() {
		return sqlSession.selectList(nameSpace+"selectNewAnn");
	}


	@Override
	public List<AnnounceMentVO> selectPremiumAnn() {
		return sqlSession.selectList(nameSpace+"selectPremiumAnn");
	}


	@Override
	public List<Map<String, Object>> selectCountByCategory() {
		return sqlSession.selectList(nameSpace+"selectCountByCategory");
	}

}
