package com.ezen.jobsearch.apply.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAOImpl implements ApplyDAO {
	
	private String namespace="config.mybatis.mapper.oracle.apply.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertApply(ApplyVO applyVo) {
		return sqlSession.insert(namespace+"insertApply", applyVo);
	}
	

}
