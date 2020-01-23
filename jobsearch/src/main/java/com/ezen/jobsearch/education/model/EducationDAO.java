package com.ezen.jobsearch.education.model;

import java.util.List;

public interface EducationDAO {

	int insertEducation(EducationVO educationVo);

	List<EducationVO> selectEduList(String resumeSeq);

	int updateEducation(EducationVO educationVO);

}
