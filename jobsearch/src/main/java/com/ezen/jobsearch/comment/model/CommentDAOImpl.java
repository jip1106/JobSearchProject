package com.ezen.jobsearch.comment.model;

import org.apache.ibatis.annotations.Insert;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";

	@Override
	public int insertComment(CommentVO commentVo) {
		return sqlSession.insert(namespace+"insertComment", commentVo);
	}
}
