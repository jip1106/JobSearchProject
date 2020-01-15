package com.ezen.jobsearch.company.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.company.";
	
	//기업정보 insert
	@Override
	public int insertCompany(CompanyVO companyVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "insertCompany", companyVo);
	}
	
	public int insertAnn(AnnounceMentVO annVo) {
		return sqlSession.insert(namespace+"insertAnn",annVo);
	}

	@Override
	public CompanyVO selectCompany(int memberSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"selectComInfo",memberSeq);
	}

	@Override
	public int updateComMem(MemberVO memberVo) {
		return sqlSession.update(namespace+"updateComMem",memberVo);
	}

	@Override
	public int updateComInfo(CompanyVO companyVo) {
		return sqlSession.update(namespace+"updateComInfo",companyVo);
	}

	@Override
	public List<AnnounceMentVO> viewMyAnn(int refCompanyseq) {
		return sqlSession.selectList(namespace+"selectMyAnn",refCompanyseq);
	}

	@Override
	public String selectComImg(int refCompanyseq) {
		return sqlSession.selectOne(namespace+"selectComImg",refCompanyseq);
	}

	@Override
	public int deleteMyAnn(int Annseq) {
		return sqlSession.delete(namespace+"deleteMyAnn",Annseq);
	}


}
