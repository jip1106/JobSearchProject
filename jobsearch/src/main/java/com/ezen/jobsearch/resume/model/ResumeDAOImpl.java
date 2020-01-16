package com.ezen.jobsearch.resume.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOImpl implements ResumeDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.resumeTest.";
	
	@Override
	public List<ResumeVO> selectResumeList(int memberSeq) {
		// TODO Auto-generated method stub
		
		List<ResumeVO> resumeList = sqlSession.selectList(namespace + "selectResumeList", memberSeq);
		
		return resumeList;
	}

	@Override
	public int selectMyResumeCount(int memberSeq) {
		// TODO Auto-generated method stub
		
		int count = sqlSession.selectOne(namespace+"selectMyResumeCount", memberSeq);
		return count;
	}

	@Override
	public int insertResumeTest(ResumeVO resumeVo) {
		// TODO Auto-generated method stub
		int count = sqlSession.insert(namespace+"insertResumeTest", resumeVo);
		return count;
	}

}
