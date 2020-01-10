package com.ezen.jobsearch.category.model;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface CategoryDAO {

	List<CategoryVO1> selectCategory1();

	List<CategoryVO2> selectSubCateList(String cateSeq1);

	List<CategoryVO3> selectThirdCateList(String cateSeq1, String cateSeq2);

}
