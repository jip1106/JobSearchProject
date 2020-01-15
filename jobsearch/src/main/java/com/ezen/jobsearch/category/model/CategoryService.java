package com.ezen.jobsearch.category.model;

import java.util.List;

public interface CategoryService {

	List<CategoryVO1> selectCategory1();

	//두번째 카테고리 리스트
	List<CategoryVO2> selectSubCateList(String cateSeq1);

	//세번째 카테고리 리스트
	List<CategoryVO3> selectThirdCateList(String cateSeq1, String cateSeq2);
	
	String getSearchCateName1(String cateSeq1);
	String getSearchCateName2(String cateSeq2);
	List<String> getSearchCateName3List(String cateSeq3);	

}
