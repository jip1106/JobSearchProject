package com.ezen.jobsearch.education.model;

import java.util.List;

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

	@Override
	public List<EducationVO> selectEduList(String resumeSeq) {
		// TODO Auto-generated method stub
		List<EducationVO> eduList = sqlSession.selectList(nameSpace+"selectEduListTest", resumeSeq);
		return eduList;
	}

	@Override
	public int updateEducation(EducationVO educationVO) {
		int cnt = sqlSession.update(nameSpace + "updateEducationTest" , educationVO);
		return cnt;
	}

}
