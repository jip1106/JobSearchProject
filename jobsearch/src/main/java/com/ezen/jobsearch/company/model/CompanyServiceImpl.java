package com.ezen.jobsearch.company.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDao;
	
	@Override
	public int insertCompany(CompanyVO companyVo) {
		// TODO Auto-generated method stub
		return companyDao.insertCompany(companyVo);
	}
	public int insertAnn(AnnounceMentVO annVo) {
		return companyDao.insertAnn(annVo);
	}
	public CompanyVO selectCompany(int memberSeq) {
		return companyDao.selectCompany(memberSeq);
	}
	public int updateComMem(MemberVO memberVo) {
		return companyDao.updateComMem(memberVo);
	}
	public int updateComInfo(CompanyVO companyVo) {
		return companyDao.updateComInfo(companyVo);
	}
	public List<AnnounceMentVO> viewMyAnn(int refCompanyseq){
		return companyDao.viewMyAnn(refCompanyseq);
	}
	public String selectComImg(int refCompanyseq) {
		return companyDao.selectComImg(refCompanyseq);
	}
	public int deleteMyAnn(int Annseq) {
		return companyDao.deleteMyAnn(Annseq);
	}
	public AnnounceMentVO viewMyAnnByAnnSeq(int AnnSeq) {
		return companyDao.viewMyAnnByAnnSeq(AnnSeq);
	}
	public int countMyAnn(int refCompanyseq) {
		return companyDao.countMyAnn(refCompanyseq);
	}
	public int selectComSeq(int memberSeq) {
		return companyDao.selectComSeq(memberSeq);
	}
	public int updateMyAnn(AnnounceMentVO annVo) {
		return companyDao.updateMyAnn(annVo);
	}
}
