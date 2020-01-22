package com.ezen.jobsearch.education.model;

import java.util.List;

public interface EducationService {
	//학력사항 데이터 insert
	int insertEducation(EducationVO educationVo);
	
	//이력서 번호에 맞는 학력사항 데이터
	List<EducationVO> selectEduList(String resumeSeq);

	int updateEducation(EducationVO educationVO);
}
