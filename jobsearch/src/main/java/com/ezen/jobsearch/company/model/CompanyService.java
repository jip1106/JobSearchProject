package com.ezen.jobsearch.company.model;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;

public interface CompanyService {
	int insertCompany(CompanyVO companyVo);
	int insertAnn(AnnounceMentVO annVo);
	CompanyVO selectCompany(int memberSeq);
	int updateComMem(MemberVO memberVo);
	int updateComInfo(CompanyVO companyVo);
}
