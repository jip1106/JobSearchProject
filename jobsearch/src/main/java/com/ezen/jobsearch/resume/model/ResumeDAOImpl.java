package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOImpl implements ResumeDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.resumeTest.";
	private String namespace2 = "config.mybatis.mapper.oracle.resume.";
	
	@Override
	public List<Map<String, Object>> selectCate() {
		return sqlSession.selectList(namespace2+"selectCate");
	}
	
	@Override
	public List<Map<String, Object>> selectLoca() {
		return sqlSession.selectList(namespace2+"selectLoca");
	}
	
	@Override
	public List<Map<String, Object>> selectEmp() {
		return sqlSession.selectList(namespace2+"selectEmp");
	}
	
	@Override
	public List<ResumeVO> resumeList(int memberSeq) {
		return sqlSession.selectList(namespace2+"resumeList", memberSeq);
	}
	

	@Override
	public int resumeListCount(int memberSeq) {
		return sqlSession.selectOne(namespace2+"resumeListCount", memberSeq);
	}

	
	@Override
	public int resumeListDel(int resumeSeq) {
		return sqlSession.delete(namespace2+"resumeListDel", resumeSeq);
	}

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

	@Override
	public Map<String, Object> selectMyResumeInfo(String resumeSeq) {
		// TODO Auto-generated method stub
		
		Map<String,Object> resumeInfo = sqlSession.selectOne(namespace+"selectMyResumeInfo",resumeSeq);
		System.out.println("DAOImpl " + resumeInfo);
		return resumeInfo;
	}


	
}
