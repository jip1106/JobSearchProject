package com.ezen.jobsearch.company.model;

import java.util.List;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.member.model.MemberVO;

public interface CompanyDAO {
	int insertCompany(CompanyVO companyVo);
	int insertAnn(AnnounceMentVO annVo);
	CompanyVO selectCompany(int memberSeq);
	int updateComMem(MemberVO memberVo);
	int updateComInfo(CompanyVO companyVo);
	List<AnnounceMentVO> viewMyAnn(int refCompanyseq);
}
