package com.ezen.jobsearch.scrap.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScrapDAOImpl implements ScrapDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.scrap.";

	@Override
	public int insertScrap(ScrapVO scrapVo) {
		return sqlSession.insert(namespace+"insertScrap", scrapVo);
	}

	@Override
	public int deleteScrap(ScrapVO scrapVo) {
		return sqlSession.delete(namespace+"deleteScrap", scrapVo);
	}

	@Override
	public int selectScrapYN(ScrapVO scrapVo) {
		return sqlSession.selectOne(namespace+"selectScrapYN", scrapVo);
	}
	
	
}
