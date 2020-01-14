package com.ezen.jobsearch.company.model;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;

public interface CompanyDAO {
	int insertCompany(CompanyVO companyVo);
	int insertAnn(AnnounceMentVO annVo);
	CompanyVO selectCompany(int memberSeq);
}
