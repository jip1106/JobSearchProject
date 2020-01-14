package com.ezen.jobsearch.company.model;

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
}
