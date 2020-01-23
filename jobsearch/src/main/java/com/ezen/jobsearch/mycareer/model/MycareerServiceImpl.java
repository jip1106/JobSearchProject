package com.ezen.jobsearch.mycareer.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MycareerServiceImpl implements MycareerService{

	@Autowired
	private MycareerDAO mycareerDao;
	
	@Override
	public int insertMycareer(MycareerVO mycareerVo) {
		// TODO Auto-generated method stub
		return mycareerDao.insertMycareer(mycareerVo);
	}

	@Override
	public int updateMycareer(MycareerVO mycareerVo) {
		// TODO Auto-generated method stub
		return mycareerDao.updateMycareer(mycareerVo);
	}

}
