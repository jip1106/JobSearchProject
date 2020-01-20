package com.ezen.jobsearch.viewann.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ViewAnnDAOImpl implements ViewAnnDAO {
	
	private String namespace="config.mybatis.mapper.oracle.viewann.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertViewAnn(ViewAnnVO viewAnnVo) {
		return sqlSession.insert(namespace+"insertViewAnn", viewAnnVo);
	}

	@Override
	public int selectViewAnnYN(ViewAnnVO viewAnnVO) {
		return sqlSession.selectOne(namespace+"selectViewAnnYN", viewAnnVO);
	}

	@Override
	public List<ViewAnnVO> selectViewAnn(int memberSeq) {
		return sqlSession.selectList(namespace+"selectViewAnn", memberSeq);
	}

	@Override
	public int deleteOldView(int memberSeq) {
		return sqlSession.delete(namespace+"deleteOldView", memberSeq);
	}

}
