package com.ezen.jobsearch.company.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.payment.model.PaymentVO;
import com.ezen.jobsearch.resume.model.ResumeVO;

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
	
	@Override
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
	public List<Map<String,Object>> viewMyAnn(int refCompanyseq) {
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

	@Override
	public AnnounceMentVO viewMyAnnByAnnSeq(int AnnSeq) {
		return sqlSession.selectOne(namespace+"selectMyAnnByAnnSeq",AnnSeq);
	}

	@Override
	public int countMyAnn(int refCompanyseq) {
		return sqlSession.selectOne(namespace+"selectMyAnnCount",refCompanyseq);
	}

	@Override
	public int selectComSeq(int memberSeq) {
		return sqlSession.selectOne(namespace+"selectComSeq",memberSeq);
	}

	@Override
	public int updateMyAnn(AnnounceMentVO annVo) {
		return sqlSession.update(namespace+"updateMyAnn",annVo);
	}

	@Override
	public int payMyAnn(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"payMyAnn",paymentVo);
	}

	@Override
	public CompanyVO CompanyDetail(int comSeq) {
		return sqlSession.selectOne(namespace+"CompanyDetail",comSeq);
	}

	@Override
	public List<PaymentVO> CompanyPayList(int memberSeq) {
		return sqlSession.selectList(namespace+"companyPayList",memberSeq);
	}
	@Override
	public List<ResumeVO> selectMyAnnApply(int annSeq){
		return sqlSession.selectList(namespace+"selectMyAnnApply",annSeq);
	}

}
