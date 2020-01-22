package com.ezen.jobsearch.mycareer.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycareerDAOImpl implements MycareerDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace ="config.mybatis.mapper.oracle.mycareerTest.";
	
	@Override
	public int insertMycareer(MycareerVO mycareerVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "insertMycareerTest",mycareerVo) ;
	}

	@Override
	public int updateMycareer(MycareerVO mycareerVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateMycareerTest",mycareerVo);
	}

}
