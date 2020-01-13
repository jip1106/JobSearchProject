package com.ezen.jobsearch.company.model;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;

public interface CompanyService {
	int insertCompany(CompanyVO companyVo);
	int insertAnn(AnnounceMentVO annVo);
}
