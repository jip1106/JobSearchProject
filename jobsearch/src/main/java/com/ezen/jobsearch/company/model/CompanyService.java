package com.ezen.jobsearch.company.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.payment.model.PaymentVO;
import com.ezen.jobsearch.resume.model.ResumeVO;

public interface CompanyService {
	int insertCompany(CompanyVO companyVo);
	int insertAnn(AnnounceMentVO annVo);
	CompanyVO selectCompany(int memberSeq);
	int updateComMem(MemberVO memberVo);
	int updateComInfo(CompanyVO companyVo);
	List<Map<String,Object>> viewMyAnn(int refCompanyseq);
	String selectComImg(int refCompanyseq);
	int deleteMyAnn(int Annseq);
	AnnounceMentVO viewMyAnnByAnnSeq(int AnnSeq);
	int countMyAnn(int refCompanyseq);
	int selectComSeq(int memberSeq);
	int updateMyAnn(AnnounceMentVO annVo);
	int payMyAnn(PaymentVO paymentVo);
	CompanyVO CompanyDetail(int comSeq);
	List<PaymentVO> CompanyPayList(int memberSeq);
	List<ResumeVO> selectMyAnnApply(int annSeq);
}
