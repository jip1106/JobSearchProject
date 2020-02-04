package com.ezen.jobsearch.comment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.jobsearch.common.SearchVO;

@Repository
public class CommentDAOImpl implements CommentDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";

	@Override
	public int insertComment(CommentVO commentVo) {
		return sqlSession.insert(namespace+"insertComment", commentVo);
	}

	@Override
	public List<Map<String,Object>> selectComment(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectComment", searchVo);
	}

	@Override
	public int deleteComment(int commentSeq) {
		return sqlSession.delete(namespace+"deleteComment", commentSeq);
	}
	
	
	
}
