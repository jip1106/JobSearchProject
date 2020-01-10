package com.ezen.jobsearch.category.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "config.mybatis.mapper.oracle.category.";
	
	@Override
	public List<CategoryVO1> selectCategory1() {
		// TODO Auto-generated method stub
		
		List<CategoryVO1> categoryList = sqlSession.selectList(nameSpace + "selectCategory1");
		
		return categoryList;
	}
	
	@Override
	public List<CategoryVO2> selectSubCateList(String cateSeq1) {
		
		List<CategoryVO2> subCateList2 = sqlSession.selectList(nameSpace + "selectCategory2",cateSeq1);
		
		return subCateList2;
	}

	@Override
	public List<CategoryVO3> selectThirdCateList(String cateSeq1, String cateSeq2) {
		
		HashMap<String, Object> cateMap = new HashMap<String,Object>();
		
		cateMap.put("cateSeq1",cateSeq1);
		cateMap.put("cateSeq2",cateSeq2);
		
		
		List<CategoryVO3> thridCateList = sqlSession.selectList(nameSpace + "selectCategory3",cateMap);
		
		System.out.println(thridCateList);
		
		return thridCateList;
	}

}
