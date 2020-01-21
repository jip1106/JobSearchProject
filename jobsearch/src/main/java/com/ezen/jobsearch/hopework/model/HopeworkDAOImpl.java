package com.ezen.jobsearch.hopework.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HopeworkDAOImpl implements HopeworkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.homeworkTest.";
	
	@Override
	public int insertHopework(HopeworkVO hopeworkVo) {
		int resultCnt = sqlSession.insert(namespace+"insertHopeworkTest",hopeworkVo);
		
		return resultCnt;
	}

}
