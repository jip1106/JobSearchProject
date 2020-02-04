package com.ezen.jobsearch.apply.model;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<Map<String, Object>> selectmypageapplyList(int memberSeq) {
		return sqlSession.selectList(namespace + "selectmypageapplyList", memberSeq);
	}

	@Override
	public int selectApplyYN(ApplyVO applyVo) {
		return sqlSession.selectOne(namespace+"selectApplyYN", applyVo);
	}

	@Override
	public int deleteApply(int applySeq) {
		return sqlSession.delete(namespace+"deleteApply", applySeq);
	}

	@Override
	public int updateFlag(ApplyVO applyVo) {
		return sqlSession.update(namespace+"updateFlag", applyVo);
	}
	

}
