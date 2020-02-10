package com.ezen.jobsearch.emptype.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpTypeServiceImpl implements EmpTypeService{
	@Autowired
	private EmpTypeDAO empTypeDao;
		
	@Override
	public List<EmpTypeVO> selectEmpType(){
		return empTypeDao.selectEmpType();
		
	}
}
