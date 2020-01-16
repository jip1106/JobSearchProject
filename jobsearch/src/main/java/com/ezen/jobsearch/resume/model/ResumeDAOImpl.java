package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOImpl implements ResumeDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.resume.";
	
	
	@Override
	public List<Map<String, Object>> selectEmp() {
		return sqlSession.selectList(namespace+"selectEmp");
	}


	@Override
	public List<Map<String, Object>> selectCate() {
		return sqlSession.selectList(namespace+"selectCate");
	}


	@Override
	public List<Map<String, Object>> selectLoca() {
		return sqlSession.selectList(namespace+"selectLoca");
	}
	
}
