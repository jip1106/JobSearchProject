package com.ezen.jobsearch.category.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAO categoryDao;
	
	@Override
	public List<CategoryVO1> selectCategory1() {
		
		return categoryDao.selectCategory1();
	}

	@Override
	public List<CategoryVO2> selectSubCateList(String cateSeq1) {
		
		return categoryDao.selectSubCateList(cateSeq1);
	}

	@Override
	public List<CategoryVO3> selectThirdCateList(String cateSeq1, String cateSeq2) {
		
		return categoryDao.selectThirdCateList(cateSeq1, cateSeq2);
	}
	
	@Override
	public String getSearchCateName1(String cateSeq1) {
		// TODO Auto-generated method stub
		return categoryDao.getSearchCateName1(cateSeq1);
	}

	@Override
	public String getSearchCateName2(String cateSeq2) {
		// TODO Auto-generated method stub
		return categoryDao.getSearchCateName2(cateSeq2);
	}

	@Override
	public List<String> getSearchCateName3List(String cateSeq3) {
		// TODO Auto-generated method stub
		return categoryDao.getSearchCateName3List(cateSeq3);
	}	
	
}
