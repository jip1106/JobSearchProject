package com.ezen.jobsearch.company.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.payment.model.PaymentVO;
import com.ezen.jobsearch.resume.model.ResumeVO;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDao;
	
	@Override
	public int insertCompany(CompanyVO companyVo) {
		// TODO Auto-generated method stub
		return companyDao.insertCompany(companyVo);
	}
	@Override
	public int insertAnn(AnnounceMentVO annVo) {
		return companyDao.insertAnn(annVo);
	}
	@Override
	public CompanyVO selectCompany(int memberSeq) {
		return companyDao.selectCompany(memberSeq);
	}
	@Override
	public int updateComMem(MemberVO memberVo) {
		return companyDao.updateComMem(memberVo);
	}
	@Override
	public int updateComInfo(CompanyVO companyVo) {
		return companyDao.updateComInfo(companyVo);
	}
	@Override
	public List<Map<String,Object>> viewMyAnn(int refCompanyseq){
		return companyDao.viewMyAnn(refCompanyseq);
	}
	@Override
	public String selectComImg(int refCompanyseq) {
		return companyDao.selectComImg(refCompanyseq);
	}
	@Override
	public int deleteMyAnn(int Annseq) {
		return companyDao.deleteMyAnn(Annseq);
	}
	@Override
	public AnnounceMentVO viewMyAnnByAnnSeq(int AnnSeq) {
		return companyDao.viewMyAnnByAnnSeq(AnnSeq);
	}
	@Override
	public int countMyAnn(int refCompanyseq) {
		return companyDao.countMyAnn(refCompanyseq);
	}
	@Override
	public int selectComSeq(int memberSeq) {
		return companyDao.selectComSeq(memberSeq);
	}
	@Override
	public int updateMyAnn(AnnounceMentVO annVo) {
		return companyDao.updateMyAnn(annVo);
	}
	@Override
	public int payMyAnn(PaymentVO paymentVo) {
		return companyDao.payMyAnn(paymentVo);
	}
	@Override
	public CompanyVO CompanyDetail(int comSeq) {
		return companyDao.CompanyDetail(comSeq);
	}
	@Override
	public List<PaymentVO> CompanyPayList(int memberSeq) {
		return companyDao.CompanyPayList(memberSeq);
	}
	@Override
	public List<ResumeVO> selectMyAnnApply(int annSeq){
		return companyDao.selectMyAnnApply(annSeq);
	}
}
