package com.ezen.jobsearch.emptype.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class EmpTypeDAOMybatis implements EmpTypeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.emptype.";
	
	public List<EmpTypeVO> selectEmpType(){
		return sqlSession.selectList(namespace+"selectEmpType");
	}
}
