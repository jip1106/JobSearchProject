package com.ezen.jobsearch.education.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EducationDAOImpl implements EducationDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "config.mybatis.mapper.oracle.educationTest.";
	
	@Override
	public int insertEducation(EducationVO educationVo) {
		// TODO Auto-generated method stub
		int resultCnt = sqlSession.insert(nameSpace + "insertEducationTest" , educationVo);
		return resultCnt;
	}

}
