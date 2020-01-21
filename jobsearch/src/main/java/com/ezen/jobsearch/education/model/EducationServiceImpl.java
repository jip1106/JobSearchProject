package com.ezen.jobsearch.education.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EducationServiceImpl implements EducationService{

	@Autowired
	private EducationDAO educationDao;
	
	@Override
	public int insertEducation(EducationVO educationVo) {
		
		return educationDao.insertEducation(educationVo);
	}
	
	
}
