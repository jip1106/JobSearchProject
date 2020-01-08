package com.ezen.jobsearch.board.model;

import java.util.List;

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

	@Override
	public List<BoardVO> selectBoard(String boardType) {
		return sqlSession.selectList(namespace+"selectBoard", boardType);
	}

	@Override
	public int deleteBoard(int boardSeq) {
		return sqlSession.delete(namespace+"deleteBoard", boardSeq);
	}

}
