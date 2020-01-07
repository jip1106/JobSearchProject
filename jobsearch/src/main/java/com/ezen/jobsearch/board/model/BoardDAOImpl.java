package com.ezen.jobsearch.board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";
	
	@Override
	public int insertBoard(BoardVO boardVo) {		
		return sqlSession.insert(namespace+"insertBoard", boardVo);
	}

}
