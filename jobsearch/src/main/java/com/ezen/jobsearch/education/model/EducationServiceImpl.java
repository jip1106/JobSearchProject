package com.ezen.jobsearch.education.model;

import java.util.List;

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

	@Override
	public List<EducationVO> selectEduList(String resumeSeq) {
		// TODO Auto-generated method stub
		return educationDao.selectEduList(resumeSeq);
	}

	@Override
	public int updateEducation(EducationVO educationVO) {
		// TODO Auto-generated method stub
		return educationDao.updateEducation(educationVO);
	}
	
	
}
